<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Comment;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('admin.comment.index');
    }

    public function datatable(Request $request)
    {
        $query = Comment::with(['series', 'episode.series'])->latest();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('name', function (Comment $comment) {
                $badge = $comment->is_admin
                    ? '<span class="badge badge-sm bg-gradient-dark ms-2">Admin</span>'
                    : '';

                return '<div class="d-flex align-items-center">'
                    . '<span class="text-dark">' . e($comment->name) . '</span>'
                    . $badge
                    . '</div>';
            })
            ->addColumn('content', fn (Comment $comment) => e(Str::limit($comment->content, 120)))
            ->addColumn('series', function (Comment $comment) {
                $seriesName = optional($comment->series)->name ?? '-';
                if ($comment->episode && $comment->episode->series) $seriesName = $comment->episode->series->name;
                return e($seriesName);
            })
            ->addColumn('episode', fn (Comment $comment) => e(optional($comment->episode)->episode_number ?? '-'))
            ->addColumn('created_at', fn (Comment $comment) => optional($comment->created_at)->format('d M Y H:i'))
            ->addColumn('action', function (Comment $comment) {
                $detail = '<a href="' . route('comments.show', $comment->id) . '" class="me-2" data-bs-toggle="tooltip" title="Detail">'
                    . '<i class="fa-solid fa-eye text-info"></i>'
                    . '</a>';
                $delete = '<button type="button" class="cursor-pointer" onclick="modalHapus(' . $comment->id . ')" style="border: none; background: none;" data-bs-toggle="tooltip" title="Hapus">'
                    . '<i class="fa-solid fa-trash text-danger"></i>'
                    . '</button>';
                $form = '<form id="form_' . $comment->id . '" action="' . route('comments.destroy', $comment->id) . '" method="POST" style="display:none;">'
                    . csrf_field()
                    . method_field('DELETE')
                    . '</form>';

                return $detail . $delete . $form;
            })
            ->rawColumns(['name', 'action'])
            ->toJson();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return redirect()->route('comments.index');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        return redirect()->route('comments.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $comment = Comment::with(['series', 'episode'])->findOrFail($id);

        $relatedComments = Comment::with(['series', 'episode'])
            ->where('series_id', $comment->series_id)
            ->where('episode_id', $comment->episode_id)
            ->latest()
            ->take(10)
            ->get();

        return view('admin.comment.show', compact('comment', 'relatedComments'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return redirect()->route('comments.show', $id);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        return redirect()->route('comments.show', $id);
    }

    public function reply(Request $request, Comment $comment)
    {
        $validated = $request->validate([
            'content' => ['required', 'string'],
        ]);

        $content = trim($validated['content']);
        $prefix = '@' . $comment->name . ' ';
        if (!Str::startsWith($content, $prefix)) {
            $content = $prefix . $content;
        }

        Comment::create([
            'series_id' => $comment->series_id,
            'episode_id' => $comment->episode_id,
            'name' => Auth::user()->name ?? 'Admin',
            'content' => $content,
            'is_admin' => true,
        ]);

        return redirect()->route('comments.show', $comment->id)
            ->with(['alert' => 'success', 'message' => 'Balasan berhasil dikirim.']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $comment = Comment::findOrFail($id);
        $comment->delete();

        return redirect()->route('comments.index')
            ->with(['alert' => 'success', 'message' => 'Komentar berhasil dihapus.']);
    }
}
