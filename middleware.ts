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
      `[REQUEST] ${waktu} WITA | ` +
      `${request.method} ${pathname} | ` +
      `RSC=${request.headers.get("rsc") ?? "-"} | ` +
      `Sec-Purpose=${request.headers.get("sec-purpose") ?? "-"} | ` +
      `Sec-Speculation-Tags=${request.headers.get("sec-speculation-tags") ?? "-"} | ` +
      `Next-Router-Prefetch=${request.headers.get("next-router-prefetch") ?? "-"} | ` +
      `Accept=${request.headers.get("accept") ?? "-"} | ` +
      `Referer=${request.headers.get("referer") ?? "-"} | ` +
      `User-Agent=${request.headers.get("user-agent") ?? "-"}`
    );
  }

  return NextResponse.next();
}