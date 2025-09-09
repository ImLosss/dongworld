import Link from "next/link";

export default function Sidebar() {
  return (
    <div className="dl-mobile-menu active">
      <Link href="#home" className="dl-active">
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