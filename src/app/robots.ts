import type { MetadataRoute } from "next";
import { SITE_URL } from "@/lib/seo";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: [
      {
        userAgent: "*",
        // Allow the image proxy so social/rich-result crawlers can fetch OG images,
        // but block the rest of the API surface.
        allow: ["/", "/api/image"],
        disallow: ["/api/", "/sentry-example-page"],
      },
    ],
    sitemap: `${SITE_URL}/sitemap.xml`,
    host: SITE_URL,
  };
}
