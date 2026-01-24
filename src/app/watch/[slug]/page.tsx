import "@/styles/stream.css";
import "@/styles/series.css";
import Image from "next/image";
import { notFound } from "next/navigation";
import StreamPlayer from "@/components/watch/StreamPlayer";
import EpisodeSectionDesktop from "@/components/watch/EpisodeSectionDesktop";
import EpisodeSectionMobile from "@/components/watch/EpisodeSectionMobile";
import CommentSection from "@/components/watch/CommentSection";
import WatchHistorySaver from "@/components/watch/WatchHistorySaver";
import HistorySection from "@/components/home/HistorySection";

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

    if (!res.ok) return notFound();
    const data = await res.json();
    const episodes = data.episodes;
    const detail = data['detail-episode'];

    fetch(`${process.env.BASE_URL_BACKEND}api/view-series/${detail.series.slug}`, {
        method: 'POST',
        headers: {
            'X-API-KEY': process.env.APIKEY_BACKEND as string,
        },
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
                    <StreamPlayer detail={detail} />
                    {/* Donghua Details */}
                    <section className="dl-donghua-details">
                        <div className="dl-details-content">
                            <div className="dl-details-poster">
                                <Image src={process.env.BASE_URL_BACKEND + detail.series.thumbnail} alt={detail.series.name} width={100} height={100} />
                            </div>
                            <div className="dl-details-info">
                                <h1 className="dl-details-title">{detail.series.name}</h1>
                                <div className="dl-details-meta">
                                    <span><i className="fas fa-star"></i> {detail.series.rating}/5</span>
                                    <span><i className="fas fa-tags"></i> {detail.series.genres_string}</span>
                                    <span><i className="fas fa-building"></i> {detail.series.studios}</span>
                                    <span><i className="fas fa-flag"></i> China</span>
                                    <span><i className="fas fa-calendar"></i> {detail.series.release_date}</span>
                                </div>
                                <div className="dl-details-synopsis">
                                    <h3>Sinopsis</h3>
                                    <p>{detail.series.synopsis}</p>
                                </div>
                            </div>
                        </div>
                    </section>
                    <EpisodeSectionMobile slug={slug} slugSeries={detail.series.slug} initialEpisodes={episodes} selectedEpisode={detail.episode_number} />
                    {/* Comments Section */}
                    <CommentSection />

                    {/* Recommendation Section */}
                    <section id="recommendation" className="dl-section">
                        <div className="dl-section-header">
                            <h2>Rekomendasi</h2>
                        </div>
                        <div className="dl-recommendation-container">
                            <div className="dl-card">
                                <div className="dl-card-img">
                                    <Image src="/images/image2.jpg" alt="asd" width={100} height={100} />
                                    <div className="dl-card-badge">NEW</div>
                                </div>
                                <div className="dl-card-content">
                                    <h3 className="dl-card-title">Soul Land</h3>
                                    <div className="dl-card-meta">
                                        <span>21 eps</span>
                                        <span className="dl-card-rating"><i className="fas fa-star"></i> 3.5</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
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
                            <a href="https://t.me/dongworld"><i className="fab fa-telegram"></i></a>
                        </div>
                    </section>

                    {/* Donation Card */}
                    <section id="donation" className="dl-section">
                        <div className="dl-side-card">
                            <h2>Donasi</h2>
                            <a href="https://t.me/dongworld"><i className="fas fa-donate"></i></a>
                        </div>
                    </section>
                </div>
            </div>
        </>
    );
}
