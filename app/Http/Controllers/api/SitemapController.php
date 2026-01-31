<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use App\Models\Series;

class SitemapController extends Controller
{
    public function generateSitemap()
    {
        $seriesSlugs = Series::pluck('updated_at', 'slug');
        $episodeSlugs = Episode::pluck('updated_at', 'slug');

        return response()->json([
            'series' => $seriesSlugs,
            'episodes' => $episodeSlugs,
        ]);
    }
}
