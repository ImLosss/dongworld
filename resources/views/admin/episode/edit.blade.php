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
@endsection
