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

    public function getEpisode(Request $request) {
        $request->validate([
            'series_id' => 'required|integer|exists:series,id',
            'episode_number' => [
                'required',
                'integer'
            ]
        ]);

        $episode = Episode::with(['downloads', 'series'])
            ->where('series_id', $request->input('series_id'))
            ->where('episode_number', $request->input('episode_number'))
            ->first();

        if (!$episode) return response()->json(['message' => 'Episode not found'], 404);

        return response()->json([
            'episode' => $episode
        ], 200);

    }

    public function updateServerLink(Request $request) {
        $request->validate([
            'episode_id' => 'required|integer|exists:episodes,id'
        ]);

        $episode = Episode::findOrFail($request->input('episode_id'));
        $servers = Server::all();
        foreach ($servers as $server) {
            $url = $request->input('links_' . $server->id);
            if ($url) {
                $link = Link::where('episode_id', $episode->id)
                    ->where('server_id', $server->id)
                    ->first();
                if ($link) {
                    $link->update(['url' => $url]);
                } else {
                    Link::create([
                        'episode_id' => $episode->id,
                        'server_id' => $server->id,
                        'url' => $url,
                    ]);
                }
            }
        }

        return response()->json(['status' => 'success'], 200);
    }

    public function deleteServerLink(Request $request) {
        $request->validate([
            'episode_id' => 'required|integer|exists:episodes,id',
            'server_id' => 'required|integer|exists:servers,id'
        ]);

        $link = Link::where('episode_id', $request->input('episode_id'))
            ->where('server_id', $request->input('server_id'))
            ->first();

        if (!$link) {
            return response()->json(['message' => 'Link not found'], 404);
        }

        $link->delete();

        return response()->json(['status' => 'success'], 200);
    }
}
