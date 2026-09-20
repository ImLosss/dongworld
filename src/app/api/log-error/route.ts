import { NextRequest, NextResponse } from "next/server";

export async function POST(request: NextRequest) {
    try {
        const body = await request.json();
        
        // Ekstraksi IP pengunjung
        const ip =
            request.headers.get("cf-connecting-ip") ??
            request.headers.get("x-real-ip") ??
            request.headers.get("x-forwarded-for")?.split(",")[0].trim() ??
            "unknown";

        const time = new Date().toLocaleString("id-ID", { timeZone: "Asia/Makassar" });
        
        // Tambahkan IP ke dalam cetakan log terminal
        console.error(`\n[${time} WITA] ❌ CLIENT-SIDE ERROR DETECTED:`);
        console.error(`IP: ${ip}`);
        console.error(`URL: ${body.url}`);
        console.error(`Message: ${body.message}`);
        console.error(`Stack Trace:\n${body.stack}\n`);

        return NextResponse.json({ success: true });
    } catch (e) {
        return NextResponse.json({ success: false }, { status: 500 });
    }
}