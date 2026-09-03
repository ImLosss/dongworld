import type { Metadata } from "next";
import { Roboto } from "next/font/google";
import "./globals.css";
import "@/styles/style.css";
import "@/styles/responsive.css";
// import "@/styles/series.css";
import Footer from "@/components/footer";
import Script from "next/script";
import Navbar from "@/components/navbar";
import Sidebar from "@/components/sidebar";
import { Suspense } from "react";
import SmartlinkAd from "@/components/Smartlink Ads";
import NextTopLoader from "nextjs-toploader";

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
  title: "DongWorld - Streaming Donghua Berkualitas",
  description: "Nonton donghua favoritmu dengan kualitas HD dan subtitle Indonesia",
  icons: {
    icon: "/favicon.ico",
    shortcut: "/favicon.ico",
    apple: "/favicon.png",
  },
  openGraph: {
    title: "DongWorld - Streaming Donghua Berkualitas",
    description: "Nonton donghua favoritmu dengan kualitas HD dan subtitle Indonesia",
    type: "website",
    url: "https://dongworld.top",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <head>
        <meta charSet="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="keywords" content="donghua, anime china, streaming donghua, watch donghua online" />
        <meta name="author" content="DongWorld Team" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossOrigin="anonymous" />
      </head>
      <body className={`${uiFont.variable}`}>
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
            <Script src="/js/search.js" strategy="afterInteractive" />
            <script
              id="aclib"
              type="text/javascript"
              src="//acscdn.com/script/aclib.js"
            />

            <script
              type="text/javascript"
              dangerouslySetInnerHTML={{
                __html: `
                  aclib.runPop({
                    zoneId: '12099398',
                  });
                `,
              }}
            />
          </main>
        </div>
      </body>
    </html>
  );
}
