import type { MetadataRoute } from "next";

const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL || "http://localhost:3000";
const API_BASE = process.env.BASE_URL_BACKEND || "";
const API_KEY = process.env.APIKEY_BACKEND || "";

type SeriesItem = {
  slug: string;
  updated_at?: string;
};

type EpisodeItem = {
  slug: string;
  updated_at?: string;
};

const fetchJson = async (url: string) => {
  const res = await fetch(url, {
    headers: {
      Accept: "application/json",
      "X-API-KEY": API_KEY,
    },
    next: { revalidate: 3600 },
  });

  if (!res.ok) {
    throw new Error(`Failed to fetch ${url}`);
  }

  return res.json();
};

const getSitemapData = async (): Promise<{ series: SeriesItem[]; episodes: EpisodeItem[] }> => {
  const data = await fetchJson(`${API_BASE}api/sitemap`);
  return {
    series: data?.series || [],
    episodes: data?.episodes || [],
  };
};

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  if (!API_BASE || !API_KEY) {
    return [
      { url: `${SITE_URL}/`, lastModified: new Date() },
      { url: `${SITE_URL}/series`, lastModified: new Date() },
    ];
  }

  const { series, episodes } = await getSitemapData();

  return [
    { url: `${SITE_URL}/`, lastModified: new Date() },
    { url: `${SITE_URL}/series`, lastModified: new Date() },
    ...series.map((item) => ({
      url: `${SITE_URL}/series/${item.slug}`,
      lastModified: item.updated_at ? new Date(item.updated_at) : new Date(),
    })),
    ...episodes.map((item) => ({
      url: `${SITE_URL}/watch/${item.slug}`,
      lastModified: item.updated_at ? new Date(item.updated_at) : new Date(),
    })),
  ];
}
