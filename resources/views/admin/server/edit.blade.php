@extends('layouts.admin-layout')

@section('title')
    - Edit Server
@endsection

@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('home') }}">Home</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('server.index') }}">Server</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Edit Server</li>
        </ol>
    <h5 class="font-weight-bolder mb-0">Server</h5>
    </nav>
@endsection

@section('content')
<div class="card">
    <div class="card-header pb-0 px-3">
    <h5 class="mb-0">Edit Server</h5>
    </div>
    <div class="card-body pt-4 p-3">
    <form action="{{ route('server.update', $server->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="name" class="form-control-label">Nama Server</label>
                        <input class="form-control @error('name') border border-danger rounded-3 @enderror" type="text" placeholder="Nama Server" name="name" value="{{ old('name', $server->name) }}" autofocus>
                        @error('name')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="note" class="form-control-label">Note</label>
                        <input class="form-control @error('note') border border-danger rounded-3 @enderror" type="text" placeholder="Note" name="note" value="{{ old('note', $server->note) }}" autofocus>
                        @error('note')
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
