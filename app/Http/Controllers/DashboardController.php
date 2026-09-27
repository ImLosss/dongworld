<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Episode;
use App\Models\Series;
use App\Models\Server;
use App\Models\User;
use App\Models\View;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class DashboardController extends Controller
{
    public function index()
    {
        $today = now()->toDateString();

        $stats = [
            'total_series'   => Series::count(),
            'total_episodes' => Episode::count(),
            'total_servers'  => Server::count(),
            'total_views'    => (int) View::sum('views'),
            'total_comments' => Comment::count(),
            'total_staff'    => User::count(),
        ];

        // Statistik hari ini
        $todayStats = [
            'views'    => (int) View::whereDate('created_at', $today)->sum('views'),
            'comments' => Comment::whereDate('created_at', $today)->count(),
        ];

        // Episode yang belum punya server/link sama sekali
        $episodesWithoutServerCount = Episode::whereDoesntHave('links')->count();

        // Data grafik 7 hari terakhir
        $startDate = now()->subDays(6)->startOfDay();

        $viewsPerDay = View::selectRaw('DATE(created_at) as date, SUM(views) as total')
            ->where('created_at', '>=', $startDate)
            ->groupBy('date')
            ->pluck('total', 'date');

        $episodesPerDay = Episode::selectRaw('DATE(created_at) as date, COUNT(*) as total')
            ->where('created_at', '>=', $startDate)
            ->groupBy('date')
            ->pluck('total', 'date');

        $commentsPerDay = Comment::selectRaw('DATE(created_at) as date, COUNT(*) as total')
            ->where('created_at', '>=', $startDate)
            ->groupBy('date')
            ->pluck('total', 'date');

        $chartLabels = [];
        $chartViews = [];
        $chartEpisodes = [];
        $chartComments = [];

        foreach (range(6, 0) as $i) {
            $date = now()->subDays($i);
            $key = $date->toDateString();

            $chartLabels[]   = $date->translatedFormat('d M');
            $chartViews[]    = (int) ($viewsPerDay[$key] ?? 0);
            $chartEpisodes[] = (int) ($episodesPerDay[$key] ?? 0);
            $chartComments[] = (int) ($commentsPerDay[$key] ?? 0);
        }

        $chart = [
            'labels'   => $chartLabels,
            'views'    => $chartViews,
            'episodes' => $chartEpisodes,
            'comments' => $chartComments,
        ];

        return view('admin.dashboard', compact(
            'stats',
            'todayStats',
            'episodesWithoutServerCount',
            'chart'
        ));
    }

    /**
     * DataTable: episode yang belum memiliki server/link sama sekali.
     */
    public function episodesWithoutServerDatatable(Request $request)
    {
        $query = Episode::with('series')
            ->whereDoesntHave('links')
            ->orderByDesc('created_at');

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('series', fn (Episode $e) => e(optional($e->series)->name ?? '-'))
            ->addColumn('episode', function (Episode $e) {
                if (optional($e->series)->type === 'movie') {
                    return e(optional($e->series)->name . ' (Movie)');
                }

                return e($e->episode_number ?? '-');
            })
            ->addColumn('created_at', fn (Episode $e) => optional($e->created_at)->format('d M Y H:i'))
            ->addColumn('action', function (Episode $e) {
                if (!$e->series) {
                    return '-';
                }

                return '<a href="' . route('episode.edit', [$e->series->id, $e->id]) . '" class="me-2" data-bs-toggle="tooltip" title="Tambah Server">'
                    . '<i class="fa-solid fa-circle-plus text-success"></i>'
                    . '</a>';
            })
            ->rawColumns(['action'])
            ->toJson();
    }
}
