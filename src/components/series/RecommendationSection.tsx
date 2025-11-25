// import { useState, useEffect } from "react";
import Image from "next/image";
import Link from "next/link";

export default function RecommendationSection({ series }: { series: any }) {
    return (
        <section id="recommendation" className="dl-section">
            <div className="dl-section-header">
                <h2>Rekomendasi</h2>
            </div>
            <div className="dl-recommendation-container">
                {series.map((item: any) => (
                    <Link key={item.id} href={`/series/${item.slug}`} style={{ display: "block", color: "inherit", textDecoration: "none" }}>
                        <div className="dl-card">
                            <div className="dl-card-img">
                                <Image src={process.env.BASE_URL_BACKEND + item.thumbnail} alt={item.name} sizes="368px" fill />
                                <div className="dl-card-badge">HOT</div>
                            </div>
                            <div className="dl-card-content">
                                <h3 className="dl-card-title">{item.name}</h3>
                                <div className="dl-card-meta">
                                    <span>{item.current_episode}/{item.total_episodes} eps</span>
                                    <span className="dl-card-rating"><i className="fas fa-star"></i> {item.rating}</span>
                                </div>
                            </div>
                        </div>
                    </Link>
                ))}
            </div>
        </section>
    );
}