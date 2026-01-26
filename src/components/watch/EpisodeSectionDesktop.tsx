"use client";
import { useState, useEffect } from "react";
import dayjs from "dayjs";
import Link from "next/link";

export default function EpisodeSectionDesktop({ slug, slugSeries, initialEpisodes, selectedEpisode }: { slug: string, slugSeries: string, initialEpisodes: any, selectedEpisode: any }) {
    const getSavedPage = () => {
        if (typeof window !== 'undefined') {
            const saved = localStorage.getItem(`episode_page_${slug}`);
            return saved ? parseInt(saved) : initialEpisodes.current_page;
        }
        return initialEpisodes.current_page;
    };
    
    const [episodes, setEpisodes] = useState(initialEpisodes);
    let [page, setPage] = useState(getSavedPage());
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        if (page === episodes.current_page) return;
        
        setLoading(true);
        if(page > episodes.last_page || page < 1) {
            page = episodes.last_page;
            localStorage.setItem(`episode_page_${slug}`, episodes.last_page.toString());
        } else localStorage.setItem(`episode_page_${slug}`, page.toString());
        fetch(`/api/watch/${slug}?page=${page}`)
            .then(res => res.json())
            .then(data => setEpisodes(data.episodes))
            .finally(() => setLoading(false));
    }, [page, slug, episodes.current_page, slugSeries]);

    return (
        <div className="dl-episode-container">
            <div className="dl-episode-header">
                <h2>Daftar Episode</h2>
            </div>
            <div className="dl-episode-list-container">
                {loading && (
                    <div className="dl-episode-loading">
                        <div className="spinner"></div>
                    </div>
                )}
                <div className="dl-episode-list" style={loading ? { opacity: 0.5, pointerEvents: "none" } : {}}>
                    {episodes.data && episodes.data.length > 0 ? (
                        episodes.data.map((episode: any) => (
                            <Link key={episode.id} href={'/watch/' + episode.slug} className={selectedEpisode === episode.episode_number ? "dl-episode-item active" : "dl-episode-item"}>
                                <span className="dl-episode-number">Episode {episode.episode_number}</span>
                                <span className="dl-episode-title">{episode.title}</span>
                                <span className="dl-episode-duration">{dayjs(episode.created_at).format("DD MMM YYYY")}</span>
                            </Link>
                        ))
                    ) : (
                        <div className="dl-episode-empty">
                            <i className="fas fa-inbox"></i>
                            <p>Segera tayang</p>
                        </div>
                    )}
                </div>
            </div>
            <div className="dl-episode-pagination">
                <button
                    className="dl-btn-secondary"
                    disabled={episodes.current_page === 1 || loading}
                    onClick={() => setPage(page - 1)}
                >
                    <i className="fas fa-chevron-left"></i> Sebelumnya
                </button>
                <button
                    className="dl-btn-secondary"
                    disabled={episodes.current_page === episodes.last_page || loading}
                    onClick={() => setPage(page + 1)}
                >
                    Selanjutnya <i className="fas fa-chevron-right"></i>
                </button>
            </div>
        </div>
    );
}