<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use App\Models\Series;

class SitemapController extends Controller
{
    public function generateSitemap()
    {
        $seriesSlugs = Series::all()->pluck(['slug', 'updated_at']);
        $episodeSlugs = Episode::all()->pluck(['slug', 'updated_at']);

        return response()->json([
            'series' => $seriesSlugs,
            'episodes' => $episodeSlugs,
        ]);
    }
}
