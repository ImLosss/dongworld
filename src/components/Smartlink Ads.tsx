"use client";
import { useEffect, useState } from "react";
import { usePathname } from "next/navigation";

const SMARTLINK_URL =
  "https://www.effectivegatecpm.com/xx3z06hf1?key=bd214403dcbfedf7a86ad57ef67b0d9f";

const MINUTE = 10 * 1000; // 10 detik
const HOUR = 60 * 60 * 1000;
const MAX_PER_HOUR = 3;

export default function SmartlinkAd() {
  const [showOverlay, setShowOverlay] = useState(false);
  const pathname = usePathname();

  useEffect(() => {
    if (typeof window === "undefined") return;
    if (isCrawler()) return;

    const checkAndShow = () => {
      if (!isCooldown()) setShowOverlay(true);
      else setShowOverlay(false);
    };

    checkAndShow();

    const onFocus = () => checkAndShow();
    const onVisibility = () => {
      if (document.visibilityState === "visible") checkAndShow();
    };

    // tambahan: cek lagi setiap user klik di halaman saat ini
    const onDocumentClick = (e: MouseEvent) => {
      const target = e.target as HTMLElement | null;
      // abaikan klik pada overlay itu sendiri
      if (target?.closest('[data-smartlink-overlay="1"]')) return;
      checkAndShow();
    };

    window.addEventListener("focus", onFocus);
    document.addEventListener("visibilitychange", onVisibility);
    document.addEventListener("click", onDocumentClick, true);

    return () => {
      window.removeEventListener("focus", onFocus);
      document.removeEventListener("visibilitychange", onVisibility);
      document.removeEventListener("click", onDocumentClick, true);
    };
  }, [pathname]);

  function isCooldown() {
    const raw = localStorage.getItem("smartlink_clicks");
    const lastClickRaw = localStorage.getItem("smartlink_last_click");
    const now = Date.now();

    const clicks: number[] = raw ? JSON.parse(raw) : [];
    const recent = clicks.filter((t) => now - t < HOUR);

    localStorage.setItem("smartlink_clicks", JSON.stringify(recent));

    const lastClick = lastClickRaw ? parseInt(lastClickRaw, 10) : 0;
    const inMinuteCooldown = now - lastClick < MINUTE;
    const exceededHourly = recent.length >= MAX_PER_HOUR;

    return inMinuteCooldown || exceededHourly;
  }

  function recordClick() {
    const raw = localStorage.getItem("smartlink_clicks");
    const now = Date.now();
    const clicks: number[] = raw ? JSON.parse(raw) : [];
    const recent = clicks.filter((t) => now - t < HOUR);

    recent.push(now);
    localStorage.setItem("smartlink_clicks", JSON.stringify(recent));
    localStorage.setItem("smartlink_last_click", now.toString());

    setShowOverlay(false);
  }

  if (!showOverlay) return null;

  return (
    <a
      data-smartlink-overlay="1"
      href={SMARTLINK_URL}
      target="_blank"
      rel="noopener noreferrer"
      onClick={recordClick}
      style={{
        position: "fixed",
        inset: 0,
        zIndex: 99999,
        display: "block",
        background: "transparent",
        cursor: "pointer",
      }}
    />
  );
}

function isCrawler() {
  const ua = navigator.userAgent.toLowerCase();
  return (
    ua.includes("googlebot") ||
    ua.includes("bingbot") ||
    ua.includes("slurp") ||
    ua.includes("duckduckbot") ||
    ua.includes("baiduspider") ||
    ua.includes("yandex")
  );
}