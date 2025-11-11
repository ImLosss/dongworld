<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
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
}
