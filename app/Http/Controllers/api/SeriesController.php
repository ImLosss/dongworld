<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use App\Models\Genre;
use App\Models\Series;
use Illuminate\Http\Request;

class SeriesController extends Controller
{
    public function getSeriesDetail($slug)
    {
        $series = Series::with(['genres', 'comments'])->where('slug', $slug)->first();
        if (!$series) {
            return response()->json([
                'message' => 'Series not found'
            ], 404);
        }

        $series->genres_string = $series->genres->pluck('name')->implode(', ');

        $comments = $series->comments()->orderBy('created_at', 'desc')->get();

        return response()->json([
            'series' => $series,
            'episodes' => $series->episodes()->orderBy('episode_number')->paginate(25),
            'comments' => $comments ? $comments : []
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
