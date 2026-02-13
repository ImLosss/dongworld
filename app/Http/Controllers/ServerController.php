<?php

namespace App\Http\Controllers;

use App\Models\Server;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class ServerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin.server.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.server.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        Server::create($validated);

        return redirect()->route('server.index')
            ->with('alert', 'success')
            ->with('message', 'Server berhasil ditambahkan');
    }

    /**
     * Display the specified resource.
     */
    public function show(Server $server)
    {
        return redirect()->route('server.index');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Server $server)
    {
        return view('admin.server.edit', compact('server'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Server $server)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'note' => 'nullable|string',
        ]);

        $server->update($validated);

        return redirect()->route('server.index')
            ->with('alert', 'success')
            ->with('message', 'Server berhasil diupdate');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Server $server)
    {
        $server->delete();
        return redirect()->route('server.index')
            ->with('alert', 'success')
            ->with('message', 'Server berhasil dihapus');
    }

    /**
     * DataTables endpoint for servers list.
     */
    public function datatable(Request $request)
    {
        $query = Server::query();
        $user = $request->user();

        return DataTables::of($query)
            ->addIndexColumn()
            ->editColumn('created_at', fn (Server $s) => optional($s->created_at)?->format('d M Y H:i'))
            ->addColumn('action', function (Server $data) use ($user) {
                $update = '';
                $delete = '';

                if ($user && $user->can('serverUpdate')) {
                    $update = '<a href="' . route('server.edit', $data->id) . '" data-bs-toggle="tooltip" title="Edit">'
                            . '<i class="fa-solid fa-pen-to-square text-secondary"></i>'
                            . '</a>';
                }

                if ($user && $user->can('serverDelete')) {
                    $delete = '<button class="cursor-pointer fas fa-trash text-danger ms-2" onclick="modalHapus(' . $data->id . ')" style="border: none; background: no-repeat;" data-bs-toggle="tooltip" data-bs-original-title="Delete"></button>';
                }

                $form = '<form id="form_' . $data->id . '" action="' . route('server.destroy', $data->id) . '" method="POST" class="inline" style="display:none;">'
                      . csrf_field()
                      . method_field('DELETE')
                      . '</form>';

                return $update . $delete . $form;
            })
            ->rawColumns(['action'])
            ->toJson();
    }
}
