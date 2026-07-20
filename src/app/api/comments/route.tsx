import { NextRequest, NextResponse } from "next/server";
import { canComment } from "@/lib/commentRateLimit";

const ALLOWED_ORIGINS = [
  "https://dongworld.top",
  "https://www.dongworld.top",
];

export async function POST(request: NextRequest) {
  const body = await request.json();
  const origin = request.headers.get("origin");
  const ip = request.headers.get("x-forwarded-for")?.split(",")[0] ?? "unknown";

  console.log(request.headers);
  const time = new Date().toISOString();

  console.log(`[${time}] Incoming request from IP: ${ip}, Origin: ${origin}`);

  if (!origin || !ALLOWED_ORIGINS.includes(origin)) {
    return NextResponse.json(
      { message: "Forbidden" },
      { status: 403 }
    );
  }

  const payload = {
    name: String(body.name ?? "").trim(),
    comment: String(body.comment ?? "").trim(),
    slug: String(body.slug ?? "").trim(),
  };

  if (!payload.name || !payload.comment || !payload.slug) {
    return NextResponse.json(
      { message: "Forbidden" },
      { status: 403 }
    );
  }

  if (!canComment(ip)) {
    return NextResponse.json(
      {
        message: "Silakan tunggu 1 menit sebelum mengirim komentar lagi.",
      },
      {
        status: 429,
      }
    );
  }

  const backendRes = await fetch(`${process.env.BASE_URL_BACKEND}api/comments`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "X-API-KEY": process.env.APIKEY_BACKEND as string,
    },
    body: JSON.stringify(body),
  });

  const data = await backendRes.json();

  return new Response(JSON.stringify(data), {
    status: backendRes.status,
    headers: { "Content-Type": "application/json" },
  });
}