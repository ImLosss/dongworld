import { NextRequest, NextResponse } from "next/server";

export async function POST(request: NextRequest) {
    try {
        const body = await request.json();
        const time = new Date().toLocaleString("id-ID", { timeZone: "Asia/Makassar" });
        
        // Error ini akan tercetak di terminal server Next.js atau file log PM2 Anda
        console.error(`\n[${time} WITA] ❌ CLIENT-SIDE ERROR DETECTED:`);
        console.error(`URL: ${body.url}`);
        console.error(`Message: ${body.message}`);
        console.error(`Stack Trace:\n${body.stack}\n`);

        return NextResponse.json({ success: true });
    } catch (e) {
        return NextResponse.json({ success: false }, { status: 500 });
    }
}