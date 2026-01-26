import Image from "next/image";
import SeriesList from "@/components/home/SeriesList";
import Link from "next/link";
import SeriesFilters from "@/components/series/SeriesFilters";
import { notFound } from "next/navigation";
import HistorySection from "@/components/home/HistorySection";
import { Suspense } from "react";

export default async function Series({ searchParams }: { searchParams: Promise<{ search?: string; type?: string; genre?: string; status?: string, page?: string }>; }) {
    const params = await searchParams;

    const qs = new URLSearchParams();
    if (params.search) qs.set("search", params.search);
    if (params.type) qs.set("type", params.type);
    if (params.genre) qs.set("genre", params.genre);
    if (params.status) qs.set("status", params.status);
    if (params.page) qs.set("page", params.page);

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

    const buildPageLink = (page: number) => {
        const next = new URLSearchParams(qs.toString());
        next.set("page", page.toString());
        return `/series?${next.toString()}`;
    };

    const getPageItems = (current: number, last: number) => {
        if (current > last) return notFound();
        const items: (number | "...")[] = [];
        const delta = 1;

        const range: number[] = [];
        const start = Math.max(2, current - delta);
        const end = Math.min(last - 1, current + delta);

        range.push(1);
        for (let i = start; i <= end; i++) range.push(i);
        if (last > 1) range.push(last);

        let prev: number | null = null;
        for (const num of range) {
            if (prev && num - prev > 1) items.push("...");
            items.push(num);
            prev = num;
        }
        return items;
    };

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
                        <Suspense fallback={null}>
                            <SeriesFilters dataFilters={dataFilters} />
                        </Suspense>
                        {data.data.data.length === 0 && (
                            <section id="dl-search-results" className="dl-section">
                                <div className="dl-search-results-container">
                                    <div className="dl-empty-state">
                                        <i className="fas fa-search"></i>
                                        {(() => {
                                            const hasFilters = !!(params.type || params.genre || params.status);
                                            if (params.search && hasFilters) {
                                                return <p>Tidak ada hasil untuk &quot;{params.search}&quot; dengan filter yang dipilih</p>;
                                            } else if (params.search && !hasFilters) {
                                                return <p>Tidak ada hasil untuk &quot;{params.search}&quot;</p>;
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
                                            {/* <div className="dl-card-badge">NEW</div> */}
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
                        {/* Pagination (Laravel paginate) */}
                        {data.data?.last_page > 1 && (
                            <div className="dl-paginate">
                                {/* <Link
                                    className="dl-btn-secondary"
                                    href={buildPageLink(Math.max(1, data.data.current_page - 1))}
                                    aria-disabled={data.data.current_page === 1}
                                >
                                    <i className="fas fa-chevron-left"></i> Prev
                                </Link> */}

                                {getPageItems(data.data.current_page, data.data.last_page).map((item, idx) =>
                                    item === "..." ? (
                                        <span key={`dots-${idx}`} className="dl-btn-secondary" aria-disabled="true">...</span>
                                    ) : (
                                        <Link
                                            key={item}
                                            className={`dl-btn-secondary ${item === data.data.current_page ? "dl-btn-primary" : ""}`}
                                            href={buildPageLink(item)}
                                        >
                                            {item}
                                        </Link>
                                    )
                                )}

                                {/* <Link
                                    className="dl-btn-secondary"
                                    href={buildPageLink(Math.min(data.data.last_page, data.data.current_page + 1))}
                                    aria-disabled={data.data.current_page === data.data.last_page}
                                >
                                    Next <i className="fas fa-chevron-right"></i>
                                </Link> */}
                            </div>
                        )}
                    </section>
                </div>
                <div className="col-12 col-md-3">
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
