import { notFound } from "next/navigation";
import Image from "next/image";
import "@/styles/stream.css";
import "@/styles/series.css";
import Link from "next/link";
import EpisodeSectionMobile from "@/components/series/EpisodeSectionMobile";
import EpisodeSectionDesktop from "@/components/series/EpisodeSectionDesktop";
import RecommendationSection from "@/components/series/RecommendationSection";
import CommentSection from "@/components/series/CommentSection";
import HistorySection from "@/components/home/HistorySection";

interface Params {
  params: { slug: string };
}

export default async function SeriesDetail({ params }: Params) {
  const { slug } = await params
  const res = await fetch(`${process.env.BASE_URL_BACKEND}api/series/${slug}`, {
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
  const series = data.series;

  const recommendationsData = await recommendations.json();
  const comments = data.comments;

  return (
    <>
      {/* Stream Notification */}
      <div className="dl-stream-notification">
        <div className="dl-notification-content">
          <i className="fas fa-exclamation-circle"></i>
          <span>Join channel telegram kami agar tidak ketinggalan update dan pemberitahuan lainnya, <Link href="https://t.me/dongworld" target="_blank">klik disini</Link></span>
        </div>
      </div>
      <div className="row">
        <div className="col-12 col-lg-8">
          <section className="dl-breadcrumb-section">
            {/* Breadcrumb */}
            <div className="dl-breadcrumb-card">
              <nav className="dl-breadcrumb" aria-label="Breadcrumb">
                <ol>
                  <li><Link href="/">Beranda</Link></li>
                  <li aria-current="page">{series.name}</li>
                </ol>
              </nav>
            </div>
          </section>
          {/* Donghua Details */}
          <section className="dl-donghua-details">
            <div className="dl-details-content">
              <div className="dl-details-poster">
                <Image src={process.env.BASE_URL_BACKEND + series.thumbnail} alt={series.name} width={100} height={100} />
              </div>
              <div className="dl-details-info">
                <h1 className="dl-details-title">{series.name}</h1>
                <div className="dl-details-meta">
                  <span><i className="fas fa-star"></i>{series.rating ? series.rating : "N/A"}</span>
                  <span><i className="fas fa-tags"></i>{series.genres_string ? series.genres_string : "Unknown"}</span>
                  <span><i className="fas fa-calendar"></i>{series.release_date ? series.release_date : "Unknown"}</span>
                  <span><i className="fas fa-video"></i>{series.current_episode}/{series.total_episodes} Episode</span>
                  <span><i className="fas fa-eye"></i>{series.views}</span>
                </div>
                <div className="dl-details-synopsis">
                  <h3>Sinopsis</h3>
                  <p>{series.synopsis ? series.synopsis : "Sinopsis tidak tersedia."}</p>
                </div>
              </div>
            </div>
          </section>
          <EpisodeSectionMobile slug={slug} initialEpisodes={episodes} />
          {/* Comments Section */}
          <CommentSection comments={comments} slug={slug} />

          {/* Recommendation Section */}
          <RecommendationSection series={recommendationsData.series} />
        </div>

        <div className="col-12 col-lg-4">
          <div className="dl-episode-sidebar d-none d-lg-block">
            <EpisodeSectionDesktop slug={slug} initialEpisodes={data.episodes} />
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