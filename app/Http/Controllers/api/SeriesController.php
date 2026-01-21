<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Genre;
use App\Models\Series;
use Illuminate\Http\Request;

class SeriesController extends Controller
{
    public function getSeriesDetail($slug)
    {
        $series = Series::with(['genres'])->where('slug', $slug)->first();
        if (!$series) {
            return response()->json([
                'message' => 'Series not found'
            ], 404);
        }

        $series->genres_string = $series->genres->pluck('name')->implode(', ');

        return response()->json([
            'series' => $series,
            'episodes' => $series->episodes()->orderBy('episode_number')->paginate(25)
        ]);
    }

    public function getRecomendation()
    {
        $series = Series::with(['genres'])
        ->orderBy('views', 'desc')
        ->take(10)
        ->get();

        return response()->json([
            'series' => $series
        ]);
    }

    public function incrementViewCount($slug)
    {
        $series = Series::where('slug', $slug)->first();
        if (!$series) {
            return response()->json([
                'message' => 'Series not found'
            ], 404);
        }

        $series->increment('views');

        return response()->json([
            'message' => 'View count incremented',
            'views' => $series->views
        ]);
    }
}
