"use client";
import { openSmartlink } from "@/lib/smartlink";
import Link from "next/link";

type Props = {
  href: string;
  children: React.ReactNode;
};
    
export default function SeriesList({ children, href }: Props) {
    return (
        <div className="dl-card">
            <Link href={href} style={{ display: "block", color: "inherit", textDecoration: "none" }} onClick={openSmartlink}>
                {children}
            </Link>
        </div>
    )
}