import type { Metadata } from "next";
import { Roboto } from "next/font/google";
import "./globals.css";
import "@/styles/style.css";
import "@/styles/responsive.css";
// import "@/styles/series.css";
// Self-hosted vendor CSS (avoids third-party CDN requests blocked by browser tracking prevention)
import "@fortawesome/fontawesome-free/css/all.min.css";
import "bootstrap/dist/css/bootstrap.min.css";
import Footer from "@/components/footer";
import Navbar from "@/components/navbar";
import Sidebar from "@/components/sidebar";
import { Suspense } from "react";
import NextTopLoader from "nextjs-toploader";
import {
  SITE_URL,
  SITE_NAME,
  SITE_DESCRIPTION,
  SITE_KEYWORDS,
  websiteJsonLd,
} from "@/lib/seo";

declare global {
  interface Window {
    aclib?: {
      runPop: (options: { zoneId: string }) => void;
    };
  }
}

const uiFont = Roboto({
  variable: "--font-primary",
  subsets: ["latin"],
  weight: ["400", "500", "700"],
  display: "swap",
});

export const metadata: Metadata = {
  metadataBase: new URL(SITE_URL),
  title: {
    default: `${SITE_NAME} - Streaming Donghua Subtitle Indonesia`,
    template: `%s | ${SITE_NAME}`,
  },
  description: SITE_DESCRIPTION,
  keywords: SITE_KEYWORDS,
  applicationName: SITE_NAME,
  authors: [{ name: `${SITE_NAME} Team` }],
  creator: SITE_NAME,
  publisher: SITE_NAME,
  category: "entertainment",
  alternates: {
    canonical: "/",
  },
  icons: {
    icon: "/favicon.ico",
    shortcut: "/favicon.ico",
    apple: "/favicon.png",
  },
  openGraph: {
    title: `${SITE_NAME} - Streaming Donghua Subtitle Indonesia`,
    description: SITE_DESCRIPTION,
    type: "website",
    url: SITE_URL,
    siteName: SITE_NAME,
    locale: "id_ID",
    images: [
      {
        url: "/favicon.png",
        width: 512,
        height: 512,
        alt: SITE_NAME,
      },
    ],
  },
  twitter: {
    card: "summary_large_image",
    title: `${SITE_NAME} - Streaming Donghua Subtitle Indonesia`,
    description: SITE_DESCRIPTION,
    images: ["/favicon.png"],
  },
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      "max-image-preview": "large",
      "max-snippet": -1,
      "max-video-preview": -1,
    },
  },
  formatDetection: {
    telephone: false,
    email: false,
    address: false,
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="id" translate="no">
      <head>
        <meta charSet="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="theme-color" content="#ff3d4d" />
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(websiteJsonLd()) }}
        />
      </head>
      <body className={`${uiFont.variable}`} suppressHydrationWarning>
        <NextTopLoader 
          color="#ff3d4d" /* Sesuaikan dengan var(--primary-color) Anda */
          initialPosition={0.08}
          crawlSpeed={200}
          height={4}
          crawl={true}
          showSpinner={false} /* Set true jika ingin ada ikon loading berputar di pojok */
          easing="ease"
          speed={200}
          shadow="0 0 10px #ff3d4d,0 0 5px #ff3d4d"
        />
        {/* <SmartlinkAd />     */}
        <div id="dl-root">
          <main className="dl-main-content">
            <Suspense fallback={null}>
              <Navbar />
            </Suspense>
            <Sidebar />
            {children}
            <Footer />
          </main>
        </div>
      </body>
    </html>
  );
}
