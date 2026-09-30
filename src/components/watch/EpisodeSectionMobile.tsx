"use client";
import { openSmartlink } from "@/lib/smartlink";
import { useState, useEffect, useCallback, useMemo } from "react";
import { getEpisodePage, saveEpisodePage } from "@/lib/historyDb";

export default function EpisodeSection({ slugSeries, slugEpisode, initialEpisodes, selectedEpisode }: { slugSeries: string, slugEpisode: string, initialEpisodes: any, selectedEpisode: any }) {
  const pageSize = 25;
  const sortedEpisodes = useMemo(
    () => {
      const episodeList = Array.isArray(initialEpisodes) ? initialEpisodes : (initialEpisodes?.data || []);
      return [...episodeList].sort((a: any, b: any) => a.episode_number - b.episode_number);
    },
    [initialEpisodes]
  );

  const pageItems = Array.from({ length: Math.ceil(sortedEpisodes.length / pageSize) }, (_, idx) => {
    const startIndex = idx * pageSize;
    const endIndex = Math.min(startIndex + pageSize, sortedEpisodes.length) - 1;
    const startEpisode = sortedEpisodes[startIndex]?.episode_number ?? 0;
    const endEpisode = sortedEpisodes[endIndex]?.episode_number ?? 0;
    return {
      page: idx + 1,
      startEpisode,
      endEpisode,
    };
  });

  const getPageFromSelectedEpisode = useCallback(() => {
        if (selectedEpisode == null) return 1;
        const target = Number(selectedEpisode);
        const idx = sortedEpisodes.findIndex((ep: any) => Number(ep.episode_number) === target);
        if (idx === -1) return 1;
        return Math.floor(idx / pageSize) + 1;
    }, [selectedEpisode, sortedEpisodes]);

  const [page, setPage] = useState(() => getPageFromSelectedEpisode() || 1);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const initialPage = getPageFromSelectedEpisode();
    let active = true;

    if (selectedEpisode != null) {
      setPage(initialPage);
      void saveEpisodePage(slugSeries, initialPage);
    } else {
      getEpisodePage(slugSeries).then((storedPage) => {
        if (active && storedPage && storedPage <= pageItems.length) {
          setPage(storedPage);
        }
      });
    }

    return () => {
      active = false;
    };
  }, [getPageFromSelectedEpisode, pageItems.length, selectedEpisode, slugSeries]);

  const startIndex = (page - 1) * pageSize;
  const endIndex = Math.min(startIndex + pageSize, sortedEpisodes.length);
  const pageEpisodes = sortedEpisodes.slice(startIndex, endIndex);

  const handlePageChange = (nextPage: number) => {
    void saveEpisodePage(slugSeries, nextPage);
    setLoading(true);
    setPage(nextPage);
    setTimeout(() => setLoading(false), 150);
  };

  return (
    <section className="dl-mobile-episodes" aria-label="Daftar Episode">
      <div className="dl-episode-header">
        <span className="dl-episode-heading">Daftar Episode</span>
      </div>
      <div className="dl-mobile-episode-list-container">
        {loading && (
          <div className="dl-episode-loading">
            <div className="spinner"></div>
          </div>
        )}
        <div className="dl-mobile-episode-list">
          {pageEpisodes.length > 0 ? (
            pageEpisodes.map((episode: any) => (
              <a key={episode.id} href={'/watch/' + episode.slug} className={slugEpisode === episode.slug ? "dl-mobile-episode-item active" : "dl-mobile-episode-item"} onClick={openSmartlink}>
                {episode.name 
                  ? episode.name 
                  : `${episode.is_preview ? 'PV' : 'Episode'} ${episode.episode_number}`}
              </a>
            ))
          ) : (
            <div className="dl-episode-empty">
              <i className="fas fa-inbox"></i>
              <p>Segera tayang</p>
            </div>
          )}
        </div>
      </div>
      {pageItems.length > 1 && (
        <div className="dl-episode-pagination">
          <div className="dl-episode-page-chips">
            {pageItems.map((item) => (
              <button
                key={item.page}
                className={item.page === page ? "dl-episode-page-chip active" : "dl-episode-page-chip"}
                disabled={loading}
                onClick={() => handlePageChange(item.page)}
              >
                {item.startEpisode}-{item.endEpisode}
              </button>
            ))}
          </div>
        </div>
      )}
    </section>
  );
}