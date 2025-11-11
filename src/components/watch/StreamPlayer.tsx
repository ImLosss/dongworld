"use client";
import Link from "next/link";
import { useState } from "react";

interface StreamPlayerProps {
    detail: any;
}

export default function StreamPlayer({ detail }: StreamPlayerProps) {
    const [selectedServer, setSelectedServer] = useState(detail.links?.[0]?.url || "");

    const handleServerChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
        setSelectedServer(e.target.value);
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
                    <h1 className="dl-stream-title">{detail.series.name} - Episode {detail.episode_number}</h1>
                    <div className="dl-stream-meta">
                        <span>
                            Diposting oleh <b>{detail.uploader || 'Admin'}</b> pada {new Date(detail.created_at).toLocaleDateString('id-ID')} | 
                            Series <b><a href={`/series/${detail.series.slug}`}>{detail.series.name}</a></b>
                        </span>
                    </div>
                </div>

                {/* Embedded Player */}
                <div className="dl-video-container">
                    <iframe 
                        src={selectedServer || "https://www.dailymotion.com/embed/video/x9n9ixe"} 
                        frameBorder="0" 
                        allowFullScreen
                        title="Video Player"
                    ></iframe>
                </div>

                {/* Server Selection */}
                <div className="dl-server-selection">
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
            </div>
        </section>
    );
}