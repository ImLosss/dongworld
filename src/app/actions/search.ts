"use server";

export async function fetchLiveSearch(query: string) {
    if (!query) return [];

    try {
        const response = await fetch(`${process.env.BASE_URL_BACKEND}api/series?search=${encodeURIComponent(query)}&limit=5`, {
            headers: {
                'X-API-KEY': process.env.APIKEY_BACKEND as string,
            },
            cache: 'no-store'
        });
        const data = await response.json();
        
        // Mengembalikan array series
        return data?.data?.data || [];
    } catch (error) {
        console.error("Live search error:", error);
        return [];
    }
}