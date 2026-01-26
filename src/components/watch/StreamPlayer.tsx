"use client";
import next from "next";
import Link from "next/link";
import { useState } from "react";

interface StreamPlayerProps {
    detail: any;
}

type HistoryItem = {
    slugEpisode: string;
    episodeNumber: number;
    title: string;
    watchedAt: string;
};

type HistoryMap = Record<string, HistoryItem>;

export default function StreamPlayer({ detail, nextEpisodeSlug, prevEpisodeSlug }: StreamPlayerProps & { nextEpisodeSlug: string | null; prevEpisodeSlug: string | null }) {
    const [selectedServer, setSelectedServer] = useState(detail.links?.[0]?.url || "");
    const [saved, setSaved] = useState(false);

    const handleServerChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
        setSelectedServer(e.target.value);
    };

    const saveHistory = () => {
        console.log("Saving history...");
        if (saved) return;
        setSaved(true);

        const key = "history";
        const raw = localStorage.getItem(key);
        const history: HistoryMap = raw ? JSON.parse(raw) : {};

        const seriesSlug = detail.series?.slug || detail.slug;

        history[seriesSlug] = {
            slugEpisode: detail.slug,
            episodeNumber: detail.episode_number,
            title: `${detail.series?.name}`,
            watchedAt: new Date().toISOString(),
        };

        const pruned = Object.entries(history)
            .sort((a, b) => new Date(b[1].watchedAt).getTime() - new Date(a[1].watchedAt).getTime())
            .slice(0, 20);

        const limitedHistory = Object.fromEntries(pruned);

        localStorage.setItem(key, JSON.stringify(limitedHistory));
    };

    return (
        <section className="dl-stream-player-section">
            {/* Breadcrumb */}
            <div className="dl-breadcrumb-card">
                <nav className="dl-breadcrumb" aria-label="Breadcrumb">
                    <ol>
                        <li><Link href="/">Beranda</Link></li>
                        <li><Link href={`/series/${detail.series.slug}`}>{detail.series.name}</Link></li>
                        <li aria-current="page">Episode {detail.episode_number}</li>
                    </ol>
                </nav>
            </div>

            <div className="dl-stream-player-container">
                {/* Video Info */}
                <div className="dl-stream-info">
                    <h1 className="dl-stream-title">{detail.series.name} Episode {detail.episode_number} Subtitle Indonesia</h1>
                    <div className="dl-stream-meta">
                        <span>
                            Diposting oleh <b>{detail.uploader || 'Admin'}</b> pada {new Date(detail.created_at).toLocaleDateString('id-ID')} |
                            Series <b><a href={`/series/${detail.series.slug}`}>{detail.series.name}</a></b>
                        </span>
                    </div>
                </div>

                {/* Embedded Player */}
                <div className="dl-video-container" onLoad={saveHistory}>
                    <iframe
                        src={selectedServer || "https://geo.dailymotion.com/player.html?video=x9yei3c"}
                        frameBorder="0"
                        allowFullScreen
                        title="Video Player"
                    ></iframe>
                </div>

                {/* Server Selection */}
                <div className="dl-server-selection">
                    <div className="dl-server-left">
                        <select
                            id="server-select"
                            value={selectedServer}
                            onChange={handleServerChange}
                        >
                            {detail.links?.map((link: any) => (
                                <option key={link.id} value={link.url}>
                                    {link.server.name}
                                </option>
                            ))}
                        </select>
                    </div>

                    <div className="dl-server-right">
                        {prevEpisodeSlug && (
                            <Link href={prevEpisodeSlug ? `/watch/${prevEpisodeSlug}` : "#"}className="dl-server-nav"><i className="fas fa-chevron-left"></i>{detail.episode_number - 1}</Link>
                        )}

                        {nextEpisodeSlug && (
                            <Link href={`/watch/${nextEpisodeSlug}`} className="dl-server-nav">{detail.episode_number + 1} <i className="fas fa-chevron-right"></i></Link>
                        )}
                    </div>
                </div>
            </div>
        </section>
    );
}