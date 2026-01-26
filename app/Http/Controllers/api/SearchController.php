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
        $query = Series::query();

        if ($request->filled('search')) {
        $search = strtolower($request->search);

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
    }

        if ($request->filled('type')) {
            $query->where('type', $request->type);
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        if ($request->filled('genre')) {
            $genres = array_filter(array_map('trim', explode(',', $request->genre)));

            foreach ($genres as $genre) {
                $query->whereHas('genres', function ($q) use ($genre) {
                    $q->where('name', $genre);
                });
            }
        }

        return response()->json([
            'data' => $query->paginate(1),
        ]);
    }
}
