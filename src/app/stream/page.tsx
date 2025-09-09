import Script from "next/script";
import "@/styles/stream.css";
import Image from "next/image";

export default function StreamPage() {
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
                    <section className="dl-stream-player-section">
                        {/* Breadcrumb */}
                        <div className="dl-breadcrumb-card">
                            <nav className="dl-breadcrumb" aria-label="Breadcrumb">
                                <ol>
                                    <li><a href="index.html">Beranda</a></li>
                                    <li><a href="#">Soul Land</a></li>
                                    <li aria-current="page">Episode 1</li>
                                </ol>
                            </nav>
                        </div>
                        <div className="dl-stream-player-container">
                            {/* Video Info */}
                            <div className="dl-stream-info">
                                <h1 className="dl-stream-title">Soul Land - Episode 1</h1>
                                <div className="dl-stream-meta">
                                    {/* <span><i className="fas fa-eye"></i> 1.2M views</span>
                                    <span><i className="fas fa-calendar-alt"></i> 20 Jan 2023</span>
                                    <span><i className="fas fa-clock"></i> 24m 15s</span> */}
                                    <span>Diposting oleh <b>Losss</b> pada 8 August 2025 | Series <b><a href="">Renegade Immortal</a></b></span>
                                </div>
                            </div>
                            {/* Embedded Player */}
                            <div className="dl-video-container">
                                <iframe src="https://www.dailymotion.com/embed/video/x9n9ixe" frameBorder="0" allowFullScreen></iframe>
                            </div>

                            {/* Server Selection */}
                            <div className="dl-server-selection">
                            <select id="server-select">
                                <option value="dailymotion">Dailymotion</option>
                                <option value="krakenfiles">KrakenFiles</option>
                                <option value="streamtape">Streamtape</option>
                            </select>
                            </div>
                        </div>
                    </section>
                    {/* Donghua Details */}
                    <section className="dl-donghua-details">
                        <div className="dl-details-content">
                            <div className="dl-details-poster">
                                {/* <img src="images/image.jpg" alt="Soul Land Poster"> */}
                            </div>
                            <div className="dl-details-info">
                                <h1 className="dl-details-title">Soul Land</h1>
                                <div className="dl-details-meta">
                                    <span><i className="fas fa-star"></i> 8.9/10</span>
                                    <span><i className="fas fa-tags"></i> Action, Adventure, Fantasy</span>
                                    <span><i className="fas fa-building"></i> Sparkly Key Animation Studio</span>
                                    <span><i className="fas fa-flag"></i> China</span>
                                    <span><i className="fas fa-calendar"></i> 2018 - Sekarang</span>
                                </div>
                                <div className="dl-details-synopsis">
                                    <h3>Sinopsis</h3>
                                    <p>Tang San, seorang jenius dalam senjata tersembunyi, bereinkarnasi di dunia Douluo Dalu di mana setiap orang memiliki semangat mereka sendiri. Dengan semangat Blue Silver Grass yang dianggap tidak berguna, Tang San memulai perjalanannya untuk membuktikan bahwa tidak ada semangat yang lemah, hanya kultivator yang lemah. Bergabung dengan Akademi Shrek, dia bertemu teman-teman dan musuh yang akan membantunya tumbuh lebih kuat.</p>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section className="dl-mobile-episodes">
                        <div className="dl-episode-header">
                            <h2>Daftar Episode</h2>
                        </div>
                        <div className="dl-mobile-episode-list-container">
                            <div className="dl-mobile-episode-list">
                                <a href="#" className="dl-mobile-episode-item active">Episode 1</a>
                                <a href="#" className="dl-mobile-episode-item">Episode 2</a>
                                <a href="#" className="dl-mobile-episode-item">Episode 3</a>
                                <a href="#" className="dl-mobile-episode-item">Episode 4</a>
                                <a href="#" className="dl-mobile-episode-item">Episode 5</a>
                                <a href="#" className="dl-mobile-episode-item">Episode 6</a>
                                <a href="#" className="dl-mobile-episode-item">Episode 7</a>
                                <a href="#" className="dl-mobile-episode-item">Episode 8</a>
                            </div>
                        </div>
                        <div className="dl-episode-pagination">
                            <button className="dl-btn-secondary"><i className="fas fa-chevron-left"></i> Sebelumnya</button>
                            <button className="dl-btn-secondary">Selanjutnya <i className="fas fa-chevron-right"></i></button>
                        </div>
                    </section>
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
                                    <Image src="https://anichin.club/wp-content/uploads/2023/12/Supreme-Alchemy.webp" alt="asd" width={500} height={300} />
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
                        <div className="dl-episode-container">
                            <div className="dl-episode-header">
                                <h2>Daftar Episode</h2>
                                <div className="dl-episode-filter">
                                    <select>
                                        <option>Musim 1</option>
                                        <option>Musim 2</option>
                                        <option>Musim 3</option>
                                    </select>
                                </div>
                            </div>
                            <div className="dl-episode-list-container">
                                <div className="dl-episode-list">
                                    {/* Episode items will be populated by JavaScript */}
                                    <a href="#" className="dl-episode-item active">
                                        <span className="dl-episode-number">Episode 1</span>
                                        <span className="dl-episode-title">Dunia Baru</span>
                                        <span className="dl-episode-duration">24:15</span>
                                    </a>

                                    <a href="#" className="dl-episode-item">
                                        <span className="dl-episode-number">Episode 2</span>
                                        <span className="dl-episode-title">Semangat Ganda</span>
                                        <span className="dl-episode-duration">23:48</span>
                                    </a>

                                    <a href="#" className="dl-episode-item">
                                        <span className="dl-episode-number">Episode 3</span>
                                        <span className="dl-episode-title">Master Besi</span>
                                        <span className="dl-episode-duration">24:02</span>
                                    </a>

                                    <a href="#" className="dl-episode-item">
                                        <span className="dl-episode-number">Episode 4</span>
                                        <span className="dl-episode-title">Pertarungan Pertama</span>
                                        <span className="dl-episode-duration">23:56</span>
                                    </a>

                                    <a href="#" className="dl-episode-item">
                                        <span className="dl-episode-number">Episode 5</span>
                                        <span className="dl-episode-title">Akademi Shrek</span>
                                        <span className="dl-episode-duration">24:21</span>
                                    </a>

                                    <a href="#" className="dl-episode-item">
                                        <span className="dl-episode-number">Episode 6</span>
                                        <span className="dl-episode-title">Ujian Masuk</span>
                                        <span className="dl-episode-duration">24:10</span>
                                    </a>

                                    <a href="#" className="dl-episode-item">
                                        <span className="dl-episode-number">Episode 7</span>
                                        <span className="dl-episode-title">Tujuh Monster Shrek</span>
                                        <span className="dl-episode-duration">24:15</span>
                                    </a>

                                    <a href="#" className="dl-episode-item">
                                        <span className="dl-episode-number">Episode 8</span>
                                        <span className="dl-episode-title">Pelatihan Keras</span>
                                        <span className="dl-episode-duration">23:59</span>
                                    </a>
                                </div>
                            </div>

                            <div className="dl-episode-pagination">
                                <button className="dl-btn-secondary"><i className="fas fa-chevron-left"></i> Sebelumnya</button>
                                <button className="dl-btn-secondary">Selanjutnya <i className="fas fa-chevron-right"></i></button>
                            </div>
                        </div>
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
            <Script src="/js/stream.js" strategy="afterInteractive" />
        </>
    );
}
