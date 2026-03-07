"use client";

import { useState } from "react";

type Props = {
  text?: string | null;
  maxChars?: number;
};

export default function SynopsisText({ text, maxChars = 220 }: Props) {
  const [expanded, setExpanded] = useState(false);

  const safeText = text?.trim() || "Sinopsis tidak tersedia.";
  const isLong = safeText.length > maxChars;
  const displayText =
    !isLong || expanded ? safeText : safeText.slice(0, maxChars).trimEnd() + "...";

  return (
    <div>
      <p>{displayText}{isLong && (
        <button type="button" onClick={() => setExpanded((v) => !v)} style={{ color: "white"}}>
          {expanded ? "Sembunyikan" : "Lihat selengkapnya"}
        </button>
      )}</p>
    </div>
  );
}