import { headers } from "next/headers";

/**
 * Resolve the visitor's country code from CDN/proxy headers.
 *
 * - Cloudflare sets `cf-ipcountry`
 * - Vercel sets `x-vercel-ip-country`
 * - Some proxies set `x-country-code` / `x-geo-country`
 *
 * Returns an uppercase ISO 3166-1 alpha-2 code (e.g. "MY", "ID"), or `null`
 * when the country cannot be determined.
 */
export async function getCountryCode(): Promise<string | null> {
    const h = await headers();

    const raw =
        h.get("cf-ipcountry") ||
        h.get("x-vercel-ip-country") ||
        h.get("x-country-code") ||
        h.get("x-geo-country");

    if (!raw) return null;

    const code = raw.trim().toUpperCase();

    // Cloudflare uses "XX" for unknown and "T1" for Tor exit nodes.
    if (!code || code === "XX" || code === "T1") return null;

    return code;
}
