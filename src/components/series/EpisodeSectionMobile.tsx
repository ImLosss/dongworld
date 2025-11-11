"use client";
import { useState, useEffect } from "react";

export default function EpisodeSection({ slug, initialEpisodes }: { slug: string, initialEpisodes: any }) {
  const [episodes, setEpisodes] = useState(initialEpisodes);
  const [page, setPage] = useState(episodes.current_page);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (page === episodes.current_page) return;
    setLoading(true);
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
          {episodes.data.map((episode: any) => (
            <a key={episode.id} href="#" className="dl-mobile-episode-item">
              Episode {episode.episode_number}
            </a>
          ))}
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