/**
 * IndexedDB helper untuk menyimpan riwayat tontonan (watch history).
 *
 * Struktur:
 * - Database : "dongworld"
 * - Store    : "history" (keyPath: "seriesSlug")
 * - Index    : "watchedAt"
 *
 * Jika IndexedDB tidak tersedia (mis. mode private / browser lama),
 * otomatis fallback ke localStorage agar fitur tetap berjalan.
 */

export type HistoryItem = {
    seriesSlug: string;
    slugEpisode: string;
    episodeNumber: number;
    title: string;
    watchedAt: string;
};

export type EpisodePage = {
    seriesSlug: string;
    page: number;
};

const DB_NAME = "dongworld";
const DB_VERSION = 2;
const STORE = "history";
const EPISODE_PAGE_STORE = "episodePages";
const INDEX_WATCHED_AT = "watchedAt";
const MAX_ITEMS = 20;
const LEGACY_KEY = "history";

let dbPromise: Promise<IDBDatabase> | null = null;

function isIndexedDbSupported(): boolean {
    return typeof window !== "undefined" && "indexedDB" in window;
}

function openDb(): Promise<IDBDatabase> {
    if (!isIndexedDbSupported()) {
        return Promise.reject(new Error("IndexedDB tidak didukung"));
    }

    if (dbPromise) return dbPromise;

    dbPromise = new Promise<IDBDatabase>((resolve, reject) => {
        const request = window.indexedDB.open(DB_NAME, DB_VERSION);

        request.onupgradeneeded = () => {
            const db = request.result;

            if (!db.objectStoreNames.contains(STORE)) {
                const store = db.createObjectStore(STORE, { keyPath: "seriesSlug" });
                store.createIndex(INDEX_WATCHED_AT, "watchedAt", { unique: false });
            }

            if (!db.objectStoreNames.contains(EPISODE_PAGE_STORE)) {
                db.createObjectStore(EPISODE_PAGE_STORE, { keyPath: "seriesSlug" });
            }
        };

        request.onsuccess = () => resolve(request.result);
        request.onerror = () => reject(request.error ?? new Error("Gagal membuka IndexedDB"));
    });

    return dbPromise;
}

function promisifyRequest<T>(request: IDBRequest<T>): Promise<T> {
    return new Promise<T>((resolve, reject) => {
        request.onsuccess = () => resolve(request.result);
        request.onerror = () => reject(request.error ?? new Error("Operasi IndexedDB gagal"));
    });
}

/* -------------------------------------------------------------------------- */
/*                              Fallback localStorage                          */
/* -------------------------------------------------------------------------- */

function readLegacy(): Record<string, Omit<HistoryItem, "seriesSlug">> {
    try {
        const raw = window.localStorage.getItem(LEGACY_KEY);
        return raw ? JSON.parse(raw) : {};
    } catch {
        return {};
    }
}

function writeLegacy(items: HistoryItem[]): void {
    try {
        const map: Record<string, Omit<HistoryItem, "seriesSlug">> = {};
        items.forEach(({ seriesSlug, ...rest }) => {
            map[seriesSlug] = rest;
        });
        window.localStorage.setItem(LEGACY_KEY, JSON.stringify(map));
    } catch (error) {
        console.warn("Gagal menulis riwayat ke localStorage:", error);
    }
}

/* -------------------------------------------------------------------------- */
/*                                  Public API                                 */
/* -------------------------------------------------------------------------- */

/**
 * Ambil semua riwayat, terbaru lebih dulu.
 */
export async function getHistory(): Promise<HistoryItem[]> {
    if (!isIndexedDbSupported()) {
        return Object.entries(readLegacy())
            .map(([seriesSlug, item]) => ({ seriesSlug, ...item }))
            .sort((a, b) => new Date(b.watchedAt).getTime() - new Date(a.watchedAt).getTime());
    }

    try {
        const db = await openDb();
        const tx = db.transaction(STORE, "readonly");
        const store = tx.objectStore(STORE);
        const items = await promisifyRequest<HistoryItem[]>(store.getAll());

        return items.sort(
            (a, b) => new Date(b.watchedAt).getTime() - new Date(a.watchedAt).getTime()
        );
    } catch (error) {
        console.warn("Gagal membaca riwayat dari IndexedDB, memakai localStorage:", error);
        return Object.entries(readLegacy())
            .map(([seriesSlug, item]) => ({ seriesSlug, ...item }))
            .sort((a, b) => new Date(b.watchedAt).getTime() - new Date(a.watchedAt).getTime());
    }
}

/**
 * Simpan / perbarui satu riwayat tontonan, lalu pangkas agar maksimal MAX_ITEMS.
 */
export async function saveHistory(item: HistoryItem): Promise<void> {
    if (!isIndexedDbSupported()) {
        const items = await getHistory();
        const merged = [item, ...items.filter((i) => i.seriesSlug !== item.seriesSlug)].slice(0, MAX_ITEMS);
        writeLegacy(merged);
        return;
    }

    try {
        const db = await openDb();
        const tx = db.transaction(STORE, "readwrite");
        const store = tx.objectStore(STORE);

        await promisifyRequest(store.put(item));

        // Pangkas data lama di luar MAX_ITEMS
        const all = await promisifyRequest<HistoryItem[]>(store.getAll());
        const sorted = all.sort(
            (a, b) => new Date(b.watchedAt).getTime() - new Date(a.watchedAt).getTime()
        );

        sorted.slice(MAX_ITEMS).forEach((old) => store.delete(old.seriesSlug));

        await new Promise<void>((resolve, reject) => {
            tx.oncomplete = () => resolve();
            tx.onerror = () => reject(tx.error ?? new Error("Transaksi IndexedDB gagal"));
        });
    } catch (error) {
        console.warn("Gagal menyimpan riwayat ke IndexedDB, memakai localStorage:", error);
        const items = await getHistory();
        const merged = [item, ...items.filter((i) => i.seriesSlug !== item.seriesSlug)].slice(0, MAX_ITEMS);
        writeLegacy(merged);
    }
}

/**
 * Hapus seluruh riwayat tontonan.
 */
export async function clearHistory(): Promise<void> {
    try {
        window.localStorage.removeItem(LEGACY_KEY);
    } catch {
        /* ignore */
    }

    if (!isIndexedDbSupported()) return;

    try {
        const db = await openDb();
        const tx = db.transaction(STORE, "readwrite");
        await promisifyRequest(tx.objectStore(STORE).clear());
    } catch (error) {
        console.warn("Gagal menghapus riwayat dari IndexedDB:", error);
    }
}

/**
 * Migrasi satu kali dari localStorage lama ("history") ke IndexedDB.
 * Data lama tidak dihapus agar aman, hanya disalin bila store masih kosong.
 */
export async function migrateLegacyHistory(): Promise<void> {
    if (!isIndexedDbSupported()) return;

    try {
        const db = await openDb();
        const tx = db.transaction(STORE, "readwrite");
        const store = tx.objectStore(STORE);

        const existing = await promisifyRequest<HistoryItem[]>(store.getAll());
        if (existing.length > 0) return;

        const legacy = readLegacy();
        const entries = Object.entries(legacy);
        if (entries.length === 0) return;

        entries.forEach(([seriesSlug, item]) => {
            store.put({ seriesSlug, ...item });
        });

        await new Promise<void>((resolve, reject) => {
            tx.oncomplete = () => resolve();
            tx.onerror = () => reject(tx.error ?? new Error("Migrasi IndexedDB gagal"));
        });
    } catch (error) {
        console.warn("Gagal migrasi riwayat lama ke IndexedDB:", error);
    }
}

export async function getEpisodePage(seriesSlug: string): Promise<number | null> {
    const legacyKey = `episode_page_${seriesSlug}`;

    if (!isIndexedDbSupported()) {
        try {
            const value = window.localStorage.getItem(legacyKey);
            return value ? Number(value) : null;
        } catch {
            return null;
        }
    }

    try {
        const db = await openDb();
        const request = db.transaction(EPISODE_PAGE_STORE, "readonly")
            .objectStore(EPISODE_PAGE_STORE)
            .get(seriesSlug);
        const item = await promisifyRequest<EpisodePage | undefined>(request);

        if (item?.page) return item.page;

        const legacyValue = window.localStorage.getItem(legacyKey);
        const legacyPage = legacyValue ? Number(legacyValue) : null;
        if (legacyPage && Number.isFinite(legacyPage)) {
            await saveEpisodePage(seriesSlug, legacyPage);
            return legacyPage;
        }
    } catch (error) {
        console.warn("Gagal membaca halaman episode dari IndexedDB:", error);
    }

    return null;
}

export async function saveEpisodePage(seriesSlug: string, page: number): Promise<void> {
    const legacyKey = `episode_page_${seriesSlug}`;

    if (!isIndexedDbSupported()) {
        try {
            window.localStorage.setItem(legacyKey, String(page));
        } catch (error) {
            console.warn("Gagal menyimpan halaman episode:", error);
        }
        return;
    }

    try {
        const db = await openDb();
        const transaction = db.transaction(EPISODE_PAGE_STORE, "readwrite");
        transaction.objectStore(EPISODE_PAGE_STORE).put({ seriesSlug, page });

        await new Promise<void>((resolve, reject) => {
            transaction.oncomplete = () => resolve();
            transaction.onerror = () => reject(transaction.error ?? new Error("Gagal menyimpan halaman episode"));
        });
    } catch (error) {
        console.warn("Gagal menyimpan halaman episode ke IndexedDB:", error);
        try {
            window.localStorage.setItem(legacyKey, String(page));
        } catch {
            /* ignore fallback errors */
        }
    }
}
