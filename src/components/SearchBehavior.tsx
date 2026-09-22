"use client";

import { usePathname, useRouter, useSearchParams } from "next/navigation";
import { useEffect, useRef, useState } from "react";
import { createPortal } from "react-dom";
import Link from "next/link";
import Image from "next/image";
import { fetchLiveSearch } from "@/app/actions/search";

export default function SearchBehavior() {
    const [query, setQuery] = useState("");
    const [liveResults, setLiveResults] = useState<any[]>([]);
    const [isSearching, setIsSearching] = useState(false);
    const [showDropdown, setShowDropdown] = useState(false);
    const [active, setActive] = useState(false);

    const [desktopSlot, setDesktopSlot] = useState<HTMLElement | null>(null);
    const [mobileSlot, setMobileSlot] = useState<HTMLElement | null>(null);

    const router = useRouter();
    const pathname = usePathname();
    const searchParams = useSearchParams();

    const activeRef = useRef(active);
    activeRef.current = active;

    // Ambil elemen statis dari DOM setelah mount (tanpa merender ulang mereka)
    useEffect(() => {
        setDesktopSlot(document.getElementById("dl-desktop-dropdown-slot"));
        setMobileSlot(document.getElementById("dl-mobile-dropdown-slot"));

        const toggleEl = document.getElementById("dl-mobile-search-toggle");
        const mobileContainerEl = document.getElementById("dl-mobile-search-container");
        const desktopContainerEl = document.querySelector(".dl-search-container");
        const desktopInput = document.getElementById("dl-search-input") as HTMLInputElement | null;
        const mobileInput = document.getElementById("dl-mobile-search-input") as HTMLInputElement | null;
        const desktopForm = document.getElementById("dl-search-form") as HTMLFormElement | null;
        const mobileForm = document.getElementById("dl-mobile-search-form") as HTMLFormElement | null;

        const syncInputs = (value: string) => {
            if (desktopInput && desktopInput.value !== value) desktopInput.value = value;
            if (mobileInput && mobileInput.value !== value) mobileInput.value = value;
        };

        const handleInput = (e: Event) => {
            const value = (e.target as HTMLInputElement).value;
            syncInputs(value);
            setQuery(value);
        };

        const handleToggleClick = (e: MouseEvent) => {
            e.stopPropagation();
            setActive((prev) => {
                const next = !prev;
                mobileContainerEl?.classList.toggle("dl-active", next);
                if (next && query.trim().length >= 2) setShowDropdown(true);
                return next;
            });
        };

        const handleSubmit = (e: Event) => {
            e.preventDefault();
            const value = query.trim();
            setShowDropdown(false);
            if (activeRef.current) {
                setActive(false);
                mobileContainerEl?.classList.remove("dl-active");
            }

            const params = new URLSearchParams(pathname === "/series" ? searchParams.toString() : "");
            if (value) params.set("search", value);
            else params.delete("search");
            params.delete("page");

            const qs = params.toString();
            router.push(qs ? `/series?${qs}` : "/series");
        };

        const handleOutsideClick = (event: MouseEvent) => {
            const target = event.target as Node;
            if (toggleEl?.contains(target)) return;
            const insideDesktop = desktopContainerEl?.contains(target);
            const insideMobile = mobileContainerEl?.contains(target);
            if (!insideDesktop && !insideMobile) {
                setActive(false);
                mobileContainerEl?.classList.remove("dl-active");
                setShowDropdown(false);
            }
        };

        desktopInput?.addEventListener("input", handleInput);
        mobileInput?.addEventListener("input", handleInput);
        toggleEl?.addEventListener("click", handleToggleClick);
        desktopForm?.addEventListener("submit", handleSubmit);
        mobileForm?.addEventListener("submit", handleSubmit);
        document.addEventListener("mousedown", handleOutsideClick);

        return () => {
            desktopInput?.removeEventListener("input", handleInput);
            mobileInput?.removeEventListener("input", handleInput);
            toggleEl?.removeEventListener("click", handleToggleClick);
            desktopForm?.removeEventListener("submit", handleSubmit);
            mobileForm?.removeEventListener("submit", handleSubmit);
            document.removeEventListener("mousedown", handleOutsideClick);
        };
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [query, pathname, searchParams]);

    // Live search debounce
    useEffect(() => {
        if (pathname === "/series") {
            setShowDropdown(false);
            return;
        }
        if (query.trim().length < 2) {
            setLiveResults([]);
            setShowDropdown(false);
            return;
        }

        let ignore = false; // ⬅️ guard

        const timeoutId = setTimeout(async () => {
            setIsSearching(true);
            setShowDropdown(true);
            const results = await fetchLiveSearch(query);
            if (!ignore) {           // ⬅️ hanya update state kalau masih relevan
                setLiveResults(results);
                setIsSearching(false);
            }
        }, 500);

        return () => {
            ignore = true;           // ⬅️ set true saat cleanup (query/pathname berubah atau unmount)
            clearTimeout(timeoutId);
        };
    }, [query, pathname]);

    const DropdownContent = () => {
        if (!showDropdown || pathname === "/series") return null;
        return (
            <div className="dl-search-dropdown">
                {isSearching ? (
                    <div className="dl-search-dropdown-msg">Mencari...</div>
                ) : liveResults.length > 0 ? (
                    liveResults.map((item) => (
                        <Link
                            href={`/series/${item.slug}`}
                            key={item.id}
                            className="dl-search-dropdown-item"
                            onClick={() => {
                                setShowDropdown(false);
                                setActive(false);
                                setQuery("");
                                setLiveResults([]);
                                document.getElementById("dl-mobile-search-container")?.classList.remove("dl-active");

                                const desktopInput = document.getElementById("dl-search-input") as HTMLInputElement | null;
                                const mobileInput = document.getElementById("dl-mobile-search-input") as HTMLInputElement | null;
                                if (desktopInput) desktopInput.value = "";
                                if (mobileInput) mobileInput.value = "";
                            }}
                            style={{ textDecoration: "none", color: "inherit" }}
                        >
                            <div style={{ position: "relative", width: "45px", height: "65px", flexShrink: 0, borderRadius: "4px", overflow: "hidden" }}>
                                <Image
                                    src={`/api/image?path=${encodeURIComponent(item.thumbnail)}`}
                                    sizes="45px"
                                    alt={item.name}
                                    fill
                                    style={{ objectFit: "cover" }}
                                />
                            </div>
                            <div className="dl-dropdown-info">
                                <h4>{item.name}</h4>
                                <span>{item.type} • {item.status}</span>
                            </div>
                        </Link>
                    ))
                ) : (
                    <div className="dl-search-dropdown-msg">Tidak ada hasil</div>
                )}
            </div>
        );
    };

    return (
        <>
            {desktopSlot && createPortal(<DropdownContent />, desktopSlot)}
            {mobileSlot && createPortal(<DropdownContent />, mobileSlot)}
        </>
    );
}