<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Genre;
use App\Models\Series;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function getFilters()
    {
        $genres = Genre::all();
        $type = Series::select('type')->distinct()->get()->pluck('type');
        $status = Series::select('status')->distinct()->get()->pluck('status');

        return response()->json([
            'genres' => $genres,
            'type' => $type,
            'status' => $status
        ]);
    }

    public function search(Request $request)
    {
        // Tangkap keyword pencarian (bisa kosong)
        $searchQuery = $request->filled('search') ? $request->search : '';

        // Lakukan pencarian dengan Callback Khusus ke Meilisearch
        $scout = Series::search($searchQuery, function (\MeiliSearch\Endpoints\Indexes $meiliSearch, $query, $options) use ($request) {

            // Siapkan array untuk menampung filter
            $filters = [];

            if ($request->filled('type')) {
                $filters[] = 'type = "' . $request->type . '"';
            }

            if ($request->filled('status')) {
                $filters[] = 'status = "' . $request->status . '"';
            }

            if ($request->filled('genre')) {
                $genres = array_filter(array_map('trim', explode(',', $request->genre)));
                foreach ($genres as $genre) {
                    // Logic AND: Harus memiliki genre A dan genre B
                    $filters[] = 'genres = "' . $genre . '"';
                }
            }

            // Jika ada filter, gabungkan menggunakan AND
            if (!empty($filters)) {
                $options['filter'] = implode(' AND ', $filters);
            }

            // Eksekusi ke Meilisearch
            return $meiliSearch->search($query, $options);
        });

        // Bagian query() akan dijalankan ke MySQL SETELAH hasil ID didapatkan dari Meilisearch
        // Ini cocok untuk mengambil data relasi (seperti aggregate episode)
        $scout->query(function ($query) {
            $query->withMax('mainEpisodes as episodes_max_episode_number', 'episode_number');
        });

        // Hasil pencarian & paginasi akan aman dan sangat akurat
        $results = $scout->paginate(10);

        $results->getCollection()->each(function ($item) {
            if ($item->episodes_max_episode_number !== null) {
                $item->episodes_max_episode_number = (int) $item->episodes_max_episode_number;
            }
        });

        return response()->json([
            'data' => $results,
        ]);
    }
}
