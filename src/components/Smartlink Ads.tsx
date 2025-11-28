"use client";
import { useEffect } from "react";

export default function SmartlinkAd() {
    useEffect(() => {
        const url = "https://www.effectivegatecpm.com/r78gx5zh?key=ddf94cbeb9a2045ab67820c3959ee7af";
        const delay = 30 * 1000; // 30 detik

        function isCooldown() {
            const lastClick = localStorage.getItem("smartlink_last_click");
            if (!lastClick) return false;
            return (Date.now() - parseInt(lastClick)) < delay;
        }

        function handleClick() {
            if (isCooldown()) return; // masih cooldown → tidak membuka link

            // buka smartlink
            window.open(url, "_blank");

            // simpan waktu terakhir klik
            localStorage.setItem("smartlink_last_click", Date.now().toString());
        }

        document.addEventListener("click", handleClick);

        // Cleanup
        return () => {
            document.removeEventListener("click", handleClick);
        };
    }, []);

    return null; // Component ini tidak render apapun
}