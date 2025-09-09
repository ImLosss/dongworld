import Link from "next/link";

export default function Footer() {
  return (
    <footer className="dl-footer">
      <div className="dl-footer-container">
        <div className="dl-footer-brand">
          <Link href="/" className="dl-logo">
            {/* <img src="/images/logo.png" alt="DongWorld Logo" /> */}
            <span>DongWorld</span>
          </Link>
          <p>
            Platform streaming donghua terbaik dengan koleksi terlengkap dan kualitas HD
          </p>
          <div className="dl-social-links">
            <a href="#" aria-label="Facebook">
              <i className="fab fa-facebook"></i>
            </a>
            <a href="#" aria-label="Twitter">
              <i className="fab fa-twitter"></i>
            </a>
            <a href="#" aria-label="Instagram">
              <i className="fab fa-instagram"></i>
            </a>
            <a href="#" aria-label="Discord">
              <i className="fab fa-discord"></i>
            </a>
          </div>
        </div>
      </div>

      <div className="dl-footer-bottom">
        <p>&copy; {new Date().getFullYear()} DongWorld. All rights reserved.</p>
      </div>
    </footer>
  );
}