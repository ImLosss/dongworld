import './top-donation.css';

export default async function TopDonation() {
    let donatorsList: { name: string; amount: number }[] = [];

    try {
        // Mengambil data dari endpoint
        // Menggunakan next: { revalidate: 300 } agar cache diperbarui tiap 5 menit 
        // (Anda bisa ganti 'cache: "no-store"' jika ingin 100% real-time terus)
        const response = await fetch('http://212.85.25.245:2050/top-donatur', {
            headers: {
                'sb-webhook-token': 'sbwhook-lwatbodiymchocuj2fdbt1qs'
            },
            next: { revalidate: 300 } 
        });

        if (!response.ok) {
            return null; // Gagal fetch, batalkan render
        }

        const data = await response.json();

        // Mengubah format Objek { "Nama": 1000 } menjadi Array [{ name: "Nama", amount: 1000 }]
        donatorsList = Object.entries(data).map(([name, amount]) => ({
            name,
            amount: Number(amount)
        }));

        // Jika data dari API kosong, batalkan render
        if (donatorsList.length === 0) {
            return null;
        }

    } catch (error) {
        // Jika server API mati / gagal terhubung, jangan tampilkan apa-apa
        return null;
    }

    const formatIDR = (amount: number) => {
        return new Intl.NumberFormat('id-ID', {
            style: 'currency',
            currency: 'IDR',
            minimumFractionDigits: 0
        }).format(amount);
    };

    return (
        <section id="top-donation" className="dl-section">
            <div className="dl-donation-container">
                
                <div className="dl-donation-header">
                    <h2>
                        <i className="fas fa-crown" style={{ color: '#FFD700', marginRight: '8px' }}></i>
                        Top Donatur
                    </h2>
                </div>

                <div className="dl-donation-list">
                    {donatorsList.map((donator, index) => {
                        const rank = index + 1;
                        const rankClass = rank <= 3 ? `rank-${rank}` : 'rank-normal';
                        
                        return (
                            // Menggunakan kombinasi nama dan index sebagai key untuk mencegah error duplikat
                            <div key={`${donator.name}-${index}`} className={`dl-donator-item ${rankClass}`}>
                                <div className="dl-donator-rank">
                                    {rank}
                                </div>
                                
                                <div className="dl-donator-info">
                                    <span className="dl-donator-name">{donator.name}</span>
                                    <span className="dl-donator-amount">{formatIDR(donator.amount)}</span>
                                </div>

                                {rank <= 3 && (
                                    <i className={`fas fa-medal dl-donator-medal`}></i>
                                )}
                            </div>
                        );
                    })}
                </div>

                <div className="dl-donation-footer">
                    <a href="https://sociabuzz.com/dongworld/tribe" target="_blank" rel="noopener noreferrer" className="dl-btn-primary dl-btn-donate-full">
                        <i className="fas fa-heart" style={{ marginRight: '5px' }}></i> Donate
                    </a>
                </div>

            </div>
        </section>
    );
}