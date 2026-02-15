@extends('layouts.admin-layout')

@section('title')
    - Episodes
@endsection

@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('home') }}">Home</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('series.index') }}">Series</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Episodes</li>
        </ol>
    <h5 class="font-weight-bolder mb-0">Episodes - {{ $series->name }}</h5>
    </nav>
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="card mb-1 p-3">
            <div class="card-header pb-3">
                <div class="row">
                    <div class="col d-flex align-items-center">
                        <h6>All Episodes</h6>
                    </div>
                    <div class="col">
                        <div class="d-flex justify-content-end flex-wrap">
                            @can('episodeAdd')
                                <a class="btn bg-gradient-dark mb-0" href="{{ route('episode.create', $series->id) }}">
                                    <i class="fas fa-plus"></i>&nbsp;&nbsp;Tambah Episode
                                </a>
                            @endcan
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-3">
                    <table id="episodesTable" class="table align-items-center mb-0 w-100">
                        <thead>
                            <tr>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Episode</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Server</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Dibuat</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Link Episode</th>
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
    $('#episodesTable').DataTable({
            processing: true,
            serverSide: true,
            ordering: false,
            pageLength: 50,
            ajax: {
        url: "{{ route('episode.datatable', $series->id) }}",
                type: 'GET'
            },
            columns: [
                { data: 'episode', name: 'episode', className: 'text-sm' },
                { data: 'server', name: 'server', className: 'text-sm', orderable: false, searchable: false },
                { data: 'created_at', name: 'created_at', className: 'text-sm' },
                { data: 'link', name: 'link', className: 'text-sm', orderable: false, searchable: false },
                { data: 'action', name: 'action', orderable: false, searchable: false, className: 'text-sm' },
            ],
            language: {
        emptyTable: 'Belum ada Episode'
            },
            headerCallback: function(thead) {
                $(thead).find('th').css('text-align', 'left');
            },
        });
    });

    $(document).on('click', '.js-delete-server-link', function (e) {
        e.preventDefault();

        const $el = $(this);
        const linkId = $el.data('link-id');

        $.ajax({
            url: "{{ url('links') }}/" + linkId,
            type: 'DELETE',
            data: {
                _token: '{{ csrf_token() }}'
            },
            success: function (response) {
                if (response.success) {
                    Swal.fire({
                        text: response.message,
                        icon: response.alert,
                        timer: 1500,
                        showConfirmButton: false,
                        timerProgressBar: true
                    })
                    $('#episodesTable').DataTable().ajax.reload(null, false);
                } else {
                    Swal.fire({
                        text: 'Gagal menghapus link server.',
                        icon: 'error',
                        timer: 1500,
                        showConfirmButton: false,
                        timerProgressBar: true
                    })
                }
            },
            error: function () {
                Swal.fire({
                    text: 'Terjadi kesalahan saat menghapus link server.',
                    icon: 'error',
                    timer: 1500,
                    showConfirmButton: false,
                    timerProgressBar: true
                })
            }
        });
    })
</script>

<style>
  /* Perbesar area klik tanpa membesarkan icon */
  .episode-dropdown-toggle{
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 34px;          /* hit area */
    height: 34px;         /* hit area */
    padding: 8px;         /* hit area */
    border-radius: 8px;
    line-height: 1;
  }
  .episode-dropdown-toggle:hover,
  .episode-dropdown-toggle:focus{
    background: rgba(0,0,0,.06);
    outline: none;
  }

  /* Lebar dropdown mengikuti konten (override Bootstrap min-width: 10rem) */
  .episode-dropdown-menu{
    min-width: unset !important;
    width: max-content;
    white-space: nowrap;
  }
</style>
@endsection
