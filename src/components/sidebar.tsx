"use client";

import Link from "next/link";
import { useEffect, useState } from "react";

export default function Sidebar() {
  const [active, setActive] = useState(false);
  const [showVipModal, setShowVipModal] = useState(false);
  const [vipCode, setVipCode] = useState("");
  const [showSuccess, setShowSuccess] = useState(false);
  const [vipError, setVipError] = useState("");

  const VIP_CODE = "VIP123";

  useEffect(() => {
    const btn = document.querySelector(".dl-sidebar-toggle");
    if (!btn) return;

    const onClick = () => setActive((v) => !v);
    btn.addEventListener("click", onClick);

    return () => btn.removeEventListener("click", onClick);
  }, []);

  const handleVipSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (vipCode.trim() === VIP_CODE) {
      setShowVipModal(false);
      setVipCode("");
      setShowSuccess(true);
      setVipError("");
      setTimeout(() => { setShowSuccess(false) }, 8000);
    } else {
      setVipError("Kode VIP salah. Coba lagi.");
    }
  };

  return (
    <>
      {active && (
        <div className="dl-sidebar-backdrop" onClick={() => setActive(false)}/>
      )}
      <div className={`dl-mobile-menu ${active ? "dl-active" : ""}`}>
        <Link href="/" onClick={() => setActive(false)}>
          <i className="fas fa-home"></i> Beranda
        </Link>
        <button className="dl-vip-btn" onClick={() => { setShowVipModal(true); setActive(false); }}>
          <i className="fas fa-crown"></i> Hilangkan Iklan
        </button>
        {/* <Link href="#top">
          <i className="fas fa-crown"></i> Top Donghua
        </Link>
        <Link href="#history">
          <i className="fas fa-history"></i> Riwayat
        </Link>
        <Link href="#movies">
          <i className="fas fa-film"></i> Movie
        </Link> */}
      </div>
    {/* VIP Modal */}
      {showVipModal && (
        <div className="dl-modal-backdrop" onClick={() => setShowVipModal(false)}>
          <div className="dl-modal" onClick={(e) => e.stopPropagation()}>
            <h3>Masukkan VIP Code yang didapat dari bot telegram <Link href="https://t.me/dongworld_bot?start=vip" target="_blank">dongworld</Link> setelah berlangganan</h3>
            <form onSubmit={handleVipSubmit}>
              <input
                type="text"
                placeholder="VIP code"
                value={vipCode}
                onChange={(e) => setVipCode(e.target.value)}
              />
              {vipError && <span className="dl-input-error">{vipError}</span>}
              <div className="dl-modal-actions">
                <button type="button" className="dl-btn-secondary" onClick={() => setShowVipModal(false)}>
                  Batal
                </button>
                <button type="submit" className="dl-btn-primary">
                  Submit
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* Success Alert */}
      {showSuccess && (
        <div className="dl-alert-success">
          <div className="dl-alert-card">
            <i className="fas fa-check-circle"></i>
            <div>
              <strong>VIP aktif!</strong>
              <p>Iklan telah dihilangkan.<br></br>Aktif hingga 30 Juni 2026.</p>
            </div>
            <button onClick={() => setShowSuccess(false)}>×</button>
          </div>
        </div>
      )}
    </>
  );
}