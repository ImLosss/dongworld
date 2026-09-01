<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Comment;
use App\Models\Episode;
use App\Models\Series;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function getSeries()
    {
        $series = Series::latest('updated_at')
            ->withMax('episodes', 'episode_number')
            ->take(10)
            ->get();

        $movies = Series::where('type', 'movie')
            ->latest('updated_at')
            ->withMax('episodes', 'episode_number')
            ->take(10)
            ->get();

        $heroSlides = Series::inRandomOrder()
            ->take(3)
            ->get();

        $schedules = Series::whereNotNull('release_day')
            ->withMax('episodes', 'episode_number')
            ->where('status', 'ongoing')
            ->get();

        return response()->json(['series' => $series, 'movies' => $movies, 'heroSlides' => $heroSlides, 'schedules' => $schedules]);
    }

    public function recentComment()
    {
        // Tambahkan 'parent' ke dalam array with()
        $comments = Comment::with(['series', 'episode', 'parent'])
            ->orderBy('created_at', 'desc')
            ->limit(10)
            ->get();

        $formattedComments = $comments->map(function ($comment) {
            $srcComment = '#';

            if ($comment->episode_id && $comment->episode) {
                $srcComment = '/watch/' . $comment->episode->slug;
            } elseif ($comment->series_id && $comment->series) {
                $srcComment = '/series/' . $comment->series->slug;
            }

            return [
                'id'         => $comment->id,
                'name'       => $comment->name,
                'content'    => $comment->content,
                'is_admin'   => $comment->is_admin,
                'created_at' => $comment->created_at,
                'srcComment' => $srcComment,
                'replyTo'    => $comment->reply_to_comment_id && $comment->parent
                    ? $comment->parent->name
                    : null,

                'source_name' => $comment->episode_id
                    ? ($comment->series->name ?? '') . ' - Eps ' . ($comment->episode->episode_number ?? '')
                    : ($comment->series->name ?? 'Unknown'),
            ];
        });

        return response()->json([
            'status' => 'success',
            'data' => $formattedComments
        ]);
    }
}
