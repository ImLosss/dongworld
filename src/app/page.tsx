import Image from "next/image";
import SeriesList from "@/components/home/SeriesList";
import Script from "next/script";

export default async function Home() {
  const response = await fetch(`${process.env.BASE_URL_BACKEND}api/all-series`, {
    headers: {
      'X-API-KEY': process.env.APIKEY_BACKEND as string,
    },
    cache: 'no-store'
  });
  const data = await response.json();
  return (
    <>
      {/* Hero Section */}
      <section id="home" className="dl-hero-section">
        <div className="dl-hero-slider">
          {/* Slide 1 */}
          <div className="dl-hero-slide" style={{ backgroundImage: "url('https://anichin.club/wp-content/uploads/2023/12/Supreme-Alchemy.webp')" }}>
            <div className="dl-hero-content">
              <div className="dl-hero-info">
                <h1 className="dl-hero-title">Soul Land</h1>
                <p className="dl-hero-synopsis">Tang San, seorang jenius dalam senjata tersembunyi, bereinkarnasi di dunia Douluo Dalu di mana setiap orang memiliki semangat mereka sendiri.</p>
                <a href="#soul-land" className="dl-btn-primary dl-hero-watch-btn">Mulai Nonton</a>
              </div>
            </div>
          </div>

          {/* Slide 2 */}
          <div className="dl-hero-slide" style={{ backgroundImage: "url('images/image2.jpg')" }}>
            <div className="dl-hero-content">
              <div className="dl-hero-info">
                <h1 className="dl-hero-title">Battle Through the Heavens</h1>
                <p className="dl-hero-synopsis">Xiao Yan, seorang pemuda berbakat yang kehilangan semua kekuatannya, memulai perjalanan untuk mendapatkan kembali kekuatannya.</p>
                <a href="#battle-through-the-heavens" className="dl-btn-primary dl-hero-watch-btn">Mulai Nonton</a>
              </div>
            </div>
          </div>

          {/* Slide 3 */}
          <div className="dl-hero-slide" style={{ backgroundImage: "url('images/image3.jpg')" }}>
            <div className="dl-hero-content">
              <div className="dl-hero-info">
                <h1 className="dl-hero-title">The Grandmaster of Demonic Cultivation</h1>
                <p className="dl-hero-synopsis">Wei Wuxian, seorang kultivator yang menggunakan jalan iblis, dibangkitkan setelah 13 tahun kematiannya.</p>
                <a href="#mo-dao-zu-shi" className="dl-btn-primary dl-hero-watch-btn">Mulai Nonton</a>
              </div>
            </div>
          </div>
        </div>

        {/* Navigation Buttons */}
        <button className="dl-hero-prev"><i className="fas fa-chevron-left"></i></button>
        <button className="dl-hero-next"><i className="fas fa-chevron-right"></i></button>

        {/* Pagination */}
        <div className="dl-hero-pagination">
          <span className="dl-hero-pagination-bullet active"></span>
          <span className="dl-hero-pagination-bullet"></span>
          <span className="dl-hero-pagination-bullet"></span>
        </div>
      </section>
      <div className="row">
        <div className="col-12 col-md-9">
          {/* Rilis Section */}
          <section id="trending" className="dl-section">
            <div className="dl-section-header">
              <h2>Rilisan Terbaru</h2>
              <a href="all-series.html#all-series" className="dl-see-all">Lihat Semua</a>
            </div>

            <div className="dl-card-container">
              { data.series.map((series: any) => {
                return (
                  <SeriesList key={series.id} href={`/series/${series.slug}`}>
                    <div className="dl-card-img">
                      <Image src={process.env.BASE_URL_BACKEND + series.thumbnail} alt="alchemy" fill />
                      <div className="dl-card-badge">NEW</div>
                    </div>
                    <div className="dl-card-content">
                        <h3 className="dl-card-title">{series.name}</h3>
                        <div className="dl-card-meta">
                            <span>{series.current_episode}/{series.total_episodes} eps</span>
                            <span className="dl-card-rating"><i className="fas fa-star"></i>{series.rating}</span>
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
              <a href="all-series.html" className="dl-see-all">Lihat Semua</a>
            </div>
            <div className="dl-card-container">
              {/* Movie cards will be populated by JavaScript */}
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
          <section id="history" className="dl-section">
            <div className="dl-history-container">
              {/* History items will be populated by JavaScript */}
              <div className="dl-history-item">
                <div className="dl-history-content">
                  <h2 className="dl-history-title">Riwayat Nonton</h2>
                  <button id="dl-clear-history" className="dl-btn-clear" style={{ marginTop: "-25px" }}>Bersihkan Riwayat</button>
                  {/* Empty state or history list will be here */}
                  <div className="dl-empty-state" style={{ marginTop: "24px" }}>
                    <i className="fas fa-history"></i>
                    <p>Riwayat nontonmu masih kosong</p>
                    <a href="#trending" className="dl-btn-primary">Mulai Menonton</a>
                  </div>
                </div>
              </div>
            </div>
          </section>

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
      <Script src="/js/script.js" strategy="afterInteractive" />
    </>
  );
}
