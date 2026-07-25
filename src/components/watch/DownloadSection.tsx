"use client";

import { openSmartlink } from "@/lib/smartlink";

interface DownloadItem {
  link: string;
  quality: string;
  server: string;
}

interface Props {
  downloads: DownloadItem[];
  episodeNumber: number;
}

export default function DownloadSection({
  downloads,
  episodeNumber,
}: Props) {
  if (!downloads.length) return null;

  return (
    <section className="dl-download-section">
      <div className="dl-download-header">
        <h2>Download</h2>
        <span className="dl-download-meta">
          Episode {episodeNumber}
        </span>
      </div>

      <div className="dl-download-list">
        {downloads.map((download, idx) => (
          <a
            key={idx}
            href={download.link}
            target="_blank"
            rel="noopener noreferrer"
            className="dl-download-item"
            onClick={openSmartlink}
          >
            <i className="fas fa-download"></i>
            <span>
              {download.quality} | {download.server}
            </span>
          </a>
        ))}
      </div>
    </section>
  );
}