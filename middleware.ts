import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(request: NextRequest) {
  const pathname = request.nextUrl.pathname;

  if (
    !pathname.startsWith("/_next/") &&
    !pathname.startsWith("/favicon")
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