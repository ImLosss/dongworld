import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(request: NextRequest) {
  // Abaikan prefetch
  if (request.headers.get("sec-purpose") === "prefetch") {
    return NextResponse.next();
  }

  const pathname = request.nextUrl.pathname;

  if (
    !pathname.startsWith("/_next/") &&
    !pathname.startsWith("/favicon") &&
    !pathname.startsWith("/api/") 
  ) {
    const waktu = new Date().toLocaleString("id-ID", {
      timeZone: "Asia/Makassar",
      hour12: false,
    });

    console.error(
      `[PAGE] ${waktu} WITA | ${request.method} ${pathname}`
    );
  }

  return NextResponse.next();
}