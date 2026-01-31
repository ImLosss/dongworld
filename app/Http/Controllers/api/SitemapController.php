<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use App\Models\Series;

class SitemapController extends Controller
{
    public function generateSitemap()
    {
        $seriesSlugs = Series::select('slug', 'updated_at')->get();
        $episodeSlugs = Episode::select('slug', 'updated_at')->get();

        return response()->json([
            'series' => $seriesSlugs,
            'episodes' => $episodeSlugs,
        ]);
    }
}
