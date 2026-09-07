"use client";

import { useState, useEffect } from "react";
import './style.css';
import { checkTransactionStatus, createQrisTransaction } from "./action";

export default function DonateForm() {
    const [amount, setAmount] = useState<number>(25000);
    const [customAmount, setCustomAmount] = useState<string>("");
    
    const [name, setName] = useState("");
    const [isAnonim, setIsAnonim] = useState(false);
    
    const [email, setEmail] = useState("");
    const [hideEmail, setHideEmail] = useState(false);
    
    const [message, setMessage] = useState("");
    
    const [loading, setLoading] = useState(false);
    const [qrData, setQrData] = useState<any>(null);
    const [isSuccess, setIsSuccess] = useState(false);

    // Load data dari LocalStorage saat halaman dimuat
    useEffect(() => {
        const savedName = localStorage.getItem("commenterName");
        const savedEmail = localStorage.getItem("donateEmail");
        const savedMessage = localStorage.getItem("donateMessage");
        const savedAnonim = localStorage.getItem("donateAnonim");
        const savedHideEmail = localStorage.getItem("donateHideEmail");

        if (savedAnonim === "true") {
            setIsAnonim(true);
            setName("Someone");
        } else if (savedName) {
            setName(savedName);
        }

        if (savedEmail) setEmail(savedEmail);
        if (savedMessage) setMessage(savedMessage);
        if (savedHideEmail === "true") setHideEmail(true);
    }, []);

    // Masking email function
    const maskEmail = (mail: string) => {
        if (!mail) return "";
        const [namePart, domain] = mail.split("@");
        if (!domain) return mail;
        const visible = Math.min(4, Math.ceil(namePart.length / 2));
        const masked = namePart.substring(0, visible) + "*".repeat(Math.max(4, namePart.length - visible));
        return `${masked}@${domain}`;
    };

    const handleNominalClick = (val: number) => {
        setAmount(val);
        setCustomAmount("");
    };

    const handleCustomAmount = (e: React.ChangeEvent<HTMLInputElement>) => {
        const val = e.target.value.replace(/[^0-9]/g, '');
        setCustomAmount(val);
        setAmount(Number(val));
    };

    // Fungsi handle checkbox Anonim
    const handleAnonimChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const checked = e.target.checked;
        setIsAnonim(checked);
        if (checked) {
            setName("Someone");
        } else {
            // Kembalikan nama dari localStorage jika checkbox dilepas
            setName(localStorage.getItem("commenterName") || ""); 
        }
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (amount < 1000) return alert("Minimal donasi Rp 1.000");
        if (!email) return alert("Email wajib diisi!");

        // Simpan inputan ke LocalStorage
        if (!isAnonim) localStorage.setItem("commenterName", name);
        localStorage.setItem("donateEmail", email);
        localStorage.setItem("donateMessage", message);
        localStorage.setItem("donateAnonim", isAnonim.toString());
        localStorage.setItem("donateHideEmail", hideEmail.toString());

        setLoading(true);

        const finalName = isAnonim ? "Someone" : name;
        const finalEmail = hideEmail ? maskEmail(email) : email;

        try {
            const result = await createQrisTransaction({ amount });
            
            if (result.success && result.payment) {
                setQrData({
                    ...result.payment,
                    supporter: finalName,
                    email: finalEmail,
                    message: message
                });
            } else {
                alert("Gagal memuat QRIS: " + result.error);
            }
        } catch (error) {
            alert("Terjadi kesalahan sistem.");
        } finally {
            setLoading(false);
        }
    };

    // Polling Interval Cek Status
    useEffect(() => {
        let isMounted = true;
        let timeoutId: NodeJS.Timeout;

        const pollStatus = async () => {
            if (!isMounted || !qrData || isSuccess) return;

            try {
                const statusData = await checkTransactionStatus({
                    order_id: qrData.order_id,
                    amount: qrData.amount, 
                    supporter: qrData.supporter,
                    email: qrData.email,
                    message: qrData.message,
                    total_payment: qrData.total_payment
                });
                
                if (statusData.status === "completed") {
                    setIsSuccess(true);
                    return; 
                }
            } catch (error) {
                console.error("Check error", error);
            }

            if (isMounted && !isSuccess) {
                timeoutId = setTimeout(pollStatus, 5000);
            }
        };

        if (qrData && !isSuccess) {
            pollStatus();
        }

        return () => {
            isMounted = false;
            clearTimeout(timeoutId);
        };
    }, [qrData, isSuccess]);

    return (
        <section id="donate-form" className="dl-section">
            <div className="dl-donate-note">
                <i className="fas fa-info-circle"></i>
                <div>
                    Metode pembayaran yang tersedia saat ini hanya <strong>QRIS</strong>. 
                    Untuk metode lain (Gopay, OVO, Dana, dll), silakan berdonasi melalui <a href="https://sociabuzz.com/dongworld" target="_blank" rel="noopener noreferrer" style={{color: 'var(--primary-color)'}}>Sociabuzz Dongworld</a>.<br/><br/>
                    <em>*Jika ada kendala pembayaran, harap lapor ke channel telegram <a href="https://t.me/dongworld" target="_blank" style={{color: 'white'}}>@dongworld</a></em>
                </div>
            </div>

            <div className="dl-donate-container">
                <div className="dl-donate-header">
                    <h2>Dukung Kami</h2>
                    <p>Dukunganmu sangat membantu kami agar dapat rilis lebih cepat! 🙏</p>
                </div>

                {isSuccess ? (
                    <div className="dl-success-state">
                        <i className="fas fa-check-circle"></i>
                        <h3>Donasi Berhasil!</h3>
                        <p style={{ color: 'var(--gray-color)', marginTop: '10px' }}>Terima kasih banyak atas dukungan Anda.</p>
                        <button onClick={() => window.location.reload()} className="dl-btn-primary" style={{ marginTop: '20px' }}>Donasi Lagi</button>
                    </div>
                ) : qrData ? (
                    <div className="dl-qr-section">
                        <h3>Scan QRIS</h3>
                        <p style={{ color: 'var(--gray-color)', fontSize: '0.9rem' }}>Scan menggunakan aplikasi M-Banking atau E-Wallet Anda (Gopay, Ovo, Dana, dll)</p>
                        
                        <div className="dl-qr-image">
                            <img src={`https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=${encodeURIComponent(qrData.payment_number)}`} alt="QRIS" />
                        </div>

                        <div className="dl-qr-total">
                            Rp {new Intl.NumberFormat('id-ID').format(qrData.total_payment)}
                        </div>
                        <p style={{ color: '#FFD700', fontSize: '0.8rem' }}>*Nominal di atas sudah termasuk biaya layanan (fee)</p>

                        <div className="dl-checking-status">
                            <div className="dl-spinner-small"></div>
                            Menunggu pembayaran...
                        </div>
                    </div>
                ) : (
                    <form onSubmit={handleSubmit}>
                        <div className="dl-form-group">
                            <label className="dl-form-label">Nominal Donasi (QRIS)</label>
                            <div className="dl-nominal-grid">
                                {[10000, 25000, 50000, 100000, 200000].map(val => (
                                    <div 
                                        key={val} 
                                        className={`dl-nominal-chip ${amount === val && customAmount === "" ? 'active' : ''}`}
                                        onClick={() => handleNominalClick(val)}
                                    >
                                        {val / 1000}rb
                                    </div>
                                ))}
                            </div>
                            <input 
                                type="text" 
                                className="dl-form-input" 
                                placeholder="Atau masukkan nominal lain..." 
                                value={customAmount}
                                onChange={handleCustomAmount}
                                style={{ marginTop: '10px' }}
                            />
                        </div>

                        <div className="dl-form-group">
                            <label className="dl-form-label">Nama</label>
                            <input 
                                type="text" 
                                className="dl-form-input" 
                                placeholder="Nama Anda" 
                                value={name}
                                onChange={e => setName(e.target.value)}
                                disabled={isAnonim}
                                required={!isAnonim}
                            />
                            <div className="dl-checkbox-wrapper">
                                <input type="checkbox" id="anonim" checked={isAnonim} onChange={handleAnonimChange} />
                                <label htmlFor="anonim">Sembunyikan nama (Anonim)</label>
                            </div>
                        </div>

                        <div className="dl-form-group">
                            <label className="dl-form-label">Email <span style={{ color: '#FF3D4D', fontSize: '1.2rem', verticalAlign: 'middle' }}>*</span></label>
                            <input 
                                type="email" 
                                className="dl-form-input" 
                                placeholder="Email Anda" 
                                value={email}
                                onChange={e => setEmail(e.target.value)}
                                required
                            />
                            <div className="dl-checkbox-wrapper">
                                <input type="checkbox" id="hideEmail" checked={hideEmail} onChange={(e) => setHideEmail(e.target.checked)} />
                                <label htmlFor="hideEmail">Sembunyikan email saya</label>
                            </div>
                        </div>

                        <div className="dl-form-group">
                            <label className="dl-form-label">Pesan Dukungan <span style={{ color: 'var(--gray-color)', fontSize: '0.8rem' }}>(Opsional)</span></label>
                            <textarea 
                                className="dl-form-textarea" 
                                placeholder="Tulis pesan semangat untuk admin..."
                                value={message}
                                onChange={e => setMessage(e.target.value)}
                            ></textarea>
                        </div>

                        <button type="submit" className="dl-btn-primary" style={{ width: '100%', padding: '12px' }} disabled={loading}>
                            {loading ? "Memproses..." : "Lanjut Bayar"}
                        </button>
                    </form>
                )}
            </div>
        </section>
    );
}