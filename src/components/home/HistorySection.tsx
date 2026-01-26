"use client";

import Link from "next/link";
import { useEffect, useState } from "react";

type HistoryItem = {
    slugEpisode: string;
    episodeNumber: number;
    title: string;
    watchedAt: string;
};

type HistoryMap = Record<string, HistoryItem>;

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

export default function HistorySection() {
    const [history, setHistory] = useState<HistoryMap>({});

    useEffect(() => {
        const saved = localStorage.getItem("history");
        setHistory(saved ? JSON.parse(saved) : {});
    }, []);

    const clearHistory = () => {
        localStorage.removeItem("history");
        // localStorage.clear();
        setHistory({});
    };

    const items = Object.entries(history);

    return (

        <section id="history" className="dl-section">
            <div className="dl-history-container">
                {/* Header (tidak ikut scroll) */}
                <div className="dl-history-header">
                    <h2 className="dl-history-title">Riwayat Nonton</h2>
                    <button
                        id="dl-clear-history"
                        className="dl-btn-clear"
                        style={{ marginTop: "-25px" }}
                        onClick={clearHistory}
                    >
                        Bersihkan Riwayat
                    </button>

                    <div className={`dl-empty-state ${items.length === 0 ? "" : "dl-hidden"}`} style={{ marginTop: "24px" }}>
                        <i className="fas fa-history"></i>
                        <p>Riwayat nontonmu masih kosong</p>
                        <Link href="/series" className="dl-btn-primary" style={{ textDecoration: "none", color: "white" }}>Mulai Menonton</Link>
                    </div>
                </div>

                {/* List (scroll) */}
                <div className="dl-history-list">
                    {items.length > 0 && items.map(([slug, item]) => (
                        <Link href={`/watch/${item.slugEpisode}`} key={slug} style={{ textDecoration: "none", color: "inherit" }}>
                            <div className="dl-history-item">
                                <div className="dl-history-content">
                                    <h3 className="dl-history-title">{item.title}</h3>
                                    <div className="dl-history-meta">
                                        <span>Episode {item.episodeNumber}</span>
                                        <span>|</span>
                                        <span>{formatRelativeTime(item.watchedAt)}</span>
                                    </div>
                                </div>
                            </div>
                        </Link>
                    ))}
                </div>
            </div>
        </section>
    );
}