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
import { Metadata } from "next";
import StreamNotificationRotator from "@/components/StreamNotificationRotater";
import { Fragment } from "react/jsx-dev-runtime";
import Link from "next/dist/client/link";

interface Params {
  params: { slug: string };
}

export async function generateMetadata({ params }: Params): Promise<Metadata> {
    const { slug } = await params;

    const res = await fetch(`${process.env.BASE_URL_BACKEND}api/watch/${slug}`, {
        headers: { "X-API-KEY": process.env.APIKEY_BACKEND as string },
        next: { revalidate: 300 },
    });

    if (!res.ok) {
        return { title: "Not Found" };
    }

    const data = await res.json();
    const detail = data["detail-episode"];

    const title = `${detail.series.name} Episode ${detail.episode_number} | DongWorld`;
    const description = detail.series.synopsis?.slice(0, 160) || "Tonton donghua terbaru di DongWorld.";
    const image = process.env.BASE_URL_BACKEND + detail.series.thumbnail;
    const url = `${process.env.NEXT_PUBLIC_SITE_URL}/watch/${detail.slug}`;

    return {
        title,
        description,
        alternates: { canonical: url },
        openGraph: {
            title,
            description,
            url,
            images: [{ url: image }],
            type: "video.episode",
        },
        twitter: {
            card: "summary_large_image",
            title,
            description,
            images: [image],
        },
    };
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
            <StreamNotificationRotator
                intervalMs={15_000}
                messages={[
                <Fragment key="ads-warning">
                    Skip iklan dengan menutup tab/pop-up iklan, lalu kembali ke halaman ini untuk
                    melanjutkan menonton. Kami hanya membatasi iklan muncul 3x setiap 1 jam.
                </Fragment>,
                <Fragment key="ads-warning">
                    Join channel telegram kami agar tidak ketinggalan update dan pemberitahuan lainnya,{" "}
                    <Link href="https://t.me/dongworld" target="_blank">
                    klik disini
                    </Link>
                    .
                </Fragment>,
                ]}
            />
            <div className="row">
                <div className="col-12 col-lg-8">
                    {/* Stream Player Section */}
                    <StreamPlayer detail={detail} nextEpisodeSlug={nextEpisodeSlug} prevEpisodeSlug={prevEpisodeSlug} />
                    {/* Download Section */}
                    {detail.downloads.length > 0 && (
                        <section className="dl-download-section">
                            <div className="dl-download-header">
                                <h2>Download</h2>
                                <span className="dl-download-meta">
                                    Episode {detail.episode_number}
                                </span>
                            </div>
                            <div className="dl-download-list">
                                {detail.downloads.map((download: any, idx: number) => (
                                    <a
                                        key={idx}
                                        href={download.link}
                                        target="_blank"
                                        rel="noopener noreferrer"
                                        className="dl-download-item"
                                    >
                                        <i className="fas fa-download"></i>
                                        <span>{download.quality} | {download.server}</span>
                                    </a>
                                ))}
                            </div>
                        </section>
                    )}
                    <EpisodeSectionMobile slugSeries={detail.series.slug} initialEpisodes={episodes} selectedEpisode={detail.episode_number} />
                    {/* Donghua Details */}
                    <section className="dl-donghua-details">
                        <div className="dl-details-content">
                            <div className="dl-details-poster">
                                <Image src={process.env.BASE_URL_BACKEND + detail.series.thumbnail} alt={detail.series.name} width={600} height={600} priority />
                            </div>
                            <div className="dl-details-info">
                                <h1 className="dl-details-title">{detail.series.name}</h1>
                                <div className="dl-details-meta">
                                    <span><i className="fas fa-star"></i>{detail.series.rating ? detail.series.rating : "N/A"}</span>
                                    <span><i className="fas fa-tags"></i>{detail.series.genres_string ? detail.series.genres_string : "Unknown"}</span>
                                    <span><i className="fas fa-calendar"></i>{detail.series.release_date ? detail.series.release_date : "Unknown"}</span>
                                    <span><i className="fas fa-video"></i>{detail.series.episodes_max_episode_number || 0}/{detail.series.total_episodes ? detail.series.total_episodes : "?"} Episode</span>
                                    <span><i className="fas fa-eye"></i>{detail.series.views}</span>
                                </div>
                                <div className="dl-details-synopsis">
                                    <h3>Sinopsis</h3>
                                    <p>{detail.series.synopsis}</p>
                                </div>
                            </div>
                        </div>
                    </section>
                    {/* Comments Section */}
                    <CommentSection comments={comments} slug={slug} />

                    <RecommendationSection series={recommendationsData.series} />
                </div>
                
                <div className="col-12 col-lg-4">
                    <div className="dl-episode-sidebar d-none d-lg-block">
                        <EpisodeSectionDesktop slugSeries={detail.series.slug} initialEpisodes={episodes} selectedEpisode={detail.episode_number} />
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
