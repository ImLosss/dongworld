"use client";
import { useState, useEffect } from "react";
import dayjs from "dayjs";
import Link from "next/link";

export default function EpisodeSectionDesktop({ slugSeries, initialEpisodes, selectedEpisode }: { slugSeries: string, initialEpisodes: any, selectedEpisode: any }) {
    const pageSize = 25;
    const storageKey = `episode_page_${slugSeries}`;
    const episodeList = Array.isArray(initialEpisodes) ? initialEpisodes : (initialEpisodes?.data || []);

    const sortedEpisodes = [...episodeList].sort((a: any, b: any) => a.episode_number - b.episode_number);

    const pageItems = Array.from({ length: Math.ceil(sortedEpisodes.length / pageSize) }, (_, idx) => {
        const startIndex = idx * pageSize;
        const endIndex = Math.min(startIndex + pageSize, sortedEpisodes.length) - 1;
        const startEpisode = sortedEpisodes[startIndex]?.episode_number ?? 0;
        const endEpisode = sortedEpisodes[endIndex]?.episode_number ?? 0;
        return {
            page: idx + 1,
            startEpisode,
            endEpisode,
        };
    });

    const getSavedPage = (totalPages: number) => {
        if (typeof window !== 'undefined') {
            const saved = localStorage.getItem(storageKey);
            const savedPage = saved ? parseInt(saved) : 1;
            const validPage = Math.min(Math.max(savedPage, 1), totalPages);
            if (savedPage !== validPage) {
                localStorage.setItem(storageKey, validPage.toString());
            }
            return validPage;
        }
        return 1;
    };

    const [page, setPage] = useState(1);
    const [loading, setLoading] = useState(false);

    const totalPages = Math.max(1, pageItems.length);

    useEffect(() => {
        setPage(getSavedPage(totalPages));
    }, [slugSeries, totalPages]);

    const startIndex = (page - 1) * pageSize;
    const endIndex = Math.min(startIndex + pageSize, sortedEpisodes.length);
    const pageEpisodes = sortedEpisodes.slice(startIndex, endIndex);

    const handlePageChange = (nextPage: number) => {
        localStorage.setItem(storageKey, nextPage.toString());
        setLoading(true);
        setTimeout(() => {
            setPage(nextPage);
            setLoading(false);
        }, 150);
    };

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
                    {pageEpisodes.length > 0 ? (
                        pageEpisodes.map((episode: any) => (
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
            {pageItems.length > 1 && (
                <div className="dl-episode-pagination">
                    <div className="dl-episode-page-chips">
                        {pageItems.map((item) => (
                            <button
                                key={item.page}
                                className={item.page === page ? "dl-episode-page-chip active" : "dl-episode-page-chip"}
                                disabled={loading}
                                onClick={() => handlePageChange(item.page)}
                            >
                                {item.startEpisode}-{item.endEpisode}
                            </button>
                        ))}
                    </div>
                </div>
            )}
        </div>
    );
}