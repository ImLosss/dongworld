<?php

namespace App\Http\Controllers\api\telegram;

use App\Http\Controllers\Controller;
use App\Models\Download;
use App\Models\Episode;
use App\Models\Link;
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
            'drive' => 'nullable|string',
        ]);

        $series = Series::findOrFail($request->input('series_id'));

        $prefix = Str::lower(Str::random(5));

        $episode = Episode::create([
            'series_id' => $request->input('series_id'),
            'episode_number' => $request->input('episode_number'),
            'slug' => $prefix . '-' . $series->slug . '-' . $request->input('episode_number'),
            'user_id' => null
        ]);

        Download::create([
            'episode_id' => $episode->id,
            'link' => $request->input('drive'),
            'quality' => '1080P',
            'server' => 'drive'
        ]);

        $series->update(['updated_at' => now()]);

        // optional link inputs per server
        $servers = Server::all();
        $serverAdd = false;
        foreach ($servers as $server) {
            $url = $request->input('links_' . $server->id);
            if ($url) {
                Link::create([
                    'episode_id' => $episode->id,
                    'server_id' => $server->id,
                    'url' => $url,
                ]);
                $serverAdd = true;
            }
        }

        return response()->json([
            'message' => 'Episode created successfully',
            'episode_id' => $episode->id,
            'link' => "https://dongworld.top/watch/" . $episode->slug,
            'server' => $serverAdd,
            'download' => $request->input('drive') ? true : false,
        ], 201);
    }
}
