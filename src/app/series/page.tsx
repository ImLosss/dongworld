import Image from "next/image";
import SeriesList from "@/components/home/SeriesList";
import Script from "next/script";
import Link from "next/link";
import SeriesFilters from "@/components/series/SeriesFilters";

export default async function Series({searchParams}: { searchParams: Promise<{ search?: string; type?: string; genre?: string; status?: string }>; }) {
    const params = await searchParams;

    const qs = new URLSearchParams();
    if (params.search) qs.set("search", params.search);
    if (params.type) qs.set("type", params.type);
    if (params.genre) qs.set("genre", params.genre);
    if (params.status) qs.set("status", params.status);
    
    const response = await fetch(`${process.env.BASE_URL_BACKEND}api/series?${qs.toString()}`, {
        headers: {
            'X-API-KEY': process.env.APIKEY_BACKEND as string,
        },
        cache: 'no-store'
    });
    const data = await response.json();

    const responseGenres = await fetch(`${process.env.BASE_URL_BACKEND}api/genres`, {
        headers: {
            'X-API-KEY': process.env.APIKEY_BACKEND as string,
        },
        cache: 'no-store'
    });
    const dataFilters = await responseGenres.json();

    return (
        <>
            <div className="row" style={{ marginTop: '70px' }}>
                <div className="col-12 col-lg-9">
                    <section id="all-series" className="dl-section">
                        {/* Breadcrumb */}
                        <div className="dl-breadcrumb-card">
                            <nav className="dl-breadcrumb" aria-label="Breadcrumb">
                                <ol>
                                    <li><Link href="/">Beranda</Link></li>
                                    <li aria-current="page">All Series</li>
                                </ol>
                            </nav>
                        </div>
                        <div className="dl-section-header">
                            <h2>Semua Donghua</h2>
                        </div>
                        <SeriesFilters dataFilters={dataFilters} />
                        {data.data.data.length === 0 && (
                        <section id="dl-search-results" className="dl-section">                            
                            <div className="dl-search-results-container">
                                <div className="dl-empty-state">
                                    <i className="fas fa-search"></i>
                                    {(() => {
                                        const hasFilters = !!(params.type || params.genre || params.status);
                                        if (params.search && hasFilters) {
                                            return <p>Tidak ada hasil untuk "{params.search}" dengan filter yang dipilih</p>;
                                        } else if (params.search && !hasFilters) {
                                            return <p>Tidak ada hasil untuk “{params.search}”</p>;
                                        } else if (hasFilters) {
                                            return <p>Tidak ada hasil dengan filter yang dipilih</p>;
                                        }
                                    })()}
                                </div>
                            </div>
                        </section>
                        )}
                        <div className="dl-card-container">
                            {data.data.data.map((series: any) => {
                                return (
                                    <SeriesList key={series.id} href={`/series/${series.slug}`}>
                                        <div className="dl-card-img">
                                            <Image src={process.env.NEXT_PUBLIC_BASE_URL_BACKEND + series.thumbnail} sizes="368px" alt="alchemy" fill />
                                            <div className="dl-card-badge">NEW</div>
                                        </div>
                                        <div className="dl-card-content">
                                            <h3 className="dl-card-title">{series.name}</h3>
                                            <div className="dl-card-meta">
                                                <span>{series.episodes_max_episode_number || 0}/{series.total_episodes} eps</span>
                                                <span className="dl-card-rating"><i className="fas fa-star"></i>{series.rating}</span>
                                            </div>
                                        </div>
                                    </SeriesList>
                                )
                            })}
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
        </>
    );
}
