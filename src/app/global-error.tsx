"use client";

import * as Sentry from "@sentry/nextjs";
import Link from "next/link";
import { useEffect } from "react";

export default function GlobalError({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  useEffect(() => {
    // Sentry sekarang akan terpanggil dengan sukses
    Sentry.captureException(error);
  }, [error]);

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
              <i className="fas fa-exclamation-triangle"></i>
            </div>

            <h2 style={{ marginBottom: "15px", fontSize: "1.6rem", fontWeight: 700 }}>
              Waduh, Halaman Crash!
            </h2>

            <p style={{ color: "var(--gray-color)", marginBottom: "30px", fontSize: "0.95rem", lineHeight: "1.6" }}>
              Terjadi kesalahan saat memuat tampilan halaman ini.
              Jangan khawatir, kami telah mencatat masalah ini secara otomatis.
            </p>

            <div style={{ display: "flex", gap: "15px", justifyContent: "center", flexWrap: "wrap" }}>
              <button onClick={() => reset()} className="dl-btn dl-btn-primary">
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