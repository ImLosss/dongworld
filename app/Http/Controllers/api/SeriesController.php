<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use App\Models\Genre;
use App\Models\Series;
use App\Models\View;
use Illuminate\Http\Request;

class SeriesController extends Controller
{
    public function getSeriesDetail($slug)
    {
        $series = Series::with(['genres', 'comments'])->where('slug', $slug)->withMax('episodes', 'episode_number')->first();
        if (!$series) {
            return response()->json([
                'message' => 'Series not found'
            ], 404);
        }

        $series->genres_string = $series->genres->pluck('name')->implode(', ');
        $series->views = $series->views()->sum('views');

        $comments = $series->comments()->orderBy('created_at', 'desc')->get();

        return response()->json([
            'series' => $series,
            'episodes' => $series->episodes()->orderBy('episode_number')->get(),
            'comments' => $comments ? $comments : []
        ]);
    }

    public function getRecomendation()
    {
        $series = Series::with(['genres'])
        ->withSum('views', 'views')
        ->withMax('episodes', 'episode_number')
        ->orderByDesc('views_sum_views')
        ->take(5)
        ->get()
        ->each(function ($s) {
            $s->views = (int) ($s->views_sum_views ?? 0);
        });

        return response()->json([
            'series' => $series
        ]);
    }

    public function incrementViewCount($slug, Request $request)
    {
        $request->validate([
            'episode_id' => 'required|integer|exists:episodes,id',
        ]);
        $series = Series::where('slug', $slug)->first();
        if (!$series) {
            return response()->json([
                'message' => 'Series not found'
            ], 404);
        }

        $today = now()->startOfDay();

        $daily = View::firstOrCreate(
            ['series_id' => $series->id, 'episode_id' => $request->episode_id, 'created_at' => $today],
            ['views' => 0]
        );

        $daily->timestamps = false;
        $daily->increment('views');

        return response()->json([
            'message' => 'View count incremented',
            'views' => $daily->views
        ]);
    }

    public function postComment(Request $request)
    {
        $request->validate([
            'slug' => 'required|string',
            'name' => 'required|string|max:30',
            'comment' => 'required|string|max:250',
        ]);

        $data = Series::where('slug', $request->slug)->first();

        if (!$data) {
            $data = Episode::where('slug', $request->slug)->first();
        }

        if (!$data) {
            return response()->json(['message' => 'Series or episode not found'], 404);
        }

        $comment = $data->comments()->create([
            'name' => $request->name,
            'content' => $request->comment,
        ]);

        return response()->json([
            'message' => 'Comment posted successfully',
            'comment' => $comment
        ], 201);
    }
}
