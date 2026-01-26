"use client";
import { useState, useEffect, useRef } from "react"

function formatRelativeTime(date: string) {
    const now = Date.now();
    const then = new Date(date).getTime();
    const diff = now - then;

    const minutes = Math.floor(diff / 60000);
    const hours = Math.floor(diff / 3600000);
    const days = Math.floor(diff / 86400000);
    const weeks = Math.floor(diff / 604800000);

    const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });

    if (minutes < 1) return rtf.format(-1, "minute");
    if (minutes < 60) return rtf.format(-minutes, "minute");
    if (hours < 24) return rtf.format(-hours, "hour");
    if (days < 7) return rtf.format(-days, "day");
    return rtf.format(-weeks, "week");
}

type Comment = {
    id: number;
    name: string;
    content: string;
    is_admin: boolean;
    created_at: string;
};

export default function CommentSection({ comments, slug }: { comments: Comment[], slug: string }) {
    const getCommenterName = () => {
        if (typeof window !== 'undefined') {
            const saved = localStorage.getItem(`commenterName`);
            return saved ? saved : "";
        }
        return "";
    };
    
    const [name, setName] = useState(getCommenterName());
    const [commentText, setCommentText] = useState("");
    const [displayedComments, setDisplayedComments] = useState<Comment[]>([]);
    const [currentIndex, setCurrentIndex] = useState(10);
    const [loading, setLoading] = useState(false);
    const commentsEndRef = useRef<HTMLDivElement>(null);
    const listRef = useRef<HTMLDivElement>(null);

    // Load 10 komentar pertama saat mount
    useEffect(() => {
        setDisplayedComments(comments.slice(0, 10));
    }, [comments]);

    // Infinite scroll handler
    const handleScroll = () => {
        if (!listRef.current) return;
        
        const { scrollTop, scrollHeight, clientHeight } = listRef.current;
        
        // Jika scroll hampir sampai bawah (90%)
        if (scrollTop + clientHeight >= scrollHeight * 0.9 && !loading && currentIndex < comments.length) {
            loadMoreComments();
        }
    };

    const getInitials = (name: string) => {
        return name
            .split(' ')
            .map(word => word[0])
            .join('')
            .toUpperCase()
            .slice(0, 2);
    };

    const loadMoreComments = () => {
        setLoading(true);
        
        // Simulasi loading
        setTimeout(() => {
            const nextComments = comments.slice(currentIndex, currentIndex + 5);
            setDisplayedComments(prev => [...prev, ...nextComments]);
            setCurrentIndex(prev => prev + 5);
            setLoading(false);
        }, 1000);
    };

    const handleSubmit = async (e: React.FormEvent) => {
        e.preventDefault();

        localStorage.setItem("commenterName", name);
        const lastCommentDate = localStorage.getItem("lastCommentDate") || null;

        // block komentar jika terlalu sering
        if (lastCommentDate) {
            const lastDate = new Date(lastCommentDate);
            const now = new Date();
            const diff = now.getTime() - lastDate.getTime();
            if (diff < 10000) {
                alert("Tolong tunggu beberapa saat sebelum mengirim komentar lagi.");
                return;
            }
        }

        try {
            const res = await fetch("/api/comments", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    name,
                    comment: commentText,
                    slug,
                }),
            });

            if (!res.ok) throw new Error("Gagal kirim komentar");

            localStorage.setItem("lastCommentDate", new Date().toISOString());

            const newComment: Comment = (await res.json()).comment;

            setDisplayedComments(prev => [newComment, ...prev]);
            setCommentText("");

            if (listRef.current) listRef.current.scrollTop = 0;

        } catch (err) {
            console.error(err);
            alert("Komentar gagal ditambahkan!");
        }
    };

    const handleReply = (author: string) => {
        return () => {
            setCommentText(`@${author} `);
        };
    };

    return (
        <section className="dl-comments-section">
            <div className="dl-comments-header-form">
                <div className="dl-comments-header">
                    <h2>Komentar</h2>
                    <span className="dl-comments-count">{comments.length} Komentar</span>
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
                            maxLength={30}
                            required
                        />
                        <textarea
                            placeholder="Tulis komentarmu di sini..."
                            value={commentText}
                            onChange={(e) => setCommentText(e.target.value)}
                            maxLength={250}
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
                                <div className="dl-avatar-placeholder">{getInitials(comment.name)}</div>
                            </div>
                            <div className="dl-comment-content">
                                <div className="dl-comment-header">
                                    <span className="dl-comment-author">
                                        {comment.name}
                                        {comment.is_admin && (
                                            <i className="fas fa-crown" style={{ marginLeft: "5px", color: "gold" }}></i>
                                        )}
                                    </span>
                                    <span className="dl-comment-date">{formatRelativeTime(comment.created_at)}</span>
                                </div>
                                <div className="dl-comment-text">
                                    {comment.content}
                                </div>
                                <div className="dl-comment-actions">
                                    {/* <button className="dl-comment-like">
                                        <i className="fas fa-thumbs-up"></i> {comment.likes}
                                    </button> */}
                                    <button className="dl-comment-reply" onClick={handleReply(comment.name)}>Balas</button>
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
                    
                    {currentIndex >= comments.length && (
                        <div className="dl-comments-end">
                            {/* <i className="fas fa-check-circle"></i> */}
                            <span>{comments.length === 0 ? "Belum ada komentar" : "Tidak ada komentar lagi"}</span>
                        </div>
                    )}
                    
                    <div ref={commentsEndRef} />
                </div>
            </div>
        </section>
    );
}