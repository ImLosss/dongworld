import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

/**
 * Canonical host (non-www). Derived from NEXT_PUBLIC_SITE_URL so the redirect
 * target always matches the URLs emitted in metadata, sitemap, and robots.
 */
const CANONICAL_HOST = (() => {
    try {
        return new URL(process.env.NEXT_PUBLIC_SITE_URL || "https://dongworld.top").host;
    } catch {
        return "dongworld.top";
    }
})();

export function middleware(request: NextRequest) {
    const nextUrl = request.headers.get("next-url");
    const pathname = request.nextUrl.pathname;

    // 301 redirect www -> non-www so both hosts don't compete as duplicate content.
    const host = (request.headers.get("host") || request.nextUrl.host).toLowerCase();
    if (host === `www.${CANONICAL_HOST}`) {
        const url = request.nextUrl.clone();
        url.hostname = CANONICAL_HOST;
        url.port = "";
        url.protocol = "https:";
        return NextResponse.redirect(url, 301);
    }

    const clientIp = 
        request.headers.get("cf-connecting-ip") || 
        request.headers.get("x-forwarded-for")?.split(',')[0].trim() || 
        "Unknown IP";

    const waktu = new Date().toLocaleString("id-ID", {
        timeZone: "Asia/Makassar",
        hour12: false,
    });

    if (
        pathname.startsWith("/api/") ||
        pathname.startsWith("/_next/") ||
        pathname.startsWith("/js/") ||
        pathname.startsWith("/favicon") ||
        pathname.startsWith("/phpinfo") ||
        pathname.endsWith(".php") ||
        nextUrl !== null 
    ) {
        return NextResponse.next();
    }

    console.log(
        `[${request.method}] ${waktu} WITA | IP: ${clientIp} | ${pathname}`
    );

    return NextResponse.next();
}