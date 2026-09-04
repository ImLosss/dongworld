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
        // 1. Buat kerangka default jadwal
        $schedule = [
            'senin'  => [],
            'selasa' => [],
            'rabu'   => [],
            'kamis'  => [],
            'jumat'  => [],
            'sabtu'  => [],
            'minggu' => []
        ];

        // 2. Ambil data series dari database
        $series = Series::whereNotNull('release_day')
            ->where('status', 'ongoing')
            ->get(['name', 'release_day']); // Ambil field yang diperlukan saja

        // 3. Masukkan nama series ke masing-masing hari rilisnya
        foreach ($series as $item) {
            // Pastikan release_day tidak null dan memang array
            if (is_array($item->release_day)) {
                foreach ($item->release_day as $day) {
                    $dayKey = strtolower($day); // Ubah ke huruf kecil ('Senin' -> 'senin')

                    // Pastikan harinya valid dan ada di kerangka default
                    if (array_key_exists($dayKey, $schedule)) {
                        $schedule[$dayKey][] = $item->name;
                    }
                }
            }
        }

        // 4. Return sebagai JSON
        return response()->json($schedule);
    }
}
