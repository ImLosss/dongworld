<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use Illuminate\Http\Request;

class WatchController extends Controller
{
    public function watch($slug)
    {
        $detailEpisode = Episode::with(['series', 'links.server', 'user'])->where('slug', $slug)->first();
        if (!$detailEpisode) {
            return response()->json([
                'message' => 'Episode not found'
            ], 404);
        }

        $episodes = Episode::where('series_id', $detailEpisode->series_id)
            ->orderBy('episode_number')
            ->paginate(25);

        $detailEpisode->series->genres_string = $detailEpisode->series->genres->pluck('name')->implode(', ');
        $detailEpisode->uploader = $detailEpisode->user?->name ? $detailEpisode->user->name : 'Admin';

        return response()->json([
            'detail-episode' => $detailEpisode,
            'episodes' => $episodes
        ]);
    }
}
