import "@/styles/stream.css";
import "@/styles/series.css";
import Image from "next/image";
import { notFound } from "next/navigation";
import StreamPlayer from "@/components/watch/StreamPlayer";
import EpisodeSectionDesktop from "@/components/watch/EpisodeSectionDesktop";
import EpisodeSectionMobile from "@/components/watch/EpisodeSectionMobile";
import CommentSection from "@/components/watch/CommentSection";
import HistorySection from "@/components/home/HistorySection";
import RecommendationSection from "@/components/series/RecommendationSection";

interface Params {
  params: { slug: string };
}

export default async function StreamPage({ params } : Params) {
    const { slug } = await params
    const res = await fetch(`${process.env.BASE_URL_BACKEND}api/watch/${slug}`, {
        headers: {
            'X-API-KEY': process.env.APIKEY_BACKEND as string,
        },
        cache: 'no-store'
    });

    const recommendations = await fetch(`${process.env.BASE_URL_BACKEND}api/recommendations`, {
        headers: {
        'X-API-KEY': process.env.APIKEY_BACKEND as string,
        },
        cache: 'no-store'
    });

    if (!res.ok) return notFound();
    const data = await res.json();
    const episodes = data.episodes;
    const comments = data.comments;
    const detail = data['detail-episode'];
    const recommendationsData = await recommendations.json();
    const nextEpisodeSlug = data.nextEpisodeSlug;
    const prevEpisodeSlug = data.prevEpisodeSlug;

    const downloadLinks: string[] = Array.isArray(detail.download_links)
    ? detail.download_links
    : detail.download_links
        ? JSON.parse(detail.download_links)
        : [];

    fetch(`${process.env.BASE_URL_BACKEND}api/view-series/${detail.series.slug}`, {
        method: 'POST',
        headers: {
            'X-API-KEY': process.env.APIKEY_BACKEND as string,
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ episode_id: detail.id }),
        cache: 'no-store'
    })
    return (
        <>
            {/* Stream Notification */}
            <div className="dl-stream-notification">
                <div className="dl-notification-content">
                    <i className="fas fa-exclamation-circle"></i>
                    <span>Gunakan VPN jika mengalami masalah saat streaming. Server kami tidak menyimpan file video apapun.</span>
                </div>
            </div>
            <div className="row">
                <div className="col-12 col-lg-8">
                    {/* Stream Player Section */}
                    <StreamPlayer detail={detail} nextEpisodeSlug={nextEpisodeSlug} prevEpisodeSlug={prevEpisodeSlug} />
                    {/* Donghua Details */}
                    <section className="dl-donghua-details">
                        <div className="dl-details-content">
                            <div className="dl-details-poster">
                                <Image src={process.env.BASE_URL_BACKEND + detail.series.thumbnail} alt={detail.series.name} width={100} height={100} />
                            </div>
                            <div className="dl-details-info">
                                <h1 className="dl-details-title">{detail.series.name}</h1>
                                <div className="dl-details-meta">
                                    <span><i className="fas fa-star"></i>{detail.series.rating ? detail.series.rating : "N/A"}</span>
                                    <span><i className="fas fa-tags"></i>{detail.series.genres_string ? detail.series.genres_string : "Unknown"}</span>
                                    <span><i className="fas fa-calendar"></i>{detail.series.release_date ? detail.series.release_date : "Unknown"}</span>
                                    <span><i className="fas fa-video"></i>{detail.series.current_episode ? detail.series.current_episode : "0"}/{detail.series.total_episodes ? detail.series.total_episodes : "?"} Episode</span>
                                    <span><i className="fas fa-eye"></i>{detail.series.views}</span>
                                </div>
                                <div className="dl-details-synopsis">
                                    <h3>Sinopsis</h3>
                                    <p>{detail.series.synopsis}</p>
                                </div>
                            </div>
                        </div>
                    </section>
                    {/* Download Section */}
                    {downloadLinks.length > 0 && (
                        <section className="dl-download-section">
                            <div className="dl-download-header">
                                <h2>Download</h2>
                                <span className="dl-download-meta">
                                    Episode {detail.episode_number} 1080p
                                </span>
                            </div>
                            <div className="dl-download-list">
                                {downloadLinks.map((link: string, idx: number) => (
                                    <a
                                        key={idx}
                                        href={link}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="dl-download-item"
                                    >
                                        <i className="fas fa-download"></i>
                                        <span>Link {idx + 1}</span>
                                    </a>
                                ))}
                            </div>
                        </section>
                    )}
                    <EpisodeSectionMobile slug={slug} slugSeries={detail.series.slug} initialEpisodes={episodes} selectedEpisode={detail.episode_number} />
                    {/* Comments Section */}
                    <CommentSection comments={comments} slug={slug} />

                    <RecommendationSection series={recommendationsData.series} />
                </div>
                
                <div className="col-12 col-lg-4">
                    <div className="dl-episode-sidebar d-none d-lg-block">
                        <EpisodeSectionDesktop slug={slug} slugSeries={detail.series.slug} initialEpisodes={episodes} selectedEpisode={detail.episode_number} />
                    </div>

                    {/* Watch History Section */}
                    <HistorySection />

                    {/* Community Card */}
                    <section id="community" className="dl-section">
                        <div className="dl-side-card">
                        <h2>Komunitas</h2>
                        <a href="https://t.me/dongworld" target="_blank"><i className="fab fa-telegram"></i></a>
                        </div>
                    </section>

                    {/* Donation Card */}
                    <section id="donation" className="dl-section">
                        <div className="dl-side-card">
                        <h2>Donasi</h2>
                        <a href="https://sociabuzz.com/dongworld/tribe" target="_blank"><i className="fas fa-donate"></i></a>
                        </div>
                    </section>
                </div>
            </div>
        </>
    );
}
