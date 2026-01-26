<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use Illuminate\Http\Request;

class WatchController extends Controller
{
    public function watch($slug)
    {
        $detailEpisode = Episode::with(['series', 'links.server', 'user', 'comments'])->where('slug', $slug)->first();
        if (!$detailEpisode) {
            return response()->json([
                'message' => 'Episode not found'
            ], 404);
        }

        $episodes = Episode::where('series_id', $detailEpisode->series_id)
            ->orderBy('episode_number')
            ->paginate(25);

        $nextEpisode = Episode::where('series_id', $detailEpisode->series_id)
            ->where('episode_number', '>', $detailEpisode->episode_number)
            ->orderBy('episode_number', 'asc')
            ->first();

        $prevEpisode = Episode::where('series_id', $detailEpisode->series_id)
            ->where('episode_number', '<', $detailEpisode->episode_number)
            ->orderBy('episode_number', 'desc')
            ->first();

        $detailEpisode->series->genres_string = $detailEpisode->series->genres->pluck('name')->implode(', ');
        $detailEpisode->series->views = $detailEpisode->series->views()->where('episode_id', $detailEpisode->id)->sum('views');
        $detailEpisode->uploader = $detailEpisode->user?->name ? $detailEpisode->user->name : 'Admin';

        $comments = $detailEpisode->comments()->orderBy('created_at', 'desc')->get();

        return response()->json([
            'detail-episode' => $detailEpisode,
            'episodes' => $episodes,
            'comments' => $comments ? $comments : [],
            'nextEpisodeSlug' => $nextEpisode ? $nextEpisode->slug : null,
            'prevEpisodeSlug' => $prevEpisode ? $prevEpisode->slug : null,
        ]);
    }
}
