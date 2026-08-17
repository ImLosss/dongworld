"use client";
import { useState, useEffect, useRef } from "react";

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

export type Comment = {
    id: number;
    name: string;
    content: string;
    is_admin: boolean;
    created_at: string;
    reply_to_comment_id?: number | null;
};

type CommentNode = Comment & { replies: Comment[] }; // Diubah: Replies bukan node rekursif lagi, cukup array 1 level

export default function CommentSection({ comments, slug, csrfToken }: { comments: Comment[], slug: string, csrfToken: string }) {
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
    
    // Perhatikan kita menggunakan rootId sebagai penanda ID utama yang akan di-submit
    const [replyingTo, setReplyingTo] = useState<{ rootId: number; name: string; content: string } | null>(null);

    const commentsEndRef = useRef<HTMLDivElement>(null);
    const listRef = useRef<HTMLDivElement>(null);
    const textareaRef = useRef<HTMLTextAreaElement>(null);

    useEffect(() => {
        setDisplayedComments(comments.slice(0, 10));
    }, [comments]);

    // Fungsi ini dimodifikasi untuk memastikan kedalaman maksimal HANYA 1 level
    const buildCommentTree = (flatComments: Comment[]): CommentNode[] => {
        const commentMap = new Map<number, CommentNode>();
        const rootComments: CommentNode[] = [];

        flatComments.forEach(comment => {
            commentMap.set(comment.id, { ...comment, replies: [] });
        });

        flatComments.forEach(comment => {
            const node = commentMap.get(comment.id)!;
            
            if (comment.reply_to_comment_id) {
                // Lacak ke Root Parent sejati (jika di database telanjur ada data bersarang lebih dari 1 level)
                let parentId = comment.reply_to_comment_id;
                let parentNode = commentMap.get(parentId);
                
                while (parentNode && parentNode.reply_to_comment_id) {
                    parentId = parentNode.reply_to_comment_id;
                    parentNode = commentMap.get(parentId);
                }

                if (parentNode) {
                    parentNode.replies.push(node);
                } else {
                    rootComments.push(node);
                }
            } else {
                rootComments.push(node);
            }
        });

        return rootComments;
    };

    const commentTree = buildCommentTree(displayedComments);

    const handleScroll = () => {
        if (!listRef.current) return;
        const { scrollTop, scrollHeight, clientHeight } = listRef.current;
        if (scrollTop + clientHeight >= scrollHeight * 0.9 && !loading && currentIndex < comments.length) {
            loadMoreComments();
        }
    };

    const getInitials = (name: string) => {
        return name.split(' ').map(word => word[0]).join('').toUpperCase().slice(0, 2);
    };

    const loadMoreComments = () => {
        setLoading(true);
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

        try {
            const res = await fetch("/api/comments", {
                method: "POST",
                headers: { "Content-Type": "application/json", "X-CSRF-Token": csrfToken },
                body: JSON.stringify({
                    name,
                    comment: commentText,
                    slug,
                    reply_to_comment_id: replyingTo ? replyingTo.rootId : null 
                }),
            });

            const data = await res.json();

            if (!res.ok) {
                alert(data.message || "Gagal mengirim komentar.");
                return;
            }

            const newComment: Comment = data.comment;
            setDisplayedComments(prev => [...prev, newComment]);
            
            // Reset state
            setCommentText("");
            setReplyingTo(null); 

        } catch (err) {
            console.error(err);
            alert("Komentar gagal ditambahkan!");
        }
    };

    const handleReply = (rootId: number, authorName: string, content: string, isRoot: boolean) => {
        setReplyingTo({ rootId, name: authorName, content });
        
        // UX Tambahan: Jika membalas sub-komentar orang lain, otomatis tambahkan @nama 
        if (!isRoot) {
            setCommentText(`@${authorName} `);
        } else {
            setCommentText("");
        }
        
        if (textareaRef.current) {
            textareaRef.current.scrollIntoView({ behavior: 'smooth', block: 'center' });
            setTimeout(() => {
                textareaRef.current?.focus();
                // Opsional: pindahkan kursor ke akhir teks (setelah @nama)
                const length = textareaRef.current!.value.length;
                textareaRef.current!.setSelectionRange(length, length);
            }, 100);
        }
    };

    // Komponen Reusable Card (Dibuat statis 1 lapis tanpa rekursif)
    const CommentCard = ({ comment, rootId, isRoot }: { comment: Comment, rootId: number, isRoot: boolean }) => (
        <div className="dl-comment">
            <div className="dl-comment-avatar">
                <div className="dl-avatar-placeholder">{getInitials(comment.name)}</div>
            </div>
            <div className="dl-comment-content">
                <div className="dl-comment-header">
                    <span className="dl-comment-author">
                        {comment.name}
                        {comment.is_admin && <i className="fas fa-crown" style={{ marginLeft: "5px", color: "gold" }}></i>}
                    </span>
                    <span className="dl-comment-date">{formatRelativeTime(comment.created_at)}</span>
                </div>
                <div className="dl-comment-text">{comment.content}</div>
                <div className="dl-comment-actions">
                    <button 
                        className="dl-comment-reply" 
                        onClick={() => handleReply(rootId, comment.name, comment.content, isRoot)}
                    >
                        Balas
                    </button>
                </div>
            </div>
        </div>
    );

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
                    <form onSubmit={handleSubmit} style={{ flex: 1, display: 'flex', flexDirection: 'column', gap: '10px' }}>
                        <input
                            type="text"
                            placeholder="Nama kamu..."
                            value={name}
                            onChange={(e) => setName(e.target.value)}
                            className="dl-comment-name-input"
                            maxLength={30}
                            required
                        />
                        
                        {replyingTo && (
                            <div className="dl-replying-indicator">
                                <div className="dl-replying-header">
                                    <span>Membalas <strong>@{replyingTo.name}</strong></span>
                                    <button type="button" onClick={() => { setReplyingTo(null); setCommentText(""); }}>
                                        <i className="fas fa-times"></i> Batal
                                    </button>
                                </div>
                                <div className="dl-replying-content">
                                    <i className="fas fa-quote-left" style={{ marginRight: '8px', opacity: 0.5, fontSize: '0.8rem' }}></i>
                                    {replyingTo.content.length > 80 
                                        ? replyingTo.content.substring(0, 80) + "..." 
                                        : replyingTo.content}
                                </div>
                            </div>
                        )}

                        <textarea
                            ref={textareaRef}
                            placeholder="Tulis komentarmu di sini..."
                            value={commentText}
                            onChange={(e) => setCommentText(e.target.value)}
                            maxLength={250}
                            required
                        ></textarea>
                        <button type="submit" className="dl-btn-primary" disabled={loading}>Kirim</button>
                    </form>
                </div>
            </div>

            <div className="dl-comments-list-container">
                <div className="dl-comments-list" ref={listRef} onScroll={handleScroll}>
                    
                    {/* Render List Pasti 1 Level Saja */}
                    {commentTree.map(rootNode => (
                        <div key={rootNode.id} className="dl-comment-thread">
                            
                            {/* Komentar Utama */}
                            <CommentCard comment={rootNode} rootId={rootNode.id} isRoot={true} />
                            
                            {/* Kumpulan Balasan */}
                            {rootNode.replies.length > 0 && (
                                <div className="dl-comment-replies">
                                    {rootNode.replies.map(reply => (
                                        <CommentCard key={reply.id} comment={reply} rootId={rootNode.id} isRoot={false} />
                                    ))}
                                </div>
                            )}

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
                            <span>{comments.length === 0 ? "Belum ada komentar" : "Tidak ada komentar lagi"}</span>
                        </div>
                    )}
                    
                    <div ref={commentsEndRef} />
                </div>
            </div>
        </section>
    );
}