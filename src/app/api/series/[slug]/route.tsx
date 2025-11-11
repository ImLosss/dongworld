import { NextRequest } from "next/server";

export async function GET(request: NextRequest, { params }: { params: { slug: string } }) {
  const { slug } = await params;
  const { searchParams } = new URL(request.url);
  const page = searchParams.get("page") || 1;

  const backendRes = await fetch(
    `${process.env.BASE_URL_BACKEND}api/series/${slug}?page=${page}`,
    {
      headers: { 'X-API-KEY': process.env.APIKEY_BACKEND as string }
    }
  );
  const data = await backendRes.json();
  return new Response(JSON.stringify(data), {
    status: backendRes.status,
    headers: { "Content-Type": "application/json" }
  });
}