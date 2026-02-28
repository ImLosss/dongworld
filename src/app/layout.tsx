import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
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

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
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
        {/* <Script src="//pl28153160.effectivegatecpm.com/9a/6b/7f/9a6b7f078134c58d46071005022176d6.js" strategy="afterInteractive" /> */}
      </head>
      <body className={`${geistSans.variable} ${geistMono.variable}`}>
        <SmartlinkAd />    
        <div id="dl-root">
          <main className="dl-main-content">
            <Suspense fallback={null}>
              <Navbar />
            </Suspense>
            <Sidebar />
            {children}
            <Footer />
            <Script src="/js/search.js" strategy="afterInteractive" />
          </main>
        </div>
        <Script src="https://pl28815178.effectivegatecpm.com/97/43/4b/97434b95c0a8fd7a37a87cae35f85380.js" strategy="afterInteractive" />
      </body>
    </html>
  );
}
