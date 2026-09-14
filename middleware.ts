import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(request: NextRequest) {
    const nextUrl = request.headers.get("next-url");
    const pathname = request.nextUrl.pathname;

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

    console.error(
        `[${request.method}] ${waktu} WITA | ` +
        `${pathname}`
    );

    return NextResponse.next();
}