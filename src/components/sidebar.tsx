"use client";

import Link from "next/link";
import { useEffect, useState } from "react";

export default function Sidebar() {
  const [active, setActive] = useState(false);

  useEffect(() => {
    const btn = document.querySelector(".dl-sidebar-toggle");
    if (!btn) return;

    const onClick = () => setActive((v) => !v);
    btn.addEventListener("click", onClick);

    return () => btn.removeEventListener("click", onClick);
  }, []);

  return (
    <div className={`dl-mobile-menu ${active ? "dl-active" : ""}`}>
      <Link href="#home">
        <i className="fas fa-home"></i> Beranda
      </Link>
      <Link href="#top">
        <i className="fas fa-crown"></i> Top Donghua
      </Link>
      <Link href="#history">
        <i className="fas fa-history"></i> Riwayat
      </Link>
      <Link href="#movies">
        <i className="fas fa-film"></i> Movie
      </Link>
    </div>
  );
}