<?php

namespace App\Http\Controllers;

use App\Models\Genre;
use Illuminate\Http\Request;
// Spatie permission integrates with Laravel's authorization; we'll use user->can()
use Yajra\DataTables\Facades\DataTables;

class GenreController extends Controller
{
    /**
     * Display the listing page.
     */
    public function index()
    {
        return view('admin.genre.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.genre.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:100|unique:genres,name',
        ]);

        Genre::create($validated);

        return redirect()->route('genre.index')
            ->with('alert', 'success')
            ->with('message', 'Genre berhasil ditambahkan');
    }

    /**
     * DataTables endpoint for genres list.
     */
    public function datatable(Request $request)
    {
        $query = Genre::query();
    $user = $request->user();

        return DataTables::of($query)
            ->addIndexColumn()
            ->editColumn('created_at', function (Genre $genre) {
                return optional($genre->created_at)->timezone(config('app.timezone'))?->format('d M Y H:i');
            })
            ->addColumn('action', function (Genre $data) use ($user) {
                $update = '';
                $delete = '';

                if ($user && $user->can('genreUpdate')) $update = '<a href="' . route('genre.edit', $data->id) . '" data-bs-toggle="tooltip" title="Edit">' . '<i class="fa-solid fa-pen-to-square text-secondary"></i>' . '</a>';

                if ($user && $user->can('genreDelete')) $delete = '<button class="cursor-pointer fas fa-trash text-danger" onclick="modalHapus(' . $data->id . ')" style="border: none; background: no-repeat;" data-bs-toggle="tooltip" data-bs-original-title="Delete"></button>';

                // Always include form so modalHapus -> submit(id) works when allowed
                $form = '<form id="form_' . $data->id . '" action="' . route('genre.destroy', $data->id) . '" method="POST" class="inline" style="display:none;">'
                      . csrf_field()
                      . method_field('DELETE')
                      . '</form>';

                return $update . $delete . $form;
            })
            ->rawColumns(['action'])
            ->toJson();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Genre $genre)
    {
        return view('admin.genre.edit', compact('genre'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Genre $genre)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:100|unique:genres,name,'.$genre->id,
        ]);

        $genre->update($validated);

        return redirect()->route('genre.index')
            ->with('alert', 'success')
            ->with('message', 'Genre berhasil diupdate');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Genre $genre)
    {
        $genre->delete();
        return redirect()->route('genre.index')
            ->with('alert', 'success')
            ->with('message', 'Genre berhasil dihapus');
    }
}
