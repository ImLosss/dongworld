import crypto from "crypto";

const SECRET = process.env.CSRF_SECRET!;

export function createCsrfToken() {
  const payload = {
    exp: Date.now() + 1000 * 60 * 60 * 24, // 24 jam
  };

  const encoded = Buffer.from(JSON.stringify(payload)).toString("base64url");

  const signature = crypto
    .createHmac("sha256", SECRET)
    .update(encoded)
    .digest("hex");

  return `${encoded}.${signature}`;
}

export function verifyCsrfToken(token: string) {
  try {
    const [encoded, signature] = token.split(".");

    if (!encoded || !signature) return false;

    const expected = crypto
      .createHmac("sha256", SECRET)
      .update(encoded)
      .digest("hex");

    // Gunakan timingSafeEqual agar perbandingan tidak rentan timing attack
    const valid = crypto.timingSafeEqual(
      Buffer.from(signature),
      Buffer.from(expected)
    );

    if (!valid) return false;

    const payload = JSON.parse(
      Buffer.from(encoded, "base64url").toString()
    );

    return Date.now() <= payload.exp;
  } catch {
    return false;
  }
}