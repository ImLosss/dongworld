type Entry = {
  timeout: NodeJS.Timeout;
  expiresAt: number;
};

const requests = new Map<string, Entry>();

const WAIT_TIME = 30_000; // 30 detik

export function canComment(ip: string): { status: boolean; message: string } {
  const now = Date.now();

  const entry = requests.get(ip);

  if (entry) {
    const remaining = Math.ceil((entry.expiresAt - now) / 1000);

    return {
      status: false,
      message: `Tunggu ${remaining} detik sebelum mengirim komentar lagi.`,
    };
  }

  const expiresAt = now + WAIT_TIME;

  const timeout = setTimeout(() => {
    requests.delete(ip);
  }, WAIT_TIME);

  requests.set(ip, {
    timeout,
    expiresAt,
  });

  return {
    status: true,
    message: "Komentar berhasil dikirim",
  };
}