"use client";
import { useEffect } from "react";

export default function SmartlinkAd() {
  useEffect(() => {
    if (typeof window === "undefined") return;

    // ❗ Jangan jalankan untuk crawler
    if (isCrawler()) return;

    const url = "https://www.effectivegatecpm.com/r78gx5zh?key=ddf94cbeb9a2045ab67820c3959ee7af";
    const delay = 60 * 1000;

    function isCooldown() {
      const lastClick = localStorage.getItem("smartlink_last_click");
      if (!lastClick) return false;
      return Date.now() - parseInt(lastClick) < delay;
    }

    function handleClick() {
      if (isCooldown()) return;

      window.open(url, "_blank");
      localStorage.setItem("smartlink_last_click", Date.now().toString());
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
