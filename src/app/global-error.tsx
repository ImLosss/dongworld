"use client";

import * as Sentry from "@sentry/nextjs";
import Link from "next/link";
import { useEffect, useState } from "react";

export default function GlobalError({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  const [isNonChrome, setIsNonChrome] = useState(false);
  
  const isChunkError = 
    error?.message?.toLowerCase().includes("failed to load chunk") || 
    error?.name === "ChunkLoadError";

  useEffect(() => {
    Sentry.captureException(error);

    const userAgent = navigator.userAgent;
    const vendor = navigator.vendor;
    
    const isChrome = /Chrome/i.test(userAgent) && /Google Inc/i.test(vendor);
    
    if (!isChrome) {
      setIsNonChrome(true);
    }
  }, [error, isChunkError]);

  return (
    <html lang="id">
      <body>
        <section
          className="dl-section"
          style={{
            minHeight: "70vh",
            display: "flex",
            alignItems: "center",
            justifyContent: "center",
            padding: "20px",
            backgroundColor: "var(--dark-color)",
            color: "var(--light-color)",
            fontFamily: "var(--font-primary)"
          }}
        >
          <div
            className="dl-card"
            style={{
              padding: "40px 30px",
              textAlign: "center",
              maxWidth: "500px",
              width: "100%",
              display: "flex",
              flexDirection: "column",
              alignItems: "center"
            }}
          >
            <div style={{ fontSize: "4rem", color: "var(--primary-color)", marginBottom: "20px" }}>
              <i className={isChunkError ? "fas fa-sync-alt fa-spin" : "fas fa-exclamation-triangle"}></i>
            </div>

            <h2 style={{ marginBottom: "15px", fontSize: "1.6rem", fontWeight: 700 }}>
              {isChunkError ? "Sistem Diperbarui!" : "Waduh, Halaman Crash!"}
            </h2>

            <p style={{ color: "var(--gray-color)", marginBottom: "20px", fontSize: "0.95rem", lineHeight: "1.6" }}>
              {isChunkError 
                ? "Kami baru saja melakukan pembaruan sistem ke versi terbaru. Silakan muat ulang (Reload) halaman ini. Jika halaman masih bermasalah, mohon bersihkan riwayat Cache browser Anda (Clear Cache), lalu coba lagi." 
                : "Terjadi kesalahan saat memuat tampilan halaman ini. Jangan khawatir, kami telah mencatat masalah ini secara otomatis."}
            </p>

            {isNonChrome && (
              <div style={{
                backgroundColor: "rgba(255, 204, 0, 0.1)",
                border: "1px solid #ffcc00",
                color: "#ffcc00",
                padding: "12px 15px",
                borderRadius: "8px",
                marginBottom: "30px",
                fontSize: "0.85rem",
                lineHeight: "1.5"
              }}>
                <i className="fas fa-info-circle" style={{ marginRight: "8px" }}></i>
                Sepertinya Anda tidak menggunakan <strong>Google Chrome</strong>. Jika masalah ini terus berulang, cobalah buka menggunakan Chrome untuk pengalaman yang lebih stabil.
              </div>
            )}

            <div style={{ display: "flex", gap: "15px", justifyContent: "center", flexWrap: "wrap", marginTop: !isNonChrome ? "10px" : "0" }}>
              {/* 4. Ubah Action Button: Refresh Penuh untuk ChunkError, Reset React untuk Error Biasa */}
              <button 
                onClick={() => isChunkError ? window.location.reload() : reset()} 
                className="dl-btn dl-btn-primary"
              >
                <i className="fas fa-sync-alt" style={{ marginRight: "8px" }}></i> Muat Ulang
              </button>

              <Link href="/" className="dl-btn dl-btn-secondary">
                Ke Beranda
              </Link>
            </div>
          </div>
        </section>
      </body>
    </html>
  );
}