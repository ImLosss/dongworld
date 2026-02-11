@extends('layouts.admin-layout')

@section('title')
    - Edit Episode
@endsection

@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('home') }}">Home</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('series.index') }}">Series</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('episode.index', $series->id) }}">Episodes</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Edit Episode</li>
        </ol>
        <h5 class="font-weight-bolder mb-0">Episodes - {{ $series->name }}</h5>
    </nav>
@endsection

@section('content')
<div class="card">
    <div class="card-header pb-0 px-3">
        <h5 class="mb-0">Edit Episode</h5>
    </div>
    <div class="card-body pt-4 p-3">
        <form action="{{ route('episode.update', [$series->id, $episode->id]) }}" method="POST">
            @csrf
            @method('PUT')
            @if($series->type !== 'movie')
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="episode_number" class="form-control-label">Episode Number</label>
                        <input class="form-control @error('episode_number') border border-danger rounded-3 @enderror" type="number" min="1" placeholder="1" name="episode_number" value="{{ old('episode_number', $episode->episode_number) }}" autofocus>
                        @error('episode_number')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
            </div>
            @endif

            @php
                $oldDownloads = old('downloads');
                if (!is_array($oldDownloads) || count($oldDownloads) === 0) {
                    $oldDownloads = $downloads->map(function ($row) {
                        return [
                            'link' => $row->link,
                            'quality' => $row->quality,
                            'server' => $row->server,
                        ];
                    })->toArray();
                }
                if (!is_array($oldDownloads) || count($oldDownloads) === 0) {
                    $oldDownloads = [['link' => '', 'quality' => '', 'server' => '']];
                }
            @endphp

            <div class="row">
                <div class="col-12">
                    <label class="form-control-label">Download Links (Server & Resolusi)</label>
                </div>
                <div class="col-12" id="downloads-container">
                    @foreach($oldDownloads as $i => $row)
                    <div class="row align-items-end download-row" data-index="{{ $i }}">
                        <div class="col-md-6">
                            <div class="form-group has-validation">
                                <label class="form-control-label">Link</label>
                                <input class="form-control" type="text" name="downloads[{{ $i }}][link]" placeholder="https://..." value="{{ $row['link'] ?? '' }}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group has-validation">
                                <label class="form-control-label">Resolusi</label>
                                <input class="form-control" type="text" name="downloads[{{ $i }}][quality]" placeholder="1080P" value="{{ $row['quality'] ?? '' }}">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group has-validation">
                                <label class="form-control-label">Server</label>
                                <input class="form-control" type="text" name="downloads[{{ $i }}][server]" placeholder="drive" value="{{ $row['server'] ?? '' }}">
                            </div>
                        </div>
                        <div class="col-md-1 text-end">
                            <button type="button" class="btn btn-outline-danger btn-sm remove-download" title="Hapus">
                                <i class="fa-solid fa-minus"></i>
                            </button>
                        </div>
                    </div>
                    @endforeach
                </div>
                <div class="col-12 mt-2">
                    <button type="button" id="add-download" class="btn btn-outline-dark btn-sm">
                        <i class="fa-solid fa-plus"></i> Tambah Link
                    </button>
                    @error('downloads')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                    @enderror
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <label class="form-control-label">Links per Server (opsional)</label>
                </div>
                @foreach($servers as $srv)
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="links[{{ $srv->id }}]" class="form-control-label">{{ $srv->name }}</label>
                        <input class="form-control" type="text" name="links[{{ $srv->id }}]" placeholder="https://..." value="{{ old('links.'.$srv->id, optional($links->get($srv->id))->url) }}">
                    </div>
                </div>
                @endforeach
            </div>

            <div class="d-flex justify-content-end">
                <button type="submit" class="btn bg-gradient-dark btn-md mt-4 mb-4">Simpan</button>
            </div>
        </form>
    </div>
</div>
@endsection

@section('script')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const container = document.getElementById('downloads-container');
        const addBtn = document.getElementById('add-download');

        function nextIndex() {
            const rows = container.querySelectorAll('.download-row');
            if (!rows.length) return 0;
            const last = rows[rows.length - 1];
            return Number(last.getAttribute('data-index')) + 1;
        }

        function buildRow(index) {
            const row = document.createElement('div');
            row.className = 'row align-items-end download-row';
            row.setAttribute('data-index', String(index));
            row.innerHTML = `
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label class="form-control-label">Link</label>
                        <input class="form-control" type="text" name="downloads[${index}][link]" placeholder="https://..." value="">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group has-validation">
                        <label class="form-control-label">Resolusi</label>
                        <input class="form-control" type="text" name="downloads[${index}][quality]" placeholder="1080P" value="">
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group has-validation">
                        <label class="form-control-label">Server</label>
                        <input class="form-control" type="text" name="downloads[${index}][server]" placeholder="drive" value="">
                    </div>
                </div>
                <div class="col-md-1 text-end">
                    <button type="button" class="btn btn-outline-danger btn-sm remove-download" title="Hapus">
                        <i class="fa-solid fa-minus"></i>
                    </button>
                </div>
            `;
            return row;
        }

        function ensureAtLeastOne() {
            const rows = container.querySelectorAll('.download-row');
            if (!rows.length) {
                container.appendChild(buildRow(0));
            }
        }

        addBtn.addEventListener('click', function () {
            const idx = nextIndex();
            container.appendChild(buildRow(idx));
        });

        container.addEventListener('click', function (e) {
            const btn = e.target.closest('.remove-download');
            if (!btn) return;
            const row = btn.closest('.download-row');
            if (row) row.remove();
            ensureAtLeastOne();
        });

        ensureAtLeastOne();
    });
</script>
@endsection
