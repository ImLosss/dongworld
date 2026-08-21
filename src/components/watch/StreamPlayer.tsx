"use client";
import Link from "next/link";
import { useEffect, useRef, useState } from "react";
import { openSmartlink } from "@/lib/smartlink";

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
    const BASE_EMBED_URL = "http://player.websiteku.space/embed?url=";
    const sortedLinks = [...(detail.links || [])]
        .sort((a: any, b: any) => {
            const aOkru = (a.server?.name || "").toLowerCase() === "okru";
            const bOkru = (b.server?.name || "").toLowerCase() === "okru";
            return Number(bOkru) - Number(aOkru);
        });

    const getServerUrl = () => {
        const saved = localStorage.getItem("server");

        if (!saved) {
            return sortedLinks[0]?.url || "";
        }

        const match = sortedLinks.find(
            link => link.server.name === saved
        );

        return match?.url || sortedLinks[0]?.url || "";
    };

    const [selectedServer, setSelectedServer] = useState(sortedLinks[0]?.server.name || "");
    const [saved, setSaved] = useState(false);
    const serverTabsRef = useRef<HTMLDivElement>(null);

    const currentLink =
        sortedLinks.find(link => link.server.name === selectedServer) ??
        sortedLinks[0];

    useEffect(() => {
        const saved = localStorage.getItem("server");

        if (saved) {
            setSelectedServer(saved);
        }

        setTimeout(() => {
            const container = serverTabsRef.current;
            if (!container) return;

            const activeTab = container.querySelector('.dl-server-tab.active') as HTMLElement;

            if (activeTab) {
                // Hitung posisi agar tab berada di tengah layar kontainer
                const containerWidth = container.clientWidth;
                const tabOffsetLeft = activeTab.offsetLeft;
                const tabWidth = activeTab.clientWidth;

                const scrollTarget = tabOffsetLeft - (containerWidth / 2) + (tabWidth / 2);

                container.scrollTo({
                    left: scrollTarget,
                    behavior: 'smooth'
                });
            }
        }, 150);
    }, [detail.slug]);

    const handleServerChange = (serverName: string) => {
        localStorage.setItem("server", serverName);
        setSelectedServer(serverName);
    };

    const saveHistory = () => {
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
                <div className="dl-video-container" id="smartlink-slot" onLoad={saveHistory} onClick={openSmartlink}>
                    <iframe
                        src={currentLink.url}
                        frameBorder="0"
                        allowFullScreen
                        title="Video Player"
                        id="video-player"
                    ></iframe>
                </div>

                {/* Server Selection */}
                <div className="dl-server-minimal-bar">
                    <div className="dl-server-tabs-container">
                        <span className="dl-server-icon" title="Pilih Server">
                            <i className="fas fa-server"></i>
                        </span>
                        <div className="dl-server-tabs" ref={serverTabsRef}>
                            {sortedLinks.map((link: any) => (
                                <button
                                    key={link.id}
                                    className={`dl-server-tab ${selectedServer === link.server.name ? 'active' : ''}`}
                                    onClick={() => {
                                        handleServerChange(link.server.name);
                                        openSmartlink();
                                    }}
                                >
                                    {link.server.name}
                                </button>
                            ))}
                        </div>
                    </div>

                    <div className="dl-episode-nav-icons" onClick={openSmartlink}>
                        {prevEpisodeSlug && (
                            <Link href={`/watch/${prevEpisodeSlug}`} className="dl-nav-icon" title={`Episode ${detail.episode_number - 1}`}>
                                <i className="fas fa-step-backward"></i>
                            </Link>
                        )}

                        {nextEpisodeSlug && (
                            <Link href={`/watch/${nextEpisodeSlug}`} className="dl-nav-icon" title={`Episode ${detail.episode_number + 1}`}>
                                <i className="fas fa-step-forward"></i>
                            </Link>
                        )}
                    </div>
                </div>
            </div>
            {/* Server Note */}
            {currentLink?.server.note && (
                <div className="dl-server-notification">
                    <div className="dl-server-content">
                        <i className="fas fa-info-circle"></i>
                        <span>{currentLink.server.note}</span>
                    </div>
                </div>
            )}
        </section>
    );
}