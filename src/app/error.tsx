"use client"; // Wajib untuk Error Boundary

import { useEffect } from "react";
import Link from "next/link";

export default function ErrorBoundary({
    error,
    reset,
}: {
    error: Error & { digest?: string };
    reset: () => void;
}) {
    useEffect(() => {
        // 1. Tampilkan di console browser
        console.error("Tertangkap oleh Error Boundary:", error);

        // 2. Kirim detail error ke server agar masuk ke log sistem
        fetch("/api/log-error", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                message: error.message,
                stack: error.stack,
                url: window.location.href,
            }),
        }).catch(() => {
            // Abaikan jika gagal
        });
    }, [error]);

    return (
        <section 
            className="dl-section" 
            style={{ 
                minHeight: "70vh", 
                display: "flex", 
                alignItems: "center", 
                justifyContent: "center",
                padding: "20px"
            }}
        >
            {/* Menggunakan class .dl-card dari template Anda */}
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
                
                {/* Menggunakan var(--gray-color) dari root CSS Anda */}
                <p style={{ color: "var(--gray-color)", marginBottom: "30px", fontSize: "0.95rem", lineHeight: "1.6" }}>
                    Terjadi kesalahan saat memuat tampilan halaman ini. 
                    Jangan khawatir, kami telah mencatat masalah ini secara otomatis.
                </p>
                
                <div style={{ display: "flex", gap: "15px", justifyContent: "center", flexWrap: "wrap" }}>
                    {/* Menggunakan class .dl-btn-primary dan .dl-btn-secondary dari template Anda */}
                    <button onClick={() => reset()} className="dl-btn dl-btn-primary">
                        <i className="fas fa-sync-alt" style={{ marginRight: "8px" }}></i> Muat Ulang
                    </button>
                    
                    <Link href="/" className="dl-btn dl-btn-secondary">
                        Ke Beranda
                    </Link>
                </div>
            </div>
        </section>
    );
}