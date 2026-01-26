import { NextRequest } from "next/server";

export async function POST(request: NextRequest) {
  const body = await request.json();

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