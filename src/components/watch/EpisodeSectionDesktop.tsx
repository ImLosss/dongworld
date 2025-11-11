"use client";
import { useState, useEffect } from "react";
import dayjs from "dayjs";

export default function EpisodeSectionDesktop({ slug, initialEpisodes, selectedEpisode }: { slug: string, initialEpisodes: any, selectedEpisode: number }) {
    const [episodes, setEpisodes] = useState(initialEpisodes);
    const [page, setPage] = useState(episodes.current_page);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        if (page === episodes.current_page) return;
        setLoading(true);
        fetch(`/api/watch/${slug}?page=${page}`)
            .then(res => res.json())
            .then(data => setEpisodes(data.episodes))
            .finally(() => setLoading(false));
    }, [page, slug, episodes.current_page]);

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
                    {episodes.data.map((episode: any) => (
                        <a key={episode.id} href={'/watch/' + episode.slug} className={selectedEpisode === episode.episode_number ? "dl-episode-item active" : "dl-episode-item"}>
                            <span className="dl-episode-number">Episode {episode.episode_number}</span>
                            <span className="dl-episode-title">{episode.title}</span>
                            <span className="dl-episode-duration">{dayjs(episode.created_at).format("DD MMM YYYY")}</span>
                        </a>
                    ))}
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