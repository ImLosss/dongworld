import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(request: NextRequest) {
    const nextUrl = request.headers.get("next-url");
    const pathname = request.nextUrl.pathname;

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

    // console.error(
    //     `[${request.method}] ${waktu} WITA | IP: ${clientIp} | ${pathname}`
    // );

    return NextResponse.next();
}