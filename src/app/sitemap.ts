import type { MetadataRoute } from "next";
import { SITE_URL } from "@/lib/seo";

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
  const data = await fetchJson(`${API_BASE}/sitemap`);
  return {
    series: data?.series || [],
    episodes: data?.episodes || [],
  };
};

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const staticRoutes: MetadataRoute.Sitemap = [
    {
      url: `${SITE_URL}/`,
      lastModified: new Date(),
      changeFrequency: "daily",
      priority: 1,
    },
    {
      url: `${SITE_URL}/series`,
      lastModified: new Date(),
      changeFrequency: "daily",
      priority: 0.9,
    },
    {
      url: `${SITE_URL}/recent-comments`,
      lastModified: new Date(),
      changeFrequency: "hourly",
      priority: 0.5,
    },
    {
      url: `${SITE_URL}/donate`,
      lastModified: new Date(),
      changeFrequency: "monthly",
      priority: 0.3,
    },
  ];

  if (!API_BASE || !API_KEY) {
    return staticRoutes;
  }

  try {
    const { series, episodes } = await getSitemapData();

    return [
      ...staticRoutes,
      ...series.map((item) => ({
        url: `${SITE_URL}/series/${item.slug}`,
        lastModified: item.updated_at ? new Date(item.updated_at) : new Date(),
        changeFrequency: "weekly" as const,
        priority: 0.8,
      })),
      ...episodes.map((item) => ({
        url: `${SITE_URL}/watch/${item.slug}`,
        lastModified: item.updated_at ? new Date(item.updated_at) : new Date(),
        changeFrequency: "weekly" as const,
        priority: 0.7,
      })),
    ];
  } catch {
    // If the backend is unreachable, still return the static routes.
    return staticRoutes;
  }
}
