<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Comment;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class CommentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $comments = Comment::with(['series', 'episode'])
            ->latest()
            ->paginate(20);

        return view('admin.comment.index', compact('comments'));
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
