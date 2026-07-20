type Entry = {
  timeout: NodeJS.Timeout;
};

const requests = new Map<string, Entry>();

const WAIT_TIME = 60_000; // 1 menit

export function canComment(ip: string): boolean {
  if (requests.has(ip)) {
    return false;
  }

  const timeout = setTimeout(() => {
    requests.delete(ip);
  }, WAIT_TIME);

  requests.set(ip, { timeout });

  return true;
}