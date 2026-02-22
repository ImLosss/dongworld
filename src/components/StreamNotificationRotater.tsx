"use client";

import type { ReactNode } from "react";
import { useEffect, useState } from "react";

type Props = {
  messages: ReactNode[];
  intervalMs?: number;
};

export default function StreamNotificationRotator({
  messages,
  intervalMs = 30_000,
}: Props) {
  const [index, setIndex] = useState(0);

  useEffect(() => {
    if (!messages?.length) return;

    const id = window.setInterval(() => {
      setIndex((prev) => (prev + 1) % messages.length);
    }, intervalMs);

    return () => window.clearInterval(id);
  }, [messages, intervalMs]);

  if (!messages?.length) return null;

  return (
    <div className="dl-stream-notification">
      <div className="dl-notification-content">
        <i className="fas fa-exclamation-circle" />
        <span>{messages[index]}</span>
      </div>
    </div>
  );
}