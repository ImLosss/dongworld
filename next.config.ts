import { withSentryConfig } from "@sentry/nextjs/config";
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  images: {
    localPatterns: [
      {
        pathname: "/api/image",
        // `search` omitted => any query string (e.g. ?path=...) is allowed
      },
    ],
    remotePatterns: [
      {
        protocol: "https",
        hostname: "anichin.club",
      },
      {
        protocol: "http", // Gunakan http untuk localhost
        hostname: "127.0.0.1",
      },
      {
        protocol: "https",
        hostname: "dongworld-admin.websiteku.space",
      },
      {
        protocol: "https",
        hostname: "dongworld-admin.websiteku.site",
      },
      {
        protocol: "https",
        hostname: "api.qrserver.com",
      },
      {
        protocol: "http", // Gunakan http untuk IP lokal, ganti ke https jika perlu
        hostname: "10.69.217.166",
      },
    ],
  },
};

export default withSentryConfig(nextConfig, {
  // For all available options, see:
  // https://www.npmjs.com/package/@sentry/webpack-plugin#options

  org: "pahri",

  project: "dongworld",

  // Only print logs for uploading source maps in CI
  silent: false,

  // For all available options, see:
  // https://docs.sentry.io/platforms/javascript/guides/nextjs/manual-setup/

  // Upload a larger set of source maps for prettier stack traces (increases build time)
  widenClientFileUpload: true,

  // Uncomment to route browser requests to Sentry through a Next.js rewrite to circumvent ad-blockers.
  // This can increase your server load as well as your hosting bill.
  // Note: Check that the configured route will not match with your Next.js middleware, otherwise reporting of client-
  // side errors will fail.
  // tunnelRoute: "/monitoring",

  webpack: {
    // Enables automatic instrumentation of Vercel Cron Monitors. (Does not yet work with App Router route handlers.)
    // See the following for more information:
    // https://docs.sentry.io/product/crons/
    // https://vercel.com/docs/cron-jobs
    automaticVercelMonitors: true,

    // Tree-shaking options for reducing bundle size
    treeshake: {
      // Automatically tree-shake Sentry logger statements to reduce bundle size
      removeDebugLogging: true,
    },
  },
});
