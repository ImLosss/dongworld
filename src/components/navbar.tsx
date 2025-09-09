import Link from "next/link";

export default function Navbar() {
    return (
        <nav className="dl-navbar">
            <div className="dl-nav-container">
                {/* Sidebar Toggle Button */}
                <div className="dl-sidebar-toggle">
                    <i className="fas fa-bars"></i>
                </div>

                {/* Logo */}
                <Link href="/" className="dl-logo">
                    <span>DongWorld</span>
                </Link>

                {/* Search Container (Desktop) */}
                <div className="dl-search-container">
                    <form id="dl-search-form" action="/search">
                        <input type="text" id="dl-search-input" placeholder="Cari donghua..." />
                        <button type="submit">
                            <i className="fas fa-search"></i>
                        </button>
                    </form>
                </div>

                {/* Mobile Search Toggle */}
                <div className="dl-mobile-search-toggle">
                    <i className="fas fa-search"></i>
                </div>
            </div>

            {/* Mobile Search (Hidden by default) */}
            <div className="dl-mobile-search-container">
                <form id="dl-mobile-search-form" action="/search">
                    <input type="text" id="dl-mobile-search-input" placeholder="Cari donghua..." />
                    <button type="submit">
                        <i className="fas fa-search"></i>
                    </button>
                </form>
            </div>
        </nav>
    );
}