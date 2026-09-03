const SMARTLINK_URL = "https://www.profitableratecpmnetwork.com/xx3z06hf1?key=bd214403dcbfedf7a86ad57ef67b0d9f";

const MINUTE = 25 * 1000;
const HOUR = 60 * 60 * 1000;
const MAX_PER_HOUR = 3;

export function openSmartlink() {
    return;
    console.log("openSmartlink called");
    if (typeof window === "undefined") return;

    if (!canOpenSmartlink()) return;

    window.open(SMARTLINK_URL, "_blank", "noopener,noreferrer");

    const now = Date.now();

    const raw = localStorage.getItem("smartlink_clicks");
    const clicks: number[] = raw ? JSON.parse(raw) : [];
    const recent = clicks.filter((t) => now - t < HOUR);

    recent.push(now);

    localStorage.setItem("smartlink_clicks", JSON.stringify(recent));
    localStorage.setItem("smartlink_last_click", now.toString());
}

function canOpenSmartlink() {
    const now = Date.now();

    const raw = localStorage.getItem("smartlink_clicks");
    const clicks: number[] = raw ? JSON.parse(raw) : [];
    const recent = clicks.filter((t) => now - t < HOUR);

    const lastClick = Number(
        localStorage.getItem("smartlink_last_click") ?? 0
    );

    return !(
        now - lastClick < MINUTE ||
        recent.length >= MAX_PER_HOUR
    );
}