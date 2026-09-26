import TopDonation from "@/components/home/topDonation";
import DonateForm from "./DonateForm";
import type { Metadata } from "next";
import { SITE_NAME } from "@/lib/seo";

export const metadata: Metadata = {
    title: "Donasi",
    description: `Dukung ${SITE_NAME} agar tetap online dan terus menyediakan streaming donghua subtitle Indonesia gratis.`,
    alternates: { canonical: "/donate" },
};

export default function DonatePage() {
    return (
        <div className="row" style={{ marginTop: '70px' }}>
            {/* Bagian Kiri: Form Donasi */}
            <div className="col-12 col-lg-8">
                <DonateForm />
            </div>
            
            {/* Bagian Kanan: Top Donatur */}
            <div className="col-12 col-lg-4">
                <TopDonation />
            </div>
        </div>
    );
}