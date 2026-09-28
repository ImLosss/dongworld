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
                    <h6 class="mb-0">Views 7 Hari Terakhir</h6>
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
                    <h6 class="mb-0">Episode &amp; Komentar 7 Hari Terakhir</h6>
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
        <div class="col-12">
            <div class="card mb-1 p-3">
                <div class="card-header pb-3">
                    <div class="row">
                        <div class="col d-flex align-items-center">
                            <h6 class="mb-0">Episode Belum Ada Server</h6>
                        </div>
                        <div class="col-auto">
                            <select id="serverFilter" class="form-control form-control-sm" multiple style="min-width: 200px; min-height: 74px;">
                                <option value="">All Server</option>
                                @foreach($servers as $srv)
                                    <option value="{{ $srv->id }}">{{ $srv->name }}</option>
                                @endforeach
                            </select>
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
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">cmd</th>
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
        const chartLabels = @json($chart['labels']);
        const chartViews = @json($chart['views']);
        const chartEpisodes = @json($chart['episodes']);
        const chartComments = @json($chart['comments']);

        // Line chart: views 7 hari terakhir
        const viewsCtx = document.getElementById('chartViews').getContext('2d');
        const gradientViews = viewsCtx.createLinearGradient(0, 0, 0, 300);
        gradientViews.addColorStop(0, 'rgba(203, 12, 159, 0.4)');
        gradientViews.addColorStop(1, 'rgba(203, 12, 159, 0.0)');

        new Chart(viewsCtx, {
            type: 'line',
            data: {
                labels: chartLabels,
                datasets: [{
                    label: 'Views',
                    data: chartViews,
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
        new Chart(contentCtx, {
            type: 'bar',
            data: {
                labels: chartLabels,
                datasets: [
                    {
                        label: 'Episode',
                        data: chartEpisodes,
                        backgroundColor: '#17c1e8',
                        borderRadius: 4,
                    },
                    {
                        label: 'Komentar',
                        data: chartComments,
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

        $('#episodesWithoutServerTable').DataTable({
            processing: true,
            serverSide: true,
            ordering: false,
            pageLength: 10,
            ajax: {
                url: "{{ route('dashboard.episodes-without-server.datatable') }}",
                type: 'GET',
                data: function (d) {
                    d.server_ids = $('#serverFilter').val() || [];
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
                    const serverNames = $('#serverFilter option:selected').map(function () {
                        return $(this).text();
                    }).get().join(', ');
                    return $('#serverFilter').val()?.length
                        ? 'Semua episode sudah memiliki server ' + serverNames
                        : 'Semua episode sudah memiliki server';
                }
            },
            headerCallback: function (thead) {
                $(thead).find('th').css('text-align', 'left');
            },
        });

        // Filter tabel berdasarkan server yang belum ada di episode
        $('#serverFilter').on('change', function () {
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
