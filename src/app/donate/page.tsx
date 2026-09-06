import TopDonation from "@/components/home/topDonation";
import DonateForm from "./DonateForm";

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