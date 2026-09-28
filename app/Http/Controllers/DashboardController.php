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

        // Daftar server untuk filter tabel episode tanpa server
        $servers = Server::orderBy('name')->get();

        return view('admin.dashboard', compact(
            'stats',
            'todayStats',
            'episodesWithoutServerCount',
            'chart',
            'servers'
        ));
    }

    /**
     * DataTable: rentang episode yang belum memiliki server/link.
     */
    public function episodesWithoutServerDatatable(Request $request)
    {
        $serverIds = collect($request->input('server_ids', []))
            ->filter(fn ($id) => is_numeric($id) && (int) $id > 0)
            ->map(fn ($id) => (int) $id)
            ->unique()
            ->values();

        if ($serverIds->isEmpty() && $request->filled('server_id')) {
            $serverIds = collect([$request->integer('server_id')]);
        }

        $search = trim((string) $request->input('search.value', ''));

        $query = Episode::with('series')
            ->whereDoesntHave('links', function ($q) use ($serverIds) {
                if ($serverIds->isNotEmpty()) {
                    $q->whereIn('server_id', $serverIds->all());
                }
            });

        if ($search !== '') {
            $query->whereHas('series', function ($q) use ($search) {
                $q->where('name', 'like', '%' . $search . '%');
            });
        }

        $episodes = $query->get()
            ->sortBy([
                ['series.name', 'asc'],
                ['episode_number', 'asc'],
            ]);

        $rows = collect();

        foreach ($episodes->groupBy('series_id') as $seriesEpisodes) {
            $firstEpisode = $seriesEpisodes->first();
            $series = $firstEpisode?->series;

            if (!$series) {
                continue;
            }

            $sortedEpisodes = $seriesEpisodes->sortBy('episode_number')->values();
            $rangeStart = null;
            $rangeEnd = null;
            $rangeFirstEpisode = null;

            foreach ($sortedEpisodes as $episode) {
                $episodeNumber = $episode->episode_number;

                if (!is_numeric($episodeNumber)) {
                    $rows->push([
                        'series_id' => $series->id,
                        'series' => e($series->name),
                        'episode' => e($series->type === 'movie' ? $series->name . ' (Movie)' : '-'),
                        'created_at' => optional($episode->created_at)->format('d M Y H:i'),
                        'action_episode_id' => $episode->id,
                        'cmd' => '',
                    ]);
                    continue;
                }

                $episodeNumber = (float) $episodeNumber;

                if ($rangeStart === null) {
                    $rangeStart = $episodeNumber;
                    $rangeEnd = $episodeNumber;
                    $rangeFirstEpisode = $episode;
                    continue;
                }

                if ($episodeNumber === $rangeEnd + 1) {
                    $rangeEnd = $episodeNumber;
                    continue;
                }

                $rows->push($this->makeMissingEpisodeRangeRow(
                    $series,
                    $rangeStart,
                    $rangeEnd,
                    $rangeFirstEpisode
                ));

                $rangeStart = $episodeNumber;
                $rangeEnd = $episodeNumber;
                $rangeFirstEpisode = $episode;
            }

            if ($rangeStart !== null) {
                $rows->push($this->makeMissingEpisodeRangeRow(
                    $series,
                    $rangeStart,
                    $rangeEnd,
                    $rangeFirstEpisode
                ));
            }
        }

        return DataTables::of($rows->values())
            ->addIndexColumn()
            ->addColumn('action', function (array $row) {
                return '<a href="' . route('episode.edit', [$row['series_id'], $row['action_episode_id']]) . '" class="me-2" data-bs-toggle="tooltip" title="Tambah Server">'
                    . '<i class="fa-solid fa-circle-plus text-success"></i>'
                    . '</a>';
            })
            ->addColumn('cmd', function (array $row) {
                if ($row['cmd'] === '') {
                    return '-';
                }

                $command = e($row['cmd']);

                return '<button type="button" class="btn btn-link btn-sm p-0 copy-command" data-command="' . $command . '" title="Salin command">'
                    . '<code>' . $command . '</code> '
                    . '<i class="fa-regular fa-copy text-primary"></i>'
                    . '</button>';
            })
            ->rawColumns(['action', 'cmd'])
            ->toJson();
    }

    private function makeMissingEpisodeRangeRow(Series $series, float $start, float $end, Episode $episode): array
    {
        $formatNumber = static fn (float $number): string =>
            fmod($number, 1.0) === 0.0 ? (string) (int) $number : (string) $number;

        $startLabel = $formatNumber($start);
        $endLabel = $formatNumber($end);

        return [
            'series_id' => $series->id,
            'series' => e($series->name),
            'episode' => $start === $end ? $startLabel : $startLabel . '-' . $endLabel,
            'created_at' => optional($episode->created_at)->format('d M Y H:i'),
            'action_episode_id' => $episode->id,
            'cmd' => '/reupload ' . $series->id . ' ' . $startLabel . ' ' . $endLabel,
        ];
    }
}
