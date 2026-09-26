/**
 * Shared SEO helpers & site-wide constants.
 */

export const SITE_URL = (
  process.env.NEXT_PUBLIC_SITE_URL || "https://dongworld.top"
).replace(/\/$/, "");

export const SITE_NAME = "DongWorld";

export const SITE_DESCRIPTION =
  "Nonton donghua (anime China) subtitle Indonesia dengan kualitas HD. Streaming donghua terbaru, lengkap, dan gratis di DongWorld.";

export const SITE_KEYWORDS = [
  "donghua",
  "donghua subtitle indonesia",
  "streaming donghua",
  "nonton donghua",
  "anime china",
  "donghua terbaru",
  "donghua sub indo",
  "DongWorld",
];

/** Absolute URL for a path relative to the site root. */
export function absoluteUrl(path = "/"): string {
  if (/^https?:\/\//i.test(path)) return path;
  return `${SITE_URL}${path.startsWith("/") ? path : `/${path}`}`;
}

/** Build an absolute URL for the internal image proxy. */
export function imageProxyUrl(thumbnail?: string | null): string {
  if (!thumbnail) return absoluteUrl("/favicon.png");
  return absoluteUrl(`/api/image?path=${encodeURIComponent(thumbnail)}`);
}

/** Trim text to a clean meta description length. */
export function truncate(text: string | null | undefined, max = 160): string {
  if (!text) return SITE_DESCRIPTION;
  const clean = text.replace(/\s+/g, " ").trim();
  if (clean.length <= max) return clean;
  return `${clean.slice(0, max - 1).trimEnd()}…`;
}

type JsonLd = Record<string, unknown>;

/** Organization / WebSite schema for the homepage. */
export function websiteJsonLd(): JsonLd {
  return {
    "@context": "https://schema.org",
    "@graph": [
      {
        "@type": "WebSite",
        "@id": `${SITE_URL}/#website`,
        url: `${SITE_URL}/`,
        name: SITE_NAME,
        description: SITE_DESCRIPTION,
        inLanguage: "id-ID",
        potentialAction: {
          "@type": "SearchAction",
          target: {
            "@type": "EntryPoint",
            urlTemplate: `${SITE_URL}/series?search={search_term_string}`,
          },
          "query-input": "required name=search_term_string",
        },
      },
      {
        "@type": "Organization",
        "@id": `${SITE_URL}/#organization`,
        name: SITE_NAME,
        url: `${SITE_URL}/`,
        logo: {
          "@type": "ImageObject",
          url: absoluteUrl("/favicon.png"),
        },
      },
    ],
  };
}

/** TVSeries schema for a series detail page. */
export function seriesJsonLd(series: {
  name: string;
  slug: string;
  synopsis?: string | null;
  thumbnail?: string | null;
  rating?: string | number | null;
  genres_string?: string | null;
  release_date?: string | null;
  episodes_max_episode_number?: number | null;
  total_episodes?: number | null;
}): JsonLd {
  const genres = series.genres_string
    ? series.genres_string.split(",").map((g) => g.trim()).filter(Boolean)
    : undefined;

  return {
    "@context": "https://schema.org",
    "@type": "TVSeries",
    name: series.name,
    url: absoluteUrl(`/series/${series.slug}`),
    description: truncate(series.synopsis, 300),
    image: imageProxyUrl(series.thumbnail),
    inLanguage: "id-ID",
    ...(genres ? { genre: genres } : {}),
    ...(series.release_date ? { datePublished: series.release_date } : {}),
    ...(series.rating
      ? {
          aggregateRating: {
            "@type": "AggregateRating",
            ratingValue: String(series.rating),
            bestRating: "10",
            worstRating: "1",
            ratingCount: 1,
          },
        }
      : {}),
    ...(series.total_episodes
      ? { numberOfEpisodes: series.total_episodes }
      : series.episodes_max_episode_number
        ? { numberOfEpisodes: series.episodes_max_episode_number }
        : {}),
  };
}

/** TVEpisode schema for a watch page. */
export function episodeJsonLd(detail: {
  name?: string | null;
  slug: string;
  episode_number?: number | null;
  series: {
    name: string;
    slug: string;
    synopsis?: string | null;
    thumbnail?: string | null;
  };
}): JsonLd {
  const episodeName =
    detail.name ||
    `${detail.series.name} Episode ${detail.episode_number ?? ""}`.trim();

  return {
    "@context": "https://schema.org",
    "@type": "TVEpisode",
    name: episodeName,
    url: absoluteUrl(`/watch/${detail.slug}`),
    description: truncate(detail.series.synopsis, 300),
    image: imageProxyUrl(detail.series.thumbnail),
    inLanguage: "id-ID",
    ...(detail.episode_number ? { episodeNumber: detail.episode_number } : {}),
    partOfSeries: {
      "@type": "TVSeries",
      name: detail.series.name,
      url: absoluteUrl(`/series/${detail.series.slug}`),
    },
  };
}

/** BreadcrumbList schema. */
export function breadcrumbJsonLd(
  items: { name: string; path: string }[]
): JsonLd {
  return {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: items.map((item, index) => ({
      "@type": "ListItem",
      position: index + 1,
      name: item.name,
      item: absoluteUrl(item.path),
    })),
  };
}
