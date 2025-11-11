@extends('layouts.admin-layout')

@section('title')
    - Series
@endsection

@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('home') }}">Home</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Series</li>
        </ol>
        <h5 class="font-weight-bolder mb-0">Series</h5>
    </nav>
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="card mb-1 p-3">
            <div class="card-header pb-3">
                <div class="row">
                    <div class="col d-flex align-items-center">
                        <h6>All Series</h6>
                    </div>
                    <div class="col">
                        <div class="d-flex justify-content-end flex-wrap">
                            @can('seriesAdd')
                                <a class="btn bg-gradient-dark mb-0" href="{{ route('series.create') }}">
                                    <i class="fas fa-plus"></i>&nbsp;&nbsp;Tambah Series
                                </a>
                            @endcan
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-3">
            <table id="seriesTable" class="table align-items-center mb-0 w-100">
                        <thead>
                            <tr>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">#</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Thumbnail</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Nama</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Tipe</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Rating</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Total</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Rilis</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Genres</th>
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
    $('#seriesTable').DataTable({
            processing: true,
            serverSide: true,
            ordering: false,
            ajax: {
        url: "{{ route('series.datatable') }}",
                type: 'GET'
            },
            columns: [
                { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false, className: 'text-sm' },
                { data: 'thumbnail', name: 'thumbnail', orderable: false, searchable: false, className: 'text-sm' },
                { data: 'name', name: 'name', className: 'text-sm' },
                { data: 'type', name: 'type', className: 'text-sm' },
                { data: 'rating', name: 'rating', className: 'text-sm' },
                { data: 'total_episodes', name: 'total_episodes', className: 'text-sm' },
                { data: 'release_date', name: 'release_date', className: 'text-sm' },
                { data: 'genres', name: 'genres', className: 'text-sm', orderable: false, searchable: false },
                { data: 'action', name: 'action', orderable: false, searchable: false, className: 'text-sm' },
            ],
            language: {
        emptyTable: 'Belum ada Series'
            },
            headerCallback: function(thead) {
                $(thead).find('th').css('text-align', 'left');
            },
        });
    });
</script>
@endsection
