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
  release_day?: number | string;
};

export default function ScheduleSection({ scheduleRawData }: { scheduleRawData: Series[] }) {
  // 1. Generate Hari dengan Data Selisih (diff)
  const scheduleDays = useMemo(() => {
    const weekDays = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"];
    const shortDays = ["Sen", "Sel", "Rab", "Kam", "Jum", "Sab", "Min"];
    
    const today = new Date();
    const currentDayIndex = today.getDay(); 
    const adjustedTodayIndex = currentDayIndex === 0 ? 6 : currentDayIndex - 1;

    return weekDays.map((fullDay, index) => {
      const date = new Date(today);
      const diff = index - adjustedTodayIndex; // - (Masa lalu), 0 (Hari ini), + (Masa depan)
      date.setDate(today.getDate() + diff);
      
      return {
        fullDay,
        shortDay: shortDays[index],
        dateNum: date.getDate(),
        isToday: diff === 0,
        diff: diff 
      };
    });
  }, []);

  const initialToday = scheduleDays.find(d => d.isToday)?.fullDay || "Minggu";
  const [activeDay, setActiveDay] = useState(initialToday);
  const [scheduleData, setScheduleData] = useState<Series[]>([]);

  useEffect(() => {
    const weekDays = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"];
    const mappedData = scheduleRawData.map((series) => ({
      ...series,
      release_day: typeof series.release_day === 'number' && weekDays[series.release_day] 
        ? weekDays[series.release_day] 
        : "Unknown",
    }));
    setScheduleData(mappedData);
  }, [scheduleRawData]);

  const filteredSeries = scheduleData.filter((s) => s.release_day === activeDay);
  
  // Dapatkan info hari yang sedang aktif untuk logika episode
  const activeDayInfo = scheduleDays.find((d) => d.fullDay === activeDay);
  const activeDayDiff = activeDayInfo ? activeDayInfo.diff : 0;

  const scrollRef = useRef<HTMLDivElement>(null);

  const scroll = (direction: "left" | "right") => {
    if (scrollRef.current) {
      const scrollAmount = direction === "left" ? -300 : 300;
      scrollRef.current.scrollBy({ left: scrollAmount, behavior: "smooth" });
    }
  };

  // 2. Fungsi Pengecekan Update Hari Ini
  const isUpdatedToday = (dateString?: string) => {
    if (!dateString) return false;
    const updatedDate = new Date(dateString);
    const today = new Date();
    return (
      updatedDate.getDate() === today.getDate() &&
      updatedDate.getMonth() === today.getMonth() &&
      updatedDate.getFullYear() === today.getFullYear()
    );
  };

  // 3. Engine Penentu Angka Episode
  const getEpisodeDisplay = (series: Series, dayDiff: number) => {
    const currentEps = series.episodes_max_episode_number;
    if (!currentEps) return "New";
    
    if (series.status?.toLowerCase() === 'complete' || series.status?.toLowerCase() === 'completed') {
      return `Eps ${currentEps}`;
    }

    if (dayDiff < 0) {
      return `Eps ${currentEps}`; // Hari lalu
    } else if (dayDiff === 0) {
      return isUpdatedToday(series.updated_at) 
        ? `Eps ${currentEps}` 
        : `Eps ${currentEps + 1}`; // Hari ini
    } else {
      return `Eps ${currentEps + 1}`; // Masa depan
    }
  };

  return (
    <section id="schedule" className="dl-section">
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

      <div className="dl-schedule-body dl-relative-container" key={activeDay}>
        {filteredSeries.length > 0 ? (
          <>
            <button className="dl-scroll-btn dl-scroll-left" onClick={() => scroll("left")}>
              <i className="fas fa-chevron-left"></i>
            </button>

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
                      {/* 4. Eksekusi Engine Episode di sini */}
                      {getEpisodeDisplay(series, activeDayDiff)}
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