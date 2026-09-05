import Link from "next/link";
import HistorySection from "@/components/home/HistorySection";
import './style.css'; 
import "@/styles/stream.css";
import "@/styles/series.css";
import TopDonation from "@/components/home/topDonation";

const getInitials = (name: string) => {
    if (!name) return "U";
    return name.split(' ').map(word => word[0]).join('').toUpperCase().slice(0, 2);
};

export default async function RecentComments() {
    const response = await fetch(`${process.env.BASE_URL_BACKEND}api/recent-comments`, {
        headers: {
            'X-API-KEY': process.env.APIKEY_BACKEND as string,
        },
        cache: 'no-store' 
    });
    
    const json = await response.json();
    const comments = json.data || [];

    return (
        <>
            <div className="row" style={{ marginTop: '70px' }}>
                <div className="col-12 col-lg-9">
                    <section id="recent-comments" className="dl-section">
                        
                        <div className="dl-breadcrumb-card">
                            <nav className="dl-breadcrumb" aria-label="Breadcrumb">
                                <ol>
                                    <li><Link href="/">Beranda</Link></li>
                                    <li aria-current="page">Komentar Terbaru</li>
                                </ol>
                            </nav>
                        </div>

                        {/* <div className="dl-section-header">
                            <h2>Komentar Terbaru</h2>
                        </div> */}

                        {comments.length === 0 && (
                            <section id="dl-search-results" className="dl-section">
                                <div className="dl-search-results-container">
                                    <div className="dl-empty-state">
                                        <i className="fas fa-comments"></i>
                                        <p>Belum ada komentar terbaru.</p>
                                    </div>
                                </div>
                            </section>
                        )}

                        {/* Menggunakan Wrapper Baru */}
                        <div className="dl-recent-comments-wrapper">
                            {comments.map((comment: any) => (
                                <div key={comment.id} className="dl-recent-comment-card">
                                    
                                    <div className="dl-comment-avatar">
                                        <div className="dl-avatar-placeholder">{getInitials(comment.name)}</div>
                                    </div>
                                    
                                    <div className="dl-recent-comment-content">
                                        <div className="dl-comment-header">
                                            <span className="dl-comment-author">
                                                {comment.name}
                                                {comment.is_admin && <i className="fas fa-crown" style={{ marginLeft: "5px", color: "gold" }}></i>}
                                            </span>
                                            <span className="dl-comment-date">
                                                {new Date(comment.created_at).toLocaleDateString('id-ID', { 
                                                    day: 'numeric', month: 'short', year: 'numeric', 
                                                    hour: '2-digit', minute: '2-digit' 
                                                })}
                                            </span>
                                        </div>
                                        
                                        {comment.replyTo && (
                                            <div style={{ fontSize: '0.8rem', color: 'var(--gray-color)', marginBottom: '8px' }}>
                                                <i className="fas fa-reply" style={{ marginRight: '5px' }}></i> 
                                                Membalas <strong>@{comment.replyTo}</strong>
                                            </div>
                                        )}

                                        <div className="dl-comment-text">{comment.content}</div>
                                        
                                        {/* Tombol dengan class baru */}
                                        <Link href={comment.srcComment} className="dl-recent-source-btn">
                                            <i className="fas fa-external-link-alt"></i> 
                                            Lihat di: {comment.source_name}
                                        </Link>
                                    </div>
                                </div>
                            ))}
                        </div>
                    </section>
                </div>

                <div className="col-12 col-md-3">
                    <TopDonation />
                    <HistorySection />

                    <section id="community" className="dl-section">
                        <a className="dl-side-card dl-side-card--community" href="https://t.me/dongworld" target="_blank" rel="noopener noreferrer">
                            <div className="dl-side-card-text">
                                <h2>Komunitas</h2>
                                <div className="dl-side-card-subtitle">Join channel Telegram</div>
                            </div>
                            <span className="dl-side-card-action" aria-hidden="true">
                                <i className="fab fa-telegram"></i>
                            </span>
                        </a>
                    </section>

                    <section id="donation" className="dl-section">
                        <a className="dl-side-card dl-side-card--donation" href="/donate"
                        // target="_blank" 
                        rel="noopener noreferrer">
                            <div className="dl-side-card-text">
                                <h2>Donasi</h2>
                                <div className="dl-side-card-subtitle">Dukung DongWorld</div>
                            </div>
                            <span className="dl-side-card-action" aria-hidden="true">
                                <i className="fas fa-donate"></i>
                            </span>
                        </a>
                    </section>
                </div>
            </div>
        </>
    );
}