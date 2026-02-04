"use client";

import { useRouter, useSearchParams } from "next/navigation";

type DataFilters = {
    genres: { id: number; name: string }[];
    type: string[];
    status: string[];
};

export default function SeriesFilters({ dataFilters }: { dataFilters: DataFilters }) {
    const router = useRouter();
    const searchParams = useSearchParams();

    const updateParam = (key: string, value: string) => {
        const params = new URLSearchParams(searchParams.toString());
        params.delete("page");
        if (key === "genre") {
            const current = params.get("genre");
            const list = current ? current.split(",").filter(Boolean) : [];

            if (value) {
                if (!list.includes(value)) list.push(value);
                params.set("genre", list.join(","));
            } else {
                params.delete("genre");
            }
        } else {
            if (value) params.set(key, value);
            else params.delete(key);
        }
        router.push(`/series?${params.toString()}`);
    };

    const genreValues = searchParams.get("genre")?.split(",") || [];

    const genreValue = genreValues[genreValues.length - 1] ?? "";
    const typeValue = searchParams.get("type") ?? "";
    const statusValue = searchParams.get("status") ?? "";
    const searchValue = searchParams.get("search") ?? "";

    const activeFilters = [
        { key: "search", label: `Search: ${searchValue}`, value: searchValue },
        { key: "genre", label: `Genre: ${genreValues.join(", ")}`, value: genreValues.length ? genreValues.join(",") : "" },
        { key: "type", label: `Type: ${typeValue}`, value: typeValue },
        { key: "status", label: `Status: ${statusValue}`, value: statusValue },
    ].filter(f => f.value);

    return (
        <div className="dl-filter-options" style={{ marginBottom: '20px', flexWrap: 'wrap' }}>
            <select value={genreValue} onChange={(e) => updateParam("genre", e.target.value)}>
                <option value={""}>Semua Genre</option>
                {dataFilters.genres.map((genre) => (
                    <option key={genre.id} value={genre.name.toLowerCase()}>
                        {genre.name}
                    </option>
                ))}
            </select>
            <select value={typeValue} onChange={(e) => updateParam("type", e.target.value)}>
                <option value={""}>Semua Tipe</option>
                {dataFilters.type.map((type) => (
                    <option key={type} value={type.toLowerCase()}>
                        {type}
                    </option>
                ))}
            </select>
            <select value={statusValue} onChange={(e) => updateParam("status", e.target.value)}>
                <option value={""}>Semua Status</option>
                {dataFilters.status.map((status) => (
                    <option key={status} value={status.toLowerCase()}>
                        {status}
                    </option>
                ))}
            </select>

            {/* Chips filter aktif */}
            <div className="dl-filter-chips">
                {activeFilters.map((f) => (
                    <div key={f.key} style={{ display: "inline-flex", alignItems: "center", gap: "6px", padding: "6px 10px", border: "1px solid #444", borderRadius: "6px" }}>
                        <span>{f.label}</span>
                        <button
                            type="button"
                            aria-label={`Hapus ${f.key}`}
                            onClick={() => updateParam(f.key, "")}
                            style={{ background: "transparent", border: "none", color: "#fff", cursor: "pointer" }}
                        >
                            ×
                        </button>
                    </div>
                ))}
            </div>
        </div>
    )
}