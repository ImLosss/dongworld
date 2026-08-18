import { NextRequest, NextResponse } from "next/server";
import { canComment } from "@/lib/commentRateLimit";
import { verifyCsrfToken } from "@/lib/csrfToken";

const ALLOWED_ORIGINS = [
  "https://dongworld.top",
  "https://www.dongworld.top",
];

export async function POST(request: NextRequest) {
  const body = await request.json();
  const origin = request.headers.get("origin");
  const ip =
    request.headers.get("cf-connecting-ip") ??
    request.headers.get("x-real-ip") ??
    request.headers.get("x-forwarded-for")?.split(",")[0].trim() ??
    "unknown";

  const time = new Date().toLocaleString("id-ID", {
    timeZone: "Asia/Makassar",
  });

  const csrfToken = request.headers.get("x-csrf-token");
  if (!csrfToken || !verifyCsrfToken(csrfToken)) {
    console.log(`[${time} WITA] Invalid CSRF token from IP: ${ip}, Origin: ${origin}, Token: ${csrfToken}`);
    return NextResponse.json(
      { message: "Forbidden" },
      { status: 403 }
    );
  }

  console.log(`[${time} WITA] Incoming request from IP: ${ip}, Origin: ${origin}`);

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
    turnstile: String(body.cf_turnstile_response ?? "").trim(),
  };

  if (!payload.name || !payload.comment || !payload.slug) {
    return NextResponse.json(
      { message: "Forbidden" },
      { status: 403 }
    );
  }

  // =================================================================
  // VERIFIKASI CLOUDFLARE TURNSTILE
  // =================================================================
  const cfFormData = new FormData();
  cfFormData.append('secret', process.env.TURNSTILE_SECRET_KEY as string); 
  cfFormData.append('response', payload.turnstile);
  cfFormData.append('remoteip', ip); 

  try {
    const cfVerify = await fetch('https://challenges.cloudflare.com/turnstile/v0/siteverify', {
      method: 'POST',
      body: cfFormData,
    });

    const cfResponse = await cfVerify.json();

    console.log(`[${time} WITA] Turnstile verification response for IP: ${ip}:`, cfResponse);

    if (!cfResponse.success) {
      console.log(`[${time} WITA] Turnstile failed for IP: ${ip} | Error:`, cfResponse['error-codes']);
      return NextResponse.json(
        { message: "Forbidden" },
        { status: 403 }
      );
    }
  } catch (error) {
    console.error(`[${time} WITA] Error contacting Cloudflare:`, error);
    return NextResponse.json(
      { message: "Terjadi kesalahan pada sistem keamanan." },
      { status: 500 }
    );
  }

  const rateLimit = canComment(ip);

  if (!rateLimit.status) {
    return NextResponse.json(
      { message: rateLimit.message },
      { status: 429 }
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