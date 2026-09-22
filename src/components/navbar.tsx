import Link from "next/link";
import SearchBehavior from "./SearchBehavior";

export default function Navbar() {
    return (
        <nav className="dl-navbar">
            <div className="dl-nav-container">
                <div className="dl-sidebar-toggle">
                    <i className="fas fa-bars"></i>
                </div>

                <Link href="/" className="dl-logo" style={{ textDecoration: "none", color: "inherit" }}>
                    <span>DongWorld</span>
                </Link>

                <div className="dl-search-container" style={{ position: "relative" }}>
                    <form id="dl-search-form">
                        <input
                            type="text"
                            name="search"
                            id="dl-search-input"
                            placeholder="Cari donghua..."
                            autoComplete="off"
                        />
                        <button type="submit">
                            <i className="fas fa-search"></i>
                        </button>
                    </form>
                    <div className="d-none d-lg-block">
                        <div id="dl-desktop-dropdown-slot"></div>
                    </div>
                </div>

                <div id="dl-mobile-search-toggle" className="dl-mobile-search-toggle">
                    <i className="fas fa-search"></i>
                </div>
            </div>

            <div id="dl-mobile-search-container" className="dl-mobile-search-container" style={{ position: "relative" }}>
                <form id="dl-mobile-search-form">
                    <input
                        type="text"
                        name="search-mobile"
                        id="dl-mobile-search-input"
                        placeholder="Cari donghua..."
                        autoComplete="off"
                    />
                    <button type="submit">
                        <i className="fas fa-search"></i>
                    </button>
                </form>
                <div className="d-block d-lg-none">
                    <div id="dl-mobile-dropdown-slot"></div>
                </div>
            </div>

            <SearchBehavior />
        </nav>
    );
}