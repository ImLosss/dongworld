"use client";
import { useEffect } from "react";

export default function SmartlinkAd() {
  useEffect(() => {
    if (typeof window === "undefined") return;

    // ❗ Jangan jalankan untuk crawler
    if (isCrawler()) return;

    const url = "https://www.effectivegatecpm.com/xx3z06hf1?key=bd214403dcbfedf7a86ad57ef67b0d9f";
    const minute = 10 * 1000;
    const hour = 60 * 60 * 1000;
    const maxPerHour = 3;

    function isCooldown() {
      const raw = localStorage.getItem("smartlink_clicks");
      const lastClickRaw = localStorage.getItem("smartlink_last_click");
      const now = Date.now();

      const clicks: number[] = raw ? JSON.parse(raw) : [];
      const recent = clicks.filter((t) => now - t < hour);

      localStorage.setItem("smartlink_clicks", JSON.stringify(recent));

      const lastClick = lastClickRaw ? parseInt(lastClickRaw) : 0;
      const inMinuteCooldown = now - lastClick < minute;
      const exceededHourly = recent.length >= maxPerHour;

      return inMinuteCooldown || exceededHourly;
    }

    function handleClick() {
      if (isCooldown()) return;

      window.open(url, "_blank");

      const raw = localStorage.getItem("smartlink_clicks");
      const now = Date.now();
      const clicks: number[] = raw ? JSON.parse(raw) : [];
      const recent = clicks.filter((t) => now - t < hour);
      recent.push(now);
      localStorage.setItem("smartlink_clicks", JSON.stringify(recent));
      localStorage.setItem("smartlink_last_click", now.toString());
    }

    document.addEventListener("click", handleClick);

    return () => {
      document.removeEventListener("click", handleClick);
    };
  }, []);

  return null;
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
