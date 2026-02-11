<?php

namespace App\Http\Controllers;

use App\Models\Episode;
use App\Models\Link;
use App\Models\Series;
use App\Models\Server;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Yajra\DataTables\Facades\DataTables;

class EpisodeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Series $series)
    {
        return view('admin.episode.index', compact('series'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Series $series)
    {
        $servers = Server::orderBy('name')->get();
        $currentMax = Episode::where('series_id', $series->id)->max('episode_number');
        $nextEpisode = (int) (($currentMax ?? 0) + 1);
        return view('admin.episode.create', compact('series','servers','nextEpisode'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, Series $series)
    {
        $validated = $request->validate([
            'episode_number' => [
                'required',
                'integer',
                Rule::unique('episodes', 'episode_number')
                    ->where(fn ($q) => $q->where('series_id', $series->id)),
            ],
            'downloads' => ['nullable', 'array'],
            'downloads.*.link' => ['nullable', 'string'],
            'downloads.*.quality' => ['nullable', 'string'],
            'downloads.*.server' => ['nullable', 'string'],
        ]);

        // slug logic
        $prefix = Str::lower(Str::random(5));
        $seriesNameSlug = Str::slug($prefix . '-' . $series->name);
        if ($series->type === 'movie') {
            $slug = $seriesNameSlug . '-movie';
            $validated['episode_number'] = null;
        } else {
            $episode = (int) ($request->input('episode_number') ?? 1);
            $slug = $seriesNameSlug . '-' . $episode;
            $validated['episode_number'] = $episode;
        }

        $episode = Episode::create([
            'series_id' => $series->id,
            'episode_number' => $validated['episode_number'] ?? null,
            'slug' => $slug,
            'user_id' => $request->user()->id,
        ]);

        $series->update(['updated_at' => now()]);

        // optional link inputs per server
        $servers = Server::all();
        foreach ($servers as $server) {
            $url = $request->input('links.' . $server->id);
            if ($url) {
                Link::create([
                    'episode_id' => $episode->id,
                    'server_id' => $server->id,
                    'url' => $url,
                ]);
            }
        }

        $downloadsInput = $request->input('downloads', []);
        $downloads = collect($downloadsInput)
            ->map(function ($row) {
                return [
                    'link' => trim($row['link'] ?? ''),
                    'quality' => trim($row['quality'] ?? ''),
                    'server' => trim($row['server'] ?? ''),
                ];
            })
            ->filter(fn ($row) => $row['link'] !== '')
            ->values();

        foreach ($downloads as $row) {
            $episode->downloads()->create([
                'episode_id' => $episode->id,
                'link' => $row['link'],
                'quality' => $row['quality'] !== '' ? $row['quality'] : '1080P',
                'server' => $row['server'] !== '' ? $row['server'] : 'drive',
            ]);
        }



        return redirect()->route('episode.index', $series->id)
            ->with('alert', 'success')
            ->with('message', 'Episode berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(Series $series, Episode $episode)
    {
        return redirect()->route('episode.index', $series->id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Series $series, Episode $episode)
    {
        $servers = Server::orderBy('name')->get();
        $links = $episode->links()->get()->keyBy('server_id');
        $downloads = $episode->downloads()->get();
        return view('admin.episode.edit', compact('series','episode','servers','links','downloads'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Series $series, Episode $episode)
    {
        $rules = [];

        // slug logic
        $prefix = Str::lower(Str::random(5));
        $seriesNameSlug = Str::slug($prefix . '-' . $series->name);
        if ($series->type === 'movie') {
            $slug = $episode->slug;
            $rules['episode_number'] = ['nullable'];
        } else {
            $slug = $seriesNameSlug . '-' . $request->episode_number;
            if($request->episode_number == $episode->episode_number) $slug = $episode->slug;
            $rules['episode_number'] = [
                'required',
                'integer',
                Rule::unique('episodes', 'episode_number')
                    ->where(fn ($q) => $q->where('series_id', $series->id))
                    ->ignore($episode->id),
            ];
        }

        $rules['downloads'] = ['nullable', 'array'];
        $rules['downloads.*.link'] = ['nullable', 'string'];
        $rules['downloads.*.quality'] = ['nullable', 'string'];
        $rules['downloads.*.server'] = ['nullable', 'string'];

        $validated = $request->validate($rules);

        $episode->update([
            'episode_number' => $validated['episode_number'] ?? null,
            'slug' => $slug,
            'user_id' => $request->user()->id,
        ]);

        // update/create links per server (optional)
        $servers = Server::all();
        foreach ($servers as $server) {
            $url = $request->input('links.' . $server->id);
            $existing = $episode->links()->where('server_id', $server->id)->first();
            if ($url) {
                if ($existing) {
                    $existing->update(['url' => $url]);
                } else {
                    Link::create([
                        'episode_id' => $episode->id,
                        'server_id' => $server->id,
                        'url' => $url,
                    ]);
                }
            } else {
                if ($existing) {
                    $existing->delete();
                }
            }
        }

        $downloadsInput = $request->input('downloads', []);
        $downloads = collect($downloadsInput)
            ->map(function ($row) {
                return [
                    'link' => trim($row['link'] ?? ''),
                    'quality' => trim($row['quality'] ?? ''),
                    'server' => trim($row['server'] ?? ''),
                ];
            })
            ->filter(fn ($row) => $row['link'] !== '')
            ->values();

        $episode->downloads()->delete();
        foreach ($downloads as $row) {
            $episode->downloads()->create([
                'episode_id' => $episode->id,
                'link' => $row['link'],
                'quality' => $row['quality'] !== '' ? $row['quality'] : '1080P',
                'server' => $row['server'] !== '' ? $row['server'] : 'drive',
            ]);
        }

        return redirect()->route('episode.index', $series->id)
            ->with('alert', 'success')
            ->with('message', 'Episode berhasil diupdate');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Series $series, Episode $episode)
    {
        $episode->delete();
        return redirect()->route('episode.index', $series->id)
            ->with('alert', 'success')
            ->with('message', 'Episode berhasil dihapus');
    }

    public function sendNotif($episodeId)
    {
        $episode = Episode::with('series')->findOrFail($episodeId);
        $episode->series->timestamps = false;
        $episode->series->update(['updated_at' => now()]);
    }

    /**
     * DataTable for episodes per series.
     */
    public function datatable(Request $request, Series $series)
    {
        $query = Episode::with(['links.server'])->where('series_id', $series->id);
        $user = $request->user();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('name', function (Episode $e) use ($series) {
                if ($series->type === 'movie') return $series->name . ' (Movie)';
                return $series->name . ' - Episode ' . ($e->episode_number ?? '-');
            })
            ->addColumn('server', function (Episode $e) {
                return $e->links->map(fn($l) => optional($l->server)->name)->filter()->unique()->implode(', ') ? : 'Belum';
            })
            ->editColumn('created_at', fn (Episode $e) => optional($e->created_at)?->format('d M Y H:i'))
            ->addColumn('action', function (Episode $data) use ($user, $series) {
                $update = '';
                $delete = '';

                if ($user && $user->can('episodeUpdate')) {
                    $update = '<a href="' . route('episode.edit', [$series->id, $data->id]) . '" data-bs-toggle="tooltip" title="Edit">'
                            . '<i class="fa-solid fa-pen-to-square text-secondary"></i>'
                            . '</a>';
                }

                if ($user && $user->can('episodeDelete')) {
                    $delete = '<button class="cursor-pointer fas fa-trash text-danger ms-2" onclick="modalHapus(' . $data->id . ')" style="border: none; background: no-repeat;" data-bs-toggle="tooltip" data-bs-original-title="Delete"></button>';
                }

                $form = '<form id="form_' . $data->id . '" action="' . route('episode.destroy', [$series->id, $data->id]) . '" method="POST" class="inline" style="display:none;">'
                      . csrf_field()
                      . method_field('DELETE')
                      . '</form>';

                return $update . $delete . $form;
            })
            ->rawColumns(['action'])
            ->toJson();
    }
}
