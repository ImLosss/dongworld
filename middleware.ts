import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export function middleware(request: NextRequest) {
  const waktu = new Date().toLocaleString("id-ID", {
    timeZone: "Asia/Makassar",
    hour12: false,
  });

  console.error(
    `[REQUEST] ${waktu} WITA | ${request.method} ${request.nextUrl.pathname}`
  );

  return NextResponse.next();
}