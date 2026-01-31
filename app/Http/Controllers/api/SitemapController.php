<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use App\Models\Series;

class SitemapController extends Controller
{
    public function generateSitemap()
    {
        $seriesSlugs = Series::all()->pluck('slug');
        $episodeSlugs = Episode::all()->pluck('slug');

        return response()->json([
            'series' => $seriesSlugs,
            'episodes' => $episodeSlugs,
        ]);
    }
}
