"use client";

import { usePathname, useRouter, useSearchParams } from "next/navigation";
import Link from "next/link";
import { FormEvent } from "react";

export default function Navbar() {
    const router = useRouter();
    const pathname = usePathname();
    const searchParams = useSearchParams();
    const onSearchSubmit = (e: FormEvent<HTMLFormElement>) => {
        e.preventDefault();

        const form = e.currentTarget;
        const input = form.querySelector<HTMLInputElement>('input[name="search"]');
        const value = (input?.value ?? "").trim();

        // hanya preserve params kalau sedang di halaman /series
        const params = new URLSearchParams(pathname === "/series" ? searchParams.toString() : "");

        if (value) params.set("search", value);
        else params.delete("search");

        const qs = params.toString();
        router.push(qs ? `/series?${qs}` : "/series");
    };
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
                    <form id="dl-search-form" onSubmit={onSearchSubmit}>
                        <input type="text" name="search" id="dl-search-input" placeholder="Cari donghua..." />
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