<?php

namespace App\Http\Controllers;

use App\Models\Genre;
use App\Models\Series;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Yajra\DataTables\Facades\DataTables;

class SeriesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin.series.index');
    }

    /**
     * DataTables endpoint for series list.
     */
    public function datatable(Request $request)
    {
    $query = Series::with('genres');
        $user = $request->user();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('thumbnail', fn (Series $s) => $s->thumbnail ? '<img src="' . asset($s->thumbnail) . '" alt="thumb" style="height:40px;width:auto;border-radius:6px;object-fit:cover;">' : '-')
            ->addColumn('type', fn (Series $s) => $s->type)
            ->addColumn('rating', fn (Series $s) => $s->rating)
            ->addColumn('total_episodes', fn (Series $s) =>   $s->current_episode . '/' . $s->total_episodes)
            ->addColumn('release_date', fn (Series $s) => $s->release_date)
            ->addColumn('genres', fn (Series $s) => $s->genres->pluck('name')->implode(', '))
            ->addColumn('action', function (Series $data) use ($user) {
                $update = '';
                $delete = '';
                $episodes = '';

                if ($user && $user->can('seriesUpdate')) {
                    $update = '<a href="' . route('series.edit', $data->id) . '" data-bs-toggle="tooltip" title="Edit">'
                            . '<i class="fa-solid fa-pen-to-square text-secondary"></i>'
                            . '</a>';
                }

                if ($user && $user->can('seriesDelete')) {
                    $delete = '<button class="cursor-pointer fas fa-trash text-danger ms-2" onclick="modalHapus(' . $data->id . ')" style="border: none; background: no-repeat;" data-bs-toggle="tooltip" data-bs-original-title="Delete"></button>';
                }

                if ($user && $user->can('episodeAccess')) {
                    $episodes = '<a href="' . route('episode.index', $data->id) . '" class="ms-2" data-bs-toggle="tooltip" title="Episodes">'
                              . '<i class="fa-solid fa-circle-plus text-success"></i>'
                              . '</a>';
                }

                $form = '<form id="form_' . $data->id . '" action="' . route('series.destroy', $data->id) . '" method="POST" class="inline" style="display:none;">'
                      . csrf_field()
                      . method_field('DELETE')
                      . '</form>';

                return $update . $delete . $episodes . $form;
            })
            ->rawColumns(['action','thumbnail'])
            ->toJson();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
    $genres = Genre::orderBy('name')->get();
    return view('admin.series.create', compact('genres'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string|max:255|unique:series,slug',
            'type' => 'required|in:movie,episodes',
            'duration' => 'nullable|integer',
            'studios' => 'nullable|string',
            'rating' => 'nullable|numeric',
            'synopsis' => 'nullable|string',
            'total_episodes' => 'nullable',
            'release_date' => 'nullable|string',
            'thumbnail' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'genres' => 'nullable|array',
            'genres.*' => 'exists:genres,id',
        ]);

        // Ensure slug from name if not provided from UI
        if (empty($validated['slug'])) {
            $validated['slug'] = Str::slug($validated['name']);
        }

        // Handle thumbnail upload
        if ($request->hasFile('thumbnail')) {
            $path = $request->file('thumbnail')->store('series', 'public');
            $validated['thumbnail'] = 'storage/' . $path; // save src path
        } else {
            unset($validated['thumbnail']);
        }

        $series = Series::create($validated);
        $series->genres()->sync($request->input('genres', []));

        return redirect()->route('series.index')
            ->with('alert', 'success')
            ->with('message', 'Series berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(Series $series)
    {
        return view('admin.series.episodes', compact('series'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Series $series)
    {
    $genres = Genre::orderBy('name')->get();
    return view('admin.series.edit', compact('series','genres'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Series $series)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string|max:255|unique:series,slug,' . $series->id,
            'type' => 'required|in:movie,episodes',
            'duration' => 'nullable|integer',
            'studios' => 'nullable|string',
            'rating' => 'nullable|numeric',
            'synopsis' => 'nullable|string',
            'total_episodes' => 'nullable',
            'release_date' => 'nullable|string',
            'thumbnail' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'genres' => 'nullable|array',
            'genres.*' => 'exists:genres,id',
        ]);

        if (empty($validated['slug'])) {
            $validated['slug'] = Str::slug($validated['name']);
        }

        // Handle thumbnail upload if provided
        if ($request->hasFile('thumbnail')) {
            $path = $request->file('thumbnail')->store('series', 'public');
            $validated['thumbnail'] = 'storage/' . $path; // save src path
        } else {
            unset($validated['thumbnail']);
        }

        $series->update($validated);
        $series->genres()->sync($request->input('genres', []));

        return redirect()->route('series.index')
            ->with('alert', 'success')
            ->with('message', 'Series berhasil diupdate');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Series $series)
    {
        $series->delete();
        return redirect()->route('series.index')
            ->with('alert', 'success')
            ->with('message', 'Series berhasil dihapus');
    }
}
