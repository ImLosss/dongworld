<?php

namespace App\Http\Controllers\api\telegram;

use App\Http\Controllers\Controller;
use App\Models\Series;
use Illuminate\Http\Request;

class SeriesController extends Controller
{
    public function getSeriesDetail($id)
    {
        $series = Series::where('id', $id)->first();
        if (!$series) {
            return response()->json([
                'message' => 'Series not found'
            ], 404);
        }

        return response()->json([
            'series' => $series,
        ]);
    }

    public function getAllEps($id)
    {
        $series = Series::with('episodes.links')->where('id', $id)->first();
        if (!$series) {
            return response()->json([
                'message' => 'Series not found'
            ], 404);
        }

        return response()->json([
            'series_name' => $series->name,
            'episodes' => $series->episodes->sortBy('episode_number')->values()
        ]);
    }

    public function searchSeries($query)
    {
        $search = $query;

        $query = Series::query();

        $search = strtolower($search);

        $query->where(function ($q) use ($search) {
            $q->whereRaw("LOWER(name) LIKE ?", ['%' . $search . '%'])
            ->orWhereRaw("
                EXISTS (
                SELECT 1
                FROM JSON_TABLE(aliases, '$[*]' COLUMNS(alias VARCHAR(255) PATH '$')) jt
                WHERE LOWER(jt.alias) LIKE ?
                )
            ", ['%' . $search . '%']);
        });

        $seriesList = $query
            ->orderBy('name', 'asc')
            ->get();

        return response()->json([
            'series' => $seriesList,
        ]);
    }

    public function getReleaseDay()
    {
        // 1. Buat kerangka default agar semua hari tetap muncul meskipun tidak ada series
        $defaultSchedule = collect([
            'senin'  => [],
            'selasa' => [],
            'rabu'   => [],
            'kamis'  => [],
            'jumat'  => [],
            'sabtu'  => [],
            'minggu' => []
        ]);

        // 2. Ambil data dari database
        $schedules = Series::whereNotNull('release_day')
            ->where('status', 'ongoing')
            ->get()
            ->groupBy(function ($item) {
                // Kelompokkan berdasarkan hari (dijadikan huruf kecil agar cocok dengan key default)
                return strtolower($item->release_day);
            })
            ->map(function ($group) {
                // Ambil hanya kolom 'name' dari masing-masing series dan jadikan array
                return $group->pluck('name')->toArray();
            });

        // 3. Gabungkan template default dengan data dari database
        // Jika ada hari yang kosong dari DB, akan tergantikan oleh array kosong dari $defaultSchedule
        $result = $defaultSchedule->merge($schedules);

        // 4. Return sebagai JSON
        return response()->json($result);
    }
}
