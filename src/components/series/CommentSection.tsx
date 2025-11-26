"use client";
import { useState, useEffect, useRef } from "react"

// Data 20 komentar simulasi
const MOCK_COMMENTS = [
    { id: 1, author: "Ahmad Rizki", avatar: "AR", text: "Donghua ini keren banget! Animasi dan ceritanya sangat memukau.", likes: 12, date: "2 jam lalu" },
    { id: 2, author: "Siti Nurhaliza", avatar: "SN", text: "Episode ini bikin nangis, sedih banget pas bagian itu 😭", likes: 8, date: "5 jam lalu" },
    { id: 3, author: "Budi Santoso", avatar: "BS", text: "Karakter utamanya sangat inspiratif, kerja keras mengalahkan bakat!", likes: 15, date: "1 hari lalu" },
    { id: 4, author: "Dewi Lestari", avatar: "DL", text: "CGI nya makin bagus tiap episode, studio nya kerja keras banget", likes: 6, date: "1 hari lalu" },
    { id: 5, author: "Eko Prasetyo", avatar: "EP", text: "Musik background nya bikin merinding, cocok banget sama suasananya", likes: 10, date: "2 hari lalu" },
    { id: 6, author: "Fitri Handayani", avatar: "FH", text: "Pengen nonton terus tapi harus nunggu seminggu lagi 😤", likes: 20, date: "2 hari lalu" },
    { id: 7, author: "Gunawan Wijaya", avatar: "GW", text: "Plot twist nya gak ketebak sama sekali, penulis cerita nya jenius!", likes: 18, date: "3 hari lalu" },
    { id: 8, author: "Hani Putri", avatar: "HP", text: "Dari semua donghua yang pernah ditonton, ini masuk top 3", likes: 14, date: "3 hari lalu" },
    { id: 9, author: "Irfan Hakim", avatar: "IH", text: "Voice actor nya keren, dubbing nya sangat menghayati karakter", likes: 9, date: "4 hari lalu" },
    { id: 10, author: "Jasmine Tan", avatar: "JT", text: "Adegan pertarungannya epic banget! Smooth animation nya juara", likes: 22, date: "4 hari lalu" },
    { id: 11, author: "Kevin Anggara", avatar: "KA", text: "Karakternya berkembang dengan natural, bukan power up tiba-tiba", likes: 11, date: "5 hari lalu" },
    { id: 12, author: "Lia Amelia", avatar: "LA", text: "Worldbuilding nya detail banget, kerasa hidup dunianya", likes: 16, date: "5 hari lalu" },
    { id: 13, author: "Muhammad Fadil", avatar: "MF", text: "Episode ini bikin deg-degan dari awal sampai akhir!", likes: 13, date: "6 hari lalu" },
    { id: 14, author: "Nadia Putri", avatar: "NP", text: "Hubungan antar karakternya natural, bukan forced relationship", likes: 7, date: "6 hari lalu" },
    { id: 15, author: "Omar Bakri", avatar: "OB", text: "Kualitas produksi nya konsisten, jarang ada studio sekonsisten ini", likes: 19, date: "1 minggu lalu" },
    { id: 16, author: "Putri Maharani", avatar: "PM", text: "Ceritanya lebih kompleks dari yang dikira, ada banyak layer", likes: 12, date: "1 minggu lalu" },
    { id: 17, author: "Qori Sandika", avatar: "QS", text: "Tidak sabar nunggu season depan, semoga cepat rilis!", likes: 25, date: "1 minggu lalu" },
    { id: 18, author: "Rina Susanti", avatar: "RS", text: "Donghua ini bikin ketagihan, udah nonton 3x masih seru", likes: 8, date: "2 minggu lalu" },
    { id: 19, author: "Surya Kusuma", avatar: "SK", text: "Dari sini keliatan budget produksi nya gede, worth it!", likes: 14, date: "2 minggu lalu" },
    { id: 20, author: "Tania Wijaya", avatar: "TW", text: "Donghua terbaik tahun ini! Semua aspeknya hampir sempurna", likes: 30, date: "2 minggu lalu" },
];

export default function CommentSection() {
    const [name, setName] = useState("");
    const [commentText, setCommentText] = useState("");
    const [displayedComments, setDisplayedComments] = useState<typeof MOCK_COMMENTS>([]);
    const [currentIndex, setCurrentIndex] = useState(10);
    const [loading, setLoading] = useState(false);
    const commentsEndRef = useRef<HTMLDivElement>(null);
    const listRef = useRef<HTMLDivElement>(null);

    // Load 10 komentar pertama saat mount
    useEffect(() => {
        setDisplayedComments(MOCK_COMMENTS.slice(0, 10));
    }, []);

    // Infinite scroll handler
    const handleScroll = () => {
        if (!listRef.current) return;
        
        const { scrollTop, scrollHeight, clientHeight } = listRef.current;
        
        // Jika scroll hampir sampai bawah (90%)
        if (scrollTop + clientHeight >= scrollHeight * 0.9 && !loading && currentIndex < MOCK_COMMENTS.length) {
            loadMoreComments();
        }
    };

    const loadMoreComments = () => {
        setLoading(true);
        
        // Simulasi loading
        setTimeout(() => {
            const nextComments = MOCK_COMMENTS.slice(currentIndex, currentIndex + 5);
            setDisplayedComments(prev => [...prev, ...nextComments]);
            setCurrentIndex(prev => prev + 5);
            setLoading(false);
        }, 1000);
    };

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
    
        // Buat avatar dari initial nama
        const getInitials = (name: string) => {
            return name
                .split(' ')
                .map(word => word[0])
                .join('')
                .toUpperCase()
                .slice(0, 2);
        };
        
        // Buat komentar baru
        const newComment = {
            id: Date.now(), // ID unik menggunakan timestamp
            author: name,
            avatar: getInitials(name),
            text: commentText,
            likes: 0,
            date: "Baru saja"
        };
        
        // ✅ Tambahkan komentar baru di paling atas
        setDisplayedComments(prev => [newComment, ...prev]);
        
        // Reset form
        setName("");
        setCommentText("");
        
        // Optional: Scroll ke atas untuk lihat komentar baru
        if (listRef.current) {
            listRef.current.scrollTop = 0;
        }
        
        // Optional: Tampilkan notifikasi sukses
        alert("Komentar berhasil ditambahkan!");
    };

    const handleReply = (author: String) => {
        return () => {
            setCommentText(`@${author} `);
        };
    };

    return (
        <section className="dl-comments-section">
            <div className="dl-comments-header-form">
                <div className="dl-comments-header">
                    <h2>Komentar</h2>
                    <span className="dl-comments-count">{MOCK_COMMENTS.length} Komentar</span>
                </div>

                <div className="dl-comment-form">
                    <div className="dl-comment-avatar">
                        <div className="dl-avatar-placeholder">
                            <i className="fas fa-user"></i>
                        </div>
                    </div>
                    <form onSubmit={handleSubmit}>
                        <input
                            type="text"
                            placeholder="Nama kamu..."
                            value={name}
                            onChange={(e) => setName(e.target.value)}
                            className="dl-comment-name-input"
                            required
                        />
                        <textarea
                            placeholder="Tulis komentarmu di sini..."
                            value={commentText}
                            onChange={(e) => setCommentText(e.target.value)}
                            required
                        ></textarea>
                        <button type="submit" className="dl-btn-primary">Kirim</button>
                    </form>
                </div>
            </div>
            <div className="dl-comments-list-container">
                <div 
                    className="dl-comments-list" 
                    ref={listRef}
                    onScroll={handleScroll}
                >
                    {displayedComments.map((comment) => (
                        <div key={comment.id} className="dl-comment">
                            <div className="dl-comment-avatar">
                                <div className="dl-avatar-placeholder">{comment.avatar}</div>
                            </div>
                            <div className="dl-comment-content">
                                <div className="dl-comment-header">
                                    <span className="dl-comment-author">{comment.author}</span>
                                    <span className="dl-comment-date">{comment.date}</span>
                                </div>
                                <div className="dl-comment-text">
                                    {comment.text}
                                </div>
                                <div className="dl-comment-actions">
                                    <button className="dl-comment-like">
                                        <i className="fas fa-thumbs-up"></i> {comment.likes}
                                    </button>
                                    <button className="dl-comment-reply" onClick={handleReply(comment.author)}>Balas</button>
                                </div>
                            </div>
                        </div>
                    ))}
                    
                    {loading && (
                        <div className="dl-comments-loading">
                            <div className="spinner"></div>
                            <span>Memuat komentar...</span>
                        </div>
                    )}
                    
                    {currentIndex >= MOCK_COMMENTS.length && (
                        <div className="dl-comments-end">
                            {/* <i className="fas fa-check-circle"></i> */}
                            <span>{MOCK_COMMENTS.length === 0 ? "Belum ada komentar" : "Tidak ada komentar lagi"}</span>
                        </div>
                    )}
                    
                    <div ref={commentsEndRef} />
                </div>
            </div>
        </section>
    );
}