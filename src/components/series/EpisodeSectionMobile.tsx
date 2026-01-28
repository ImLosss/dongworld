"use client";
import { useState, useEffect } from "react";

export default function EpisodeSection({ slug, initialEpisodes }: { slug: string, initialEpisodes: any }) {
    
  // Load page dari localStorage
  const getSavedPage = () => {
      if (typeof window !== 'undefined') {
          const saved = localStorage.getItem(`episode_page_${slug}`);
          if(saved && saved > initialEpisodes.last_page) {
            localStorage.setItem(`episode_page_${slug}`, initialEpisodes.last_page.toString());
            return initialEpisodes.last_page;
          }
          return saved ? parseInt(saved) : initialEpisodes.current_page;
      }
      return initialEpisodes.current_page;
  };
  
  const [episodes, setEpisodes] = useState(initialEpisodes);
  const [page, setPage] = useState(getSavedPage());
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (page === episodes.current_page) return;
    setLoading(true);
    localStorage.setItem(`episode_page_${slug}`, page.toString());
    fetch(`/api/series/${slug}?page=${page}`)
      .then(res => res.json())
      .then(data => setEpisodes(data.episodes))
      .finally(() => setLoading(false));
  }, [page, slug, episodes.current_page]);

  return (
    <section className="dl-mobile-episodes">
      <div className="dl-episode-header">
        <h2>Daftar Episode</h2>
      </div>
      <div className="dl-mobile-episode-list-container">
        {loading && (
          <div className="dl-episode-loading">
            <div className="spinner"></div>
          </div>
        )}
        <div className="dl-mobile-episode-list">
          {episodes.data && episodes.data.length > 0 ? (
            episodes.data.map((episode: any) => (
              <a key={episode.id} href={'/watch/' + episode.slug} className="dl-mobile-episode-item">
                Episode {episode.episode_number}
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
      <div className="dl-episode-pagination">
        <button
          className="dl-btn-secondary"
          disabled={episodes.current_page === 1}
          onClick={() => setPage(page - 1)}
        >
          <i className="fas fa-chevron-left"></i> Sebelumnya
        </button>
        <button
          className="dl-btn-secondary"
          disabled={episodes.current_page === episodes.last_page}
          onClick={() => setPage(page + 1)}
        >
          Selanjutnya <i className="fas fa-chevron-right"></i>
        </button>
      </div>
    </section>
  );
}