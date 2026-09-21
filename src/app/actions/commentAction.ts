"use server";

export async function submitComment(formData: {
  name: string;
  comment: string;
  slug: string;
  reply_to_comment_id: number | null;
  cf_turnstile_response: string;
}) {
  try {
    const backendUrl = process.env.LARAVEL_API_URL || "http://127.0.0.1:8000/api";

    const res = await fetch(`${backendUrl}/comments`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "x-api-key": process.env.BACKEND_API_KEY || "",
      },
      body: JSON.stringify(formData),
    });

    const data = await res.json();

    if (!res.ok) {
      return { success: false, message: data.message || "Gagal mengirim komentar." };
    }

    return { success: true, data };
  } catch (error) {
    console.error("Server Action Error:", error);
    return { success: false, message: "Terjadi kesalahan pada server." };
  }
}