"use client";

import { useState, useEffect, useMemo, useRef } from "react";
import Image from "next/image";
import SeriesList from "@/components/home/SeriesList";

type Series = {
  id: number;
  name: string;
  slug: string;
  thumbnail: string;
  episodes_max_episode_number?: number;
  total_episodes?: number;
  rating?: string;
  updated_at?: string;
  status?: string;
  release_day?: string; 
};

export default function ScheduleSection({ seriesData }: { seriesData: Series[] }) {
  // Generate hari & tanggal untuk minggu ini secara dinamis
  const scheduleDays = useMemo(() => {
    const weekDays = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"];
    const shortDays = ["Sen", "Sel", "Rab", "Kam", "Jum", "Sab", "Min"];
    
    const today = new Date();
    const currentDayIndex = today.getDay(); // 0 (Minggu) - 6 (Sabtu)
    // Sesuaikan agar Senin = 0, Minggu = 6
    const adjustedTodayIndex = currentDayIndex === 0 ? 6 : currentDayIndex - 1;

    return weekDays.map((fullDay, index) => {
      const date = new Date(today);
      const diff = index - adjustedTodayIndex;
      date.setDate(today.getDate() + diff);
      
      return {
        fullDay,
        shortDay: shortDays[index],
        dateNum: date.getDate(),
        isToday: diff === 0
      };
    });
  }, []);

  // Default aktif adalah hari ini
  const initialToday = scheduleDays.find(d => d.isToday)?.fullDay || "Minggu";
  const [activeDay, setActiveDay] = useState(initialToday);
  const [scheduleData, setScheduleData] = useState<Series[]>([]);

  useEffect(() => {
    // Mock data sementara
    const weekDays = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"];
    const mappedData = seriesData.map((series) => ({
      ...series,
      release_day: weekDays[(series.id || 0) % 7],
    }));
    setScheduleData(mappedData);
  }, [seriesData]);

  const filteredSeries = scheduleData.filter((s) => s.release_day === activeDay);

  // Tambahkan useRef untuk wadah scroll
  const scrollRef = useRef<HTMLDivElement>(null);

  // Fungsi untuk menggeser secara manual
  const scroll = (direction: "left" | "right") => {
    if (scrollRef.current) {
      const scrollAmount = direction === "left" ? -300 : 300; // Jarak geser (px)
      scrollRef.current.scrollBy({ left: scrollAmount, behavior: "smooth" });
    }
  };

  return (
    <section id="schedule" className="dl-section">
      {/* Navigasi Kotak Menyatu (Segmented Control) */}
      <div className="dl-schedule-segmented-wrapper">
        <div className="dl-schedule-segmented">
          {scheduleDays.map((item) => {
            const isActive = activeDay === item.fullDay;
            
            return (
              <div
                key={item.fullDay}
                onClick={() => setActiveDay(item.fullDay)}
                className={`dl-segment-item ${isActive ? "active" : ""} ${item.isToday ? "today" : ""}`}
              >
                <span className="dl-segment-day">{item.shortDay}</span>
                <span className="dl-segment-date">{item.dateNum}</span>
              </div>
            );
          })}
        </div>
      </div>

      {/* Konten Card Series dengan Tombol Scroll */}
      <div className="dl-schedule-body dl-relative-container" key={activeDay}>
        {filteredSeries.length > 0 ? (
          <>
            {/* Tombol Kiri (Desktop Only) */}
            <button className="dl-scroll-btn dl-scroll-left" onClick={() => scroll("left")}>
              <i className="fas fa-chevron-left"></i>
            </button>

            {/* Container dihubungkan dengan ref */}
            <div className="dl-card-container dl-schedule-horizontal" ref={scrollRef}>
              {filteredSeries.map((series) => (
                <SeriesList key={series.id} href={`/series/${series.slug}`}>
                <div className="dl-card-img">
                  <Image 
                    src={`/api/image?path=${encodeURIComponent(series.thumbnail)}`} 
                    sizes="368px" 
                    alt={series.name} 
                    fill 
                  />
                  <div className="dl-card-badge">
                    {series.episodes_max_episode_number ? `Eps ${series.episodes_max_episode_number}` : "New"}
                  </div>
                </div>
                <div className="dl-card-content">
                  <h3 className="dl-card-title">{series.name}</h3>
                  <div className="dl-card-meta">
                    <span>{series.episodes_max_episode_number || 0}/{series.total_episodes ? series.total_episodes : "?"} eps</span>
                    <span className="dl-card-rating">
                      <i className="fas fa-star"></i>{series.rating ? series.rating : "N/A"}
                    </span>
                  </div>
                </div>
              </SeriesList>
              ))}
            </div>

            {/* Tombol Kanan (Desktop Only) */}
            <button className="dl-scroll-btn dl-scroll-right" onClick={() => scroll("right")}>
              <i className="fas fa-chevron-right"></i>
            </button>
          </>
        ) : (
          <div className="dl-schedule-empty">
            <p>Belum ada rilis untuk hari {activeDay}.</p>
          </div>
        )}
      </div>
    </section>
  );
}