import Image from "next/image";
import SeriesList from "@/components/home/SeriesList";
import HeroSection from "@/components/home/HeroSection";
import Link from "next/link";
import HistorySection from "@/components/home/HistorySection";

type Slide = {
  name: string;
  synopsis: string;
  thumbnail: string;
  slug: string;
};

export default async function Home() {
  let heroSlides: Slide[] = [];

  const response = await fetch(`${process.env.BASE_URL_BACKEND}api/all-series`, {
    headers: {
      'X-API-KEY': process.env.APIKEY_BACKEND as string,
    },
    cache: 'no-store'
  });
  const data = await response.json();
  heroSlides = data?.heroSlides ?? data?.data ?? [];

  const isToday = (dateStr?: string) => {
    if (!dateStr) return false;
    const d = new Date(dateStr);
    const now = new Date();
    return d.getFullYear() === now.getFullYear() &&
          d.getMonth() === now.getMonth() &&
          d.getDate() === now.getDate();
  };

  const isWeek = (dateStr?: string) => {
    if (!dateStr) return false;
    const d = new Date(dateStr);
    const now = new Date();
    const oneWeekAgo = new Date();
    oneWeekAgo.setDate(now.getDate() - 7);
    return d >= oneWeekAgo && d <= now;
  };
  return (
    <>
      {/* Hero Section */}
      <HeroSection slides={heroSlides} />
      <div className="row">
        <div className="col-12 col-md-9">
          {/* Rilis Section */}
          <section id="trending" className="dl-section">
            <div className="dl-section-header">
              <h2>Baru ditambahkan</h2>
              <Link href="/series" className="dl-see-all">Lihat Semua</Link>
            </div>

            <div className="dl-card-container">
              { data.series.map((series: any) => {
                return (
                  <SeriesList key={series.id} href={`/series/${series.slug}`}>
                    <div className="dl-card-img">
                      <Image src={process.env.BASE_URL_BACKEND + series.thumbnail} sizes="368px" alt={series.name} fill />
                      {isToday(series.updated_at) && (
                        <div className="dl-card-badge">{series.status == 'complete' ? 'END' : 'New'}</div>
                      )}
                    </div>
                    <div className="dl-card-content">
                        <h3 className="dl-card-title">{series.name}</h3>
                        <div className="dl-card-meta">
                            <span>{series.episodes_max_episode_number || 0}/{series.total_episodes ? series.total_episodes : "?"} eps</span>
                            <span className="dl-card-rating"><i className="fas fa-star"></i>{series.rating ? series.rating : "N/A"}</span>
                        </div>
                    </div>
                  </SeriesList>
                )
              })}
            </div>
          </section>

          {/* Movies Section */}
          <section id="movies" className="dl-section">
            <div className="dl-section-header">
              <h2>Movies</h2>
              <Link href="/series?type=movie" className="dl-see-all">Lihat Semua</Link>
            </div>
            <div className="dl-card-container">
              { data.movies.map((series: any) => {
                return (
                  <SeriesList key={series.id} href={`/series/${series.slug}`}>
                    <div className="dl-card-img">
                      <Image src={process.env.BASE_URL_BACKEND + series.thumbnail} sizes="368px" alt={series.name} fill />
                      {isWeek(series.updated_at) && (
                        <div className="dl-card-badge">NEW</div>
                      )}
                    </div>
                    <div className="dl-card-content">
                        <h3 className="dl-card-title">{series.name}</h3>
                        <div className="dl-card-meta">
                            <span>{series.episodes_max_episode_number || 0}/{series.total_episodes ? series.total_episodes : "?"} eps</span>
                            <span className="dl-card-rating"><i className="fas fa-star"></i>{series.rating ? series.rating : "N/A"}</span>
                        </div>
                    </div>
                  </SeriesList>
                )
              })}
            </div>
          </section>

          {/* Search Results Section (Hidden by default) */}
          <section id="dl-search-results" className="dl-section dl-hidden">
            <div className="dl-section-header">
              <h2>Hasil Pencarian</h2>
              <button id="dl-close-search" className="dl-btn-clear">Tutup</button>
            </div>

            <div className="dl-search-results-container">
              {/* Search results will be populated by JavaScript */}
            </div>
          </section>
        </div>
        <div className="col-12 col-md-3">
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
