@extends('layouts.admin-layout')

@section('title')
    - Edit Genre
@endsection

@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('home') }}">Home</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('genre.index') }}">Genre</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Edit Genre</li>
        </ol>
        <h5 class="font-weight-bolder mb-0">Genre</h5>
    </nav>
@endsection

@section('content')
<div class="card">
    <div class="card-header pb-0 px-3">
        <h5 class="mb-0">{{ __('Edit Genre') }}</h5>
    </div>
    <div class="card-body pt-4 p-3">
        <form action="{{ route('genre.update', $genre->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="name" class="form-control-label">{{ __('Nama Genre') }}</label>
                        <input class="form-control @error('name') border border-danger rounded-3 @enderror" type="text" placeholder="Nama Genre" name="name" value="{{ old('name', $genre->name) }}" autofocus>
                        @error('name')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-end">
                <button type="submit" class="btn bg-gradient-dark btn-md mt-4 mb-4">{{ 'Simpan' }}</button>
            </div>
    </div>
</div>
@endsection

@section('script')
@endsection
