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
}
