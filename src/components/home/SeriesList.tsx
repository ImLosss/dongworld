import Link from "next/link";
    
export default async function SeriesList({ children, href }: any) {
    return (
        <div className="dl-card">
            <Link href={href} style={{ display: "block", color: "inherit", textDecoration: "none" }}>
                {children}
            </Link>
        </div>
    )
}