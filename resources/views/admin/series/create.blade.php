@extends('layouts.admin-layout')

@section('title')
    - Add Series
@endsection

@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('home') }}">Home</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('series.index') }}">Series</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Add</li>
        </ol>
        <h5 class="font-weight-bolder mb-0">Series</h5>
    </nav>
@endsection

@section('content')
<div class="card">
    <div class="card-header pb-0 px-3">
    <h5 class="mb-0">Add Series</h5>
    </div>
    <div class="card-body pt-4 p-3">
        <form action="{{ route('series.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="name" class="form-control-label">Nama</label>
                        <input class="form-control @error('name') border border-danger rounded-3 @enderror" type="text" placeholder="Nama Series" name="name" value="{{ old('name') }}" autofocus>
                        @error('name')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="genres" class="form-control-label">Genres</label>
                        <select name="genres[]" id="genres" class="form-control select2 @error('genres') border border-danger rounded-3 @enderror" multiple>
                            @foreach($genres as $g)
                                <option value="{{ $g->id }}" {{ collect(old('genres', []))->contains($g->id) ? 'selected' : '' }}>{{ $g->name }}</option>
                            @endforeach
                        </select>
                        @error('genres')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="slug" class="form-control-label">Slug</label>
                        <input class="form-control @error('slug') border border-danger rounded-3 @enderror" type="text" placeholder="slug-series" name="slug" value="{{ old('slug') }}">
                        @error('slug')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="type" class="form-control-label">Tipe</label>
                        <select name="type" class="form-control @error('type') border border-danger rounded-3 @enderror">
                            <option value="episodes" {{ old('type') == 'episodes' ? 'selected' : '' }}>Episodes</option>
                            <option value="movie" {{ old('type') == 'movie' ? 'selected' : '' }}>Movie</option>
                        </select>
                        @error('type')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="duration" class="form-control-label">Duration</label>
                        <input class="form-control @error('duration') border border-danger rounded-3 @enderror" type="number" placeholder="Duration in minutes" name="duration" value="{{ old('duration') }}">
                        @error('duration')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="studios" class="form-control-label">Studios</label>
                        <input class="form-control @error('studios') border border-danger rounded-3 @enderror" type="text" placeholder="Studios" name="studios" value="{{ old('studios') }}">
                        @error('studios')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="rating" class="form-control-label">Rating</label>
                        <input class="form-control @error('rating') border border-danger rounded-3 @enderror" type="number" step="0.1" min="0" max="10" placeholder="7.5" name="rating" value="{{ old('rating') }}">
                        @error('rating')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="thumbnail" class="form-control-label">Thumbnail</label>
                        <input id="thumbnailInput" class="form-control @error('thumbnail') border border-danger rounded-3 @enderror" type="file" accept="image/*" name="thumbnail">
                        @error('thumbnail')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="release_date" class="form-control-label">Tanggal Rilis</label>
                        <input class="form-control @error('release_date') border border-danger rounded-3 @enderror" type="date" placeholder="2025-08-01" name="release_date" value="{{ old('release_date') }}">
                        @error('release_date')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="total_episodes" class="form-control-label">Total Episode</label>
                        <input class="form-control @error('total_episodes') border border-danger rounded-3 @enderror" type="text" placeholder="12" name="total_episodes" value="{{ old('total_episodes') }}">
                        @error('total_episodes')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="form-group has-validation">
                        <label for="synopsis" class="form-control-label">Sinopsis</label>
                        <textarea class="form-control @error('synopsis') border border-danger rounded-3 @enderror" name="synopsis" rows="3" placeholder="Sinopsis">{{ old('synopsis') }}</textarea>
                        @error('synopsis')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-end">
                <button type="submit" class="btn bg-gradient-dark btn-md mt-4 mb-4">{{ 'Simpan' }}</button>
            </div>
        </form>
    </div>
</div>
@endsection

@section('script')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // initialize select2 for genres
        if (window.$ && $('#genres').length) {
            $('#genres').select2({
                width: '100%',
                placeholder: '- Pilih Genre -'
            });
        }

        // auto-generate slug from name
        const nameInput = document.querySelector('input[name="name"]');
        const slugInput = document.querySelector('input[name="slug"]');
        function slugify(text){
            return text
                .toString()
                .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
                .toLowerCase()
                .replace(/[^a-z0-9\s-]/g, '')
                .trim()
                .replace(/[\s-]+/g, '-')
                .replace(/^-+|-+$/g, '');
        }
        if (nameInput && slugInput) {
            nameInput.addEventListener('input', function(){
                if (!slugInput.value || slugInput.value === slugify(slugInput.value)) {
                    slugInput.value = slugify(nameInput.value);
                }
            });
        }

        // preview selected thumbnail
        const thumbInput = document.getElementById('thumbnailInput');
        if (thumbInput) {
            thumbInput.addEventListener('change', function (e) {
                const file = e.target.files && e.target.files[0];
                if (!file) return;
                const url = URL.createObjectURL(file);
                let prev = document.getElementById('thumbPreview');
                if (!prev) {
                    prev = document.createElement('img');
                    prev.id = 'thumbPreview';
                    prev.style.height = '60px';
                    prev.style.width = 'auto';
                    prev.style.borderRadius = '6px';
                    prev.style.objectFit = 'cover';
                    thumbInput.parentElement.appendChild(prev);
                }
                prev.src = url;
            });
        }
    });
</script>
@endsection
