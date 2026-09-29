@extends('layouts.admin-layout')
@section('title')
    - Dashboard
@endsection
@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark"
                    @role('admin')href="{{ route('home') }}"@endrole>Home</a></li>
        </ol>
        <h5 class="font-weight-bolder mb-0">Dashboard</h5>
    </nav>
@endsection
@section('content')
    <div class="row">
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold">Total Series</p>
                                <h5 class="font-weight-bolder mb-0">
                                    {{ number_format($stats['total_series'], 0, ',', '.') }}
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                                <i class="fa-solid fa-film text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold">Total Episode</p>
                                <h5 class="font-weight-bolder mb-0">
                                    {{ number_format($stats['total_episodes'], 0, ',', '.') }}
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-info shadow text-center border-radius-md">
                                <i class="fa-solid fa-clapperboard text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold">Total Views</p>
                                <h5 class="font-weight-bolder mb-0">
                                    {{ number_format($stats['total_views'], 0, ',', '.') }}
                                    <span class="text-success text-sm font-weight-bolder">+{{ number_format($todayStats['views'], 0, ',', '.') }}</span>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-success shadow text-center border-radius-md">
                                <i class="fa-solid fa-eye text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold">Total Komentar</p>
                                <h5 class="font-weight-bolder mb-0">
                                    {{ number_format($stats['total_comments'], 0, ',', '.') }}
                                    <span class="text-success text-sm font-weight-bolder">+{{ number_format($todayStats['comments'], 0, ',', '.') }}</span>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-warning shadow text-center border-radius-md">
                                <i class="fa-solid fa-comments text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold">Total Server</p>
                                <h5 class="font-weight-bolder mb-0">
                                    {{ number_format($stats['total_servers'], 0, ',', '.') }}
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-dark shadow text-center border-radius-md">
                                <i class="fa-solid fa-server text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold">Staff</p>
                                <h5 class="font-weight-bolder mb-0">
                                    {{ number_format($stats['total_staff'], 0, ',', '.') }}
                                </h5>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-primary shadow text-center border-radius-md">
                                <i class="fa-solid fa-users text-lg opacity-10"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-6 col-sm-12 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-body p-3">
                    <div class="row align-items-center">
                        <div class="col-8">
                            <div class="numbers">
                                <p class="text-sm mb-0 text-capitalize font-weight-bold">Episode Tanpa Server</p>
                                <h5 class="font-weight-bolder mb-0">
                                    {{ number_format($episodesWithoutServerCount, 0, ',', '.') }}
                                </h5>
                                <p class="text-xs text-secondary mb-0">Episode yang belum memiliki link server sama sekali</p>
                            </div>
                        </div>
                        <div class="col-4 text-end">
                            <div class="icon icon-shape bg-gradient-danger shadow text-center border-radius-md">
                                <i class="fa-solid fa-triangle-exclamation text-lg opacity-10" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-xl-8 col-sm-12 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-header pb-0 p-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 id="viewsTrendTitle" class="mb-0">Views {{ $trend['periodLabel'] }}</h6>
                        <select id="trendPeriod" class="form-control form-control-sm w-auto ms-3">
                            <option value="7" selected>7 Hari</option>
                            <option value="30">1 Bulan</option>
                        </select>
                    </div>
                </div>
                <div class="card-body p-3">
                    <div class="chart">
                        <canvas id="chartViews" class="chart-canvas" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-sm-12 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-header pb-0 p-3">
                    <h6 id="contentTrendTitle" class="mb-0">Episode &amp; Komentar {{ $trend['periodLabel'] }}</h6>
                </div>
                <div class="card-body p-3">
                    <div class="chart">
                        <canvas id="chartContent" class="chart-canvas" height="300"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-xl-6 col-sm-12 mb-xl-0 mb-4">
            <div class="card h-100">
                <div class="card-header pb-0 p-3">
                    <h6 id="popularEpisodesTitle" class="mb-0">Episode Terpopuler {{ $trend['periodLabel'] }}</h6>
                </div>
                <div class="card-body p-3">
                    <div id="popularEpisodesList">
                        @forelse($trend['popularEpisodes'] as $popularEpisode)
                            <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
                                <div class="me-3">
                                    <p class="text-sm font-weight-bold mb-0">{{ $popularEpisode['series'] }}</p>
                                    <span class="text-xs text-secondary">Episode {{ $popularEpisode['episode'] }}</span>
                                </div>
                                <span class="text-sm font-weight-bolder text-success text-nowrap">
                                    {{ number_format($popularEpisode['views'], 0, ',', '.') }} views
                                </span>
                            </div>
                        @empty
                            <p class="text-sm text-secondary mb-0">Belum ada data episode.</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-6 col-sm-12 mb-xl-0 mb-4">
            <div class="card h-100">
                <div class="card-header pb-0 p-3">
                    <h6 id="popularSeriesTitle" class="mb-0">Series Terpopuler {{ $trend['periodLabel'] }}</h6>
                </div>
                <div class="card-body p-3">
                    <div id="popularSeriesList">
                        @forelse($trend['popularSeries'] as $popular)
                            <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
                                <p class="text-sm font-weight-bold mb-0 me-3">{{ $popular['series'] }}</p>
                                <span class="text-sm font-weight-bolder text-success text-nowrap">
                                    {{ number_format($popular['views'], 0, ',', '.') }} views
                                </span>
                            </div>
                        @empty
                            <p class="text-sm text-secondary mb-0">Belum ada data series.</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-12">
            <div class="card mb-1 p-3">
                <div class="card-header pb-3">
                    <div class="row">
                        <div class="col d-flex align-items-center">
                            <h6 class="mb-0">Episode Belum Ada Server</h6>
                        </div>
                        <div class="col-auto">
                            <div class="dropdown">
                                <button id="serverFilterToggle" type="button"
                                    class="btn btn-outline-secondary btn-sm dropdown-toggle mb-0"
                                    data-bs-toggle="dropdown" data-bs-auto-close="outside"
                                    aria-expanded="false">
                                    All Server
                                </button>
                                <div id="serverFilterMenu" class="dropdown-menu dropdown-menu-end p-2"
                                    style="min-width: 230px; max-height: 280px; overflow-y: auto;">
                                    <button id="clearServerFilter" type="button" class="dropdown-item rounded px-2 mb-1">
                                        All Server
                                    </button>
                                    <div class="dropdown-divider"></div>
                                @foreach($servers as $srv)
                                    <label class="dropdown-item rounded px-2 d-flex align-items-center gap-2 mb-1">
                                        <input class="form-check-input server-filter-option mt-0" type="checkbox"
                                            value="{{ $srv->id }}" data-server-name="{{ $srv->name }}">
                                        <span class="text-sm">{{ $srv->name }}</span>
                                    </label>
                                @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body px-0 pt-0 pb-2">
                    <div class="table-responsive p-3">
                        <table id="episodesWithoutServerTable" class="table align-items-center mb-0 w-100">
                            <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">#</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Series</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Episode</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Dibuat</th>
                                    <th class="text-secondary text-xxs font-weight-bolder opacity-7 ps-1">cmd</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Aksi</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const trendData = @json($trend);

        // Line chart: views 7 hari terakhir
        const viewsCtx = document.getElementById('chartViews').getContext('2d');
        const gradientViews = viewsCtx.createLinearGradient(0, 0, 0, 300);
        gradientViews.addColorStop(0, 'rgba(203, 12, 159, 0.4)');
        gradientViews.addColorStop(1, 'rgba(203, 12, 159, 0.0)');

        const viewsChart = new Chart(viewsCtx, {
            type: 'line',
            data: {
                labels: trendData.chart.labels,
                datasets: [{
                    label: 'Views',
                    data: trendData.chart.views,
                    borderColor: '#cb0c9f',
                    backgroundColor: gradientViews,
                    borderWidth: 2,
                    fill: true,
                    tension: 0.4,
                    pointRadius: 3,
                    pointBackgroundColor: '#cb0c9f',
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: { precision: 0 }
                    }
                }
            }
        });

        // Bar chart: episode & komentar 7 hari terakhir
        const contentCtx = document.getElementById('chartContent').getContext('2d');
        const contentChart = new Chart(contentCtx, {
            type: 'bar',
            data: {
                labels: trendData.chart.labels,
                datasets: [
                    {
                        label: 'Episode',
                        data: trendData.chart.episodes,
                        backgroundColor: '#17c1e8',
                        borderRadius: 4,
                    },
                    {
                        label: 'Komentar',
                        data: trendData.chart.comments,
                        backgroundColor: '#f53939',
                        borderRadius: 4,
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'bottom' }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: { precision: 0 }
                    }
                }
            }
        });

        function escapeHtml(value) {
            return $('<div>').text(value).html();
        }

        function renderPopularEpisodes(items) {
            if (!items.length) {
                return '<p class="text-sm text-secondary mb-0">Belum ada data episode.</p>';
            }

            return items.map(function (item) {
                return '<div class="d-flex justify-content-between align-items-center py-2 border-bottom">'
                    + '<div class="me-3">'
                    + '<p class="text-sm font-weight-bold mb-0">' + escapeHtml(item.series) + '</p>'
                    + '<span class="text-xs text-secondary">Episode ' + escapeHtml(item.episode) + '</span>'
                    + '</div>'
                    + '<span class="text-sm font-weight-bolder text-success text-nowrap">'
                    + Number(item.views).toLocaleString('id-ID') + ' views'
                    + '</span></div>';
            }).join('');
        }

        function renderPopularSeries(items) {
            if (!items.length) {
                return '<p class="text-sm text-secondary mb-0">Belum ada data series.</p>';
            }

            return items.map(function (item) {
                return '<div class="d-flex justify-content-between align-items-center py-2 border-bottom">'
                    + '<p class="text-sm font-weight-bold mb-0 me-3">' + escapeHtml(item.series) + '</p>'
                    + '<span class="text-sm font-weight-bolder text-success text-nowrap">'
                    + Number(item.views).toLocaleString('id-ID') + ' views'
                    + '</span></div>';
            }).join('');
        }

        function updateTrend(data) {
            viewsChart.data.labels = data.chart.labels;
            viewsChart.data.datasets[0].data = data.chart.views;
            viewsChart.update();

            contentChart.data.labels = data.chart.labels;
            contentChart.data.datasets[0].data = data.chart.episodes;
            contentChart.data.datasets[1].data = data.chart.comments;
            contentChart.update();

            $('#viewsTrendTitle').text('Views ' + data.periodLabel);
            $('#contentTrendTitle').text('Episode & Komentar ' + data.periodLabel);
            $('#popularEpisodesTitle').text('Episode Terpopuler ' + data.periodLabel);
            $('#popularSeriesTitle').text('Series Terpopuler ' + data.periodLabel);
            $('#popularEpisodesList').html(renderPopularEpisodes(data.popularEpisodes));
            $('#popularSeriesList').html(renderPopularSeries(data.popularSeries));
        }

        $('#trendPeriod').on('change', function () {
            const days = $(this).val();
            const url = "{{ route('dashboard.trend-data') }}?days=" + days;

            $('#trendPeriod').prop('disabled', true);
            fetch(url)
                .then(function (response) {
                    if (!response.ok) throw new Error('Gagal mengambil data tren');
                    return response.json();
                })
                .then(updateTrend)
                .catch(function (error) {
                    console.error(error);
                })
                .finally(function () {
                    $('#trendPeriod').prop('disabled', false);
                });
        });

        $('#episodesWithoutServerTable').DataTable({
            processing: true,
            serverSide: true,
            ordering: false,
            pageLength: 10,
            ajax: {
                url: "{{ route('dashboard.episodes-without-server.datatable') }}",
                type: 'GET',
                data: function (d) {
                    d.server_ids = getSelectedServerIds();
                }
            },
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false, className: 'text-sm' },
                { data: 'series', name: 'series', className: 'text-sm', orderable: false, searchable: true },
                { data: 'episode', name: 'episode', className: 'text-sm', orderable: false, searchable: false },
                { data: 'created_at', name: 'created_at', className: 'text-sm' },
                { data: 'cmd', name: 'cmd', orderable: false, searchable: false, className: 'text-sm' },
                { data: 'action', name: 'action', orderable: false, searchable: false, className: 'text-sm' },
            ],
            language: {
                search: '',
                searchPlaceholder: 'Cari judul series...',
                emptyTable: function () {
                    const serverNames = getSelectedServerNames().join(', ');
                    return getSelectedServerIds().length
                        ? 'Semua episode sudah memiliki server ' + serverNames
                        : 'Semua episode sudah memiliki server';
                }
            },
            headerCallback: function (thead) {
                $(thead).find('th').css('text-align', 'left');
            },
        });

        function getSelectedServerIds() {
            return $('.server-filter-option:checked').map(function () {
                return $(this).val();
            }).get();
        }

        function getSelectedServerNames() {
            return $('.server-filter-option:checked').map(function () {
                return $(this).data('server-name');
            }).get();
        }

        function updateServerFilterLabel() {
            const selectedCount = getSelectedServerIds().length;
            $('#serverFilterToggle').text(selectedCount ? selectedCount + ' Server Dipilih' : 'All Server');
        }

        // Filter tabel berdasarkan satu atau beberapa server
        $('.server-filter-option').on('change', function () {
            updateServerFilterLabel();
            $('#episodesWithoutServerTable').DataTable().ajax.reload();
        });

        $('#clearServerFilter').on('click', function () {
            $('.server-filter-option').prop('checked', false);
            updateServerFilterLabel();
            $('#episodesWithoutServerTable').DataTable().ajax.reload();
        });

        $(document).on('click', '.copy-command', async function () {
            const button = $(this);
            const command = button.data('command');

            try {
                await navigator.clipboard.writeText(command);
                button.find('i').removeClass('fa-copy').addClass('fa-check text-success');
                setTimeout(function () {
                    button.find('i').removeClass('fa-check text-success').addClass('fa-copy text-primary');
                }, 1200);
            } catch (error) {
                window.prompt('Salin command berikut:', command);
            }
        });
    });
</script>
@endsection
