"use client";

import { useEffect, useRef, useState } from "react";

export type Slide = {
  name: string;
  synopsis: string;
  thumbnail: string;
  slug: string;
};

export default function HeroSection({ slides }: { slides: Slide[] }) {
  const safeSlides =
    slides?.length
      ? slides
      : [
          {
            name: "DongWorld",
            synopsis: "Tidak ada data hero saat ini.",
            thumbnail: "/images/image2.jpg",
            slug: "#home",
          },
        ];

  const [index, setIndex] = useState(0);
  const [paused, setPaused] = useState(false);
  const intervalRef = useRef<number | null>(null);

  const goTo = (i: number) => setIndex((i + safeSlides.length) % safeSlides.length);
  const next = () => goTo(index + 1);
  const prev = () => goTo(index - 1);

  useEffect(() => {
    if (paused || safeSlides.length <= 1) return;

    intervalRef.current = window.setInterval(() => {
      setIndex((cur) => (cur + 1) % safeSlides.length);
    }, 5000);

    return () => {
      if (intervalRef.current) window.clearInterval(intervalRef.current);
      intervalRef.current = null;
    };
  }, [paused, safeSlides.length]);

  return (
    <section
      id="home"
      className="dl-hero-section"
      onMouseEnter={() => setPaused(true)}
      onMouseLeave={() => setPaused(false)}
      onTouchStart={() => setPaused(true)}
      onTouchEnd={() => setPaused(false)}
    >
      <div className="dl-hero-slider" style={{ transform: `translateX(-${index * 100}%)` }}>
        {safeSlides.map((s, i) => (
          <div
            key={i}
            className="dl-hero-slide"
            style={{ backgroundImage: `url('${process.env.NEXT_PUBLIC_BASE_URL_BACKEND + s.thumbnail}')` }}
          >
            <div className="dl-hero-content">
              <div className="dl-hero-info">
                <h1 className="dl-hero-title">{s.name}</h1>
                <p className="dl-hero-synopsis">{s.synopsis}</p>
                <a href={`/series/${s.slug}`} className="dl-btn-primary dl-hero-watch-btn">
                  Mulai Nonton
                </a>
              </div>
            </div>
          </div>
        ))}
      </div>

      <button type="button" className="dl-hero-prev" onClick={prev} aria-label="Previous slide">
        <i className="fas fa-chevron-left" />
      </button>
      <button type="button" className="dl-hero-next" onClick={next} aria-label="Next slide">
        <i className="fas fa-chevron-right" />
      </button>

      <div className="dl-hero-pagination">
        {safeSlides.map((_, i) => (
          <button
            key={i}
            type="button"
            className={`dl-hero-pagination-bullet ${i === index ? "active" : ""}`}
            onClick={() => goTo(i)}
            aria-label={`Go to slide ${i + 1}`}
          />
        ))}
      </div>
    </section>
  );
}