import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  images: {
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
        protocol: "http", // Gunakan http untuk IP lokal, ganti ke https jika perlu
        hostname: "10.69.217.166",
      },
    ],
  },
};

export default nextConfig;