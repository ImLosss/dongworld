"use client";

import GlobalError from "@/app/global-error";

export default function TestErrorPage() {
  return (
    <GlobalError 
      // Gunakan 'as any' sementara untuk mem-bypass tipe Error bawaan Next.js saat pengujian
      error={new Error("Ini hanya tes error") as any} 
      reset={() => alert("Fungsi reset dipanggil!")} 
    />
  );
}