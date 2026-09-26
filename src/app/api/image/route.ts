import { NextRequest } from "next/server";

const BACKEND = process.env.BASE_URL_IMAGE;

export async function GET(req: NextRequest) {
  const path = req.nextUrl.searchParams.get("path");

  if (!path || !BACKEND) {
    return new Response("Missing path", { status: 400 });
  }

  try {
    const res = await fetch(`${BACKEND}${path}`, {
      signal: AbortSignal.timeout(10_000),
    });

    if (!res.ok) {
      console.error(`Failed to fetch image from backend: ${path} | ${res.status}`);
      return new Response("Image not found", { status: 404 });
    }

    return new Response(res.body, {
      headers: {
        "Content-Type": res.headers.get("Content-Type") || "image/jpeg",
        "Cache-Control": "public, max-age=31536000, immutable",
      },
    });
  } catch {
    // Backend unreachable / timeout -> jangan 500, cukup 404
    return new Response("Image unavailable", { status: 404 });
  }
}