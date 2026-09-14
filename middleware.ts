import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(request: NextRequest) {
  const accept = request.headers.get("accept") ?? "";

  if (accept.includes("text/html")) {
    const waktu = new Date().toLocaleString("id-ID", {
      timeZone: "Asia/Makassar",
      hour12: false,
    });

    console.error(
      `[PAGE] ${waktu} WITA | ${request.method} ${request.nextUrl.pathname} | UA=${request.headers.get("user-agent")}`
    );
  }

  return NextResponse.next();
}