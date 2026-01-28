<?php

namespace App\Http\Controllers\api\telegram;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use App\Models\Series;
use App\Models\Server;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class EpisodeController extends Controller
{
    public function newEpisode(Request $request) {
        $request->validate([
            'series_id' => 'required|integer|exists:series,id',
            'episode_number' => [
                'required',
                'integer',
                Rule::unique('episodes', 'episode_number')
                    ->where(fn ($q) => $q->where('series_id', $request->input('series_id'))),
            ],
            'link_drive' => 'nullable|string'
        ]);

        $series = Series::findOrFail($request->input('series_id'));

        $downloadLinks = [
            'drive' => $validated['link_drive'] ?? null,
        ];

        // buang yang null / empty string
        $downloadLinks = array_filter($downloadLinks, fn ($v) => $v !== null && $v !== '');

        $prefix = Str::lower(Str::random(5));

        $episode = Episode::create([
            'series_id' => $request->input('series_id'),
            'episode_number' => $request->input('episode_number'),
            'download_links' => json_encode([
                'drive' => $request->input('link_drive'),
            ]),
            'slug' => $prefix . '-' . $series->slug . '-' . $request->input('episode_number'),
            'user_id' => null
        ]);

        return response()->json([
            'message' => 'Episode created successfully',
            'episode_id' => $episode->id
        ], 201);
    }
}
