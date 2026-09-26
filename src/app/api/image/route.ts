import { NextRequest } from "next/server";

const BACKEND = process.env.BASE_URL_IMAGE!;

export async function GET(req: NextRequest) {
  const path = req.nextUrl.searchParams.get("path");

  if (!path) {
    return new Response("Missing path", { status: 400 });
  }

  const res = await fetch(`${BACKEND}${path}`);

  console.log(`Fetching image from: ${BACKEND}${path}, Status: ${res.status}`);

  if (!res.ok) {
    return new Response("Image not found", { status: 404 });
  }

  return new Response(res.body, {
    headers: {
      "Content-Type": res.headers.get("Content-Type") || "image/jpeg",
      "Cache-Control": "public, max-age=31536000, immutable",
    },
  });
}