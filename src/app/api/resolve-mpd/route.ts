import { NextRequest } from "next/server";
import puppeteer from "puppeteer";

export const runtime = "nodejs";

type ResolveCandidate = {
    url: string;
    server?: string;
};

type ResolveBody = {
    candidates?: ResolveCandidate[];
};

const PLAY_SELECTORS = [
    "#embedVideoC > div.vid_play",
    ".vid_play",
    ".vjs-big-play-button",
    "button[aria-label*='Play']",
    "button[title*='Play']",
];

const waitForMpd = async (page: Awaited<ReturnType<typeof puppeteer.launch>> extends infer T ? T extends { newPage: () => Promise<infer P> } ? P : never : never, timeoutMs = 25000) => {
    return await new Promise<string | null>((resolve) => {
        let finished = false;

        const cleanup = () => {
            if (finished) {
                return;
            }

            finished = true;
            page.off("response", onResponse);
            clearTimeout(timer);
        };

        const onResponse = (response: { url: () => string }) => {
            const url = response.url();

            if (url.includes(".mpd")) {
                cleanup();
                resolve(url);
            }
        };

        const timer = setTimeout(() => {
            cleanup();
            resolve(null);
        }, timeoutMs);

        page.on("response", onResponse);
    });
};

async function resolveCandidate(url: string) {
    const browser = await puppeteer.launch({
        headless: "new",
        args: ["--no-sandbox", "--disable-setuid-sandbox"],
    });

    try {
        const page = await browser.newPage();
        await page.setViewport({ width: 1280, height: 720 });

        const mpdPromise = waitForMpd(page, 25000);

        await page.goto(url, {
            waitUntil: "networkidle2",
            timeout: 60000,
        });

        for (const selector of PLAY_SELECTORS) {
            const element = await page.$(selector);

            if (element) {
                await element.click();
                break;
            }
        }

        if ((await page.$(PLAY_SELECTORS[0])) === null) {
            await page.mouse.click(640, 360);
        }

        return await mpdPromise;
    } finally {
        await browser.close();
    }
}

export async function POST(request: NextRequest) {
    const body = (await request.json().catch(() => ({}))) as ResolveBody;
    const candidates = (body.candidates || []).filter((candidate) => Boolean(candidate?.url));

    for (const candidate of candidates) {
        const mpdUrl = await resolveCandidate(candidate.url);

        if (mpdUrl) {
            return Response.json({
                mpdUrl,
                source: candidate.server || null,
            });
        }
    }

    return Response.json(
        {
            error: "MPD tidak ditemukan dari kandidat VKRU/OKRU.",
        },
        { status: 404 }
    );
}