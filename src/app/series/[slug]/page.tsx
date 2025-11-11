import { notFound } from "next/navigation";
import Image from "next/image";
import "@/styles/stream.css";
import "@/styles/series.css";
import Link from "next/link";
import EpisodeSectionMobile from "@/components/series/EpisodeSectionMobile";
import EpisodeSectionDesktop from "@/components/series/EpisodeSectionDesktop";

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
  if (!res.ok) return notFound();
  const data = await res.json();
  const episodes = data.episodes;
  const series = data.series;

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
                  <span><i className="fas fa-star"></i> {series.rating}</span>
                  <span><i className="fas fa-tags"></i> {series.genres_string}</span>
                  <span><i className="fas fa-calendar"></i> {series.release_date}</span>
                  <span><i className="fas fa-video"></i> {series.current_episode}/{series.total_episodes} Episode</span>
                </div>
                <div className="dl-details-synopsis">
                  <h3>Sinopsis</h3>
                  <p>{series.synopsis ? series.synopsis : "Sinopsis tidak tersedia."}</p>
                </div>
              </div>
            </div>
          </section>
          <EpisodeSectionMobile slug={slug} initialEpisodes={data.episodes} />
          {/* Comments Section */}
          <section className="dl-comments-section">
            <div className="dl-comments-header">
              <h2>Komentar</h2>
              <span className="dl-comments-count">45 Komentar</span>
            </div>

            <div className="dl-comment-form">
              <div className="dl-comment-avatar">
                {/* <img src="https://ui-avatars.com/api/?name=Pengguna" alt="User Avatar"> */}
              </div>
              <form>
                <textarea placeholder="Tulis komentarmu di sini..."></textarea>
                <button type="submit" className="dl-btn-primary">Kirim</button>
              </form>
            </div>

            <div className="dl-comments-list">
              {/* Comment 1 */}
              <div className="dl-comment">
                <div className="dl-comment-avatar">
                  {/* <img src="https://ui-avatars.com/api/?name=John+Doe" alt="John Doe"> */}
                </div>
                <div className="dl-comment-content">
                  <div className="dl-comment-header">
                    <span className="dl-comment-author">John Doe</span>
                    <span className="dl-comment-date">2 hari lalu</span>
                  </div>
                  <div className="dl-comment-text">
                    Donghua ini keren banget! Animasi dan ceritanya sangat memukau. Tidak sabar menunggu episode selanjutnya!
                  </div>
                  <div className="dl-comment-actions">
                    <button className="dl-comment-like"><i className="fas fa-thumbs-up"></i> 12</button>
                    <button className="dl-comment-reply">Balas</button>
                  </div>
                </div>
              </div>

              {/* Comment 2 */}
              <div className="dl-comment">
                <div className="dl-comment-avatar">
                  {/* <img src="https://ui-avatars.com/api/?name=Jane+Smith" alt="Jane Smith"> */}
                </div>
                <div className="dl-comment-content">
                  <div className="dl-comment-header">
                    <span className="dl-comment-author">Jane Smith</span>
                    <span className="dl-comment-date">5 hari lalu</span>
                  </div>
                  <div className="dl-comment-text">
                    Karakter Tang San sangat inspiratif. Dia membuktikan bahwa kerja keras bisa mengalahkan bakat alami.
                  </div>
                  <div className="dl-comment-actions">
                    <button className="dl-comment-like"><i className="fas fa-thumbs-up"></i> 8</button>
                    <button className="dl-comment-reply">Balas</button>
                  </div>
                </div>
              </div>
            </div>

            <div className="dl-comments-load-more">
              <button className="dl-btn-secondary">Muat Lebih Banyak</button>
            </div>
          </section>

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
            <EpisodeSectionDesktop slug={slug} initialEpisodes={data.episodes} />
          </div>

          {/* Watch History Section */}
          <section id="history" className="dl-section">
            <div className="dl-history-container">
              <div className="dl-history-item">
                <div className="dl-history-content">
                  <h2 className="dl-history-title">Riwayat Nonton</h2>
                  <button id="dl-clear-history" className="dl-btn-clear">Bersihkan Riwayat</button>
                  <div className="dl-empty-state">
                    <i className="fas fa-history"></i>
                    <p>Riwayat nontonmu masih kosong</p>
                    <a href="#" className="dl-btn-primary">Mulai Menonton</a>
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
    </>
  );
}