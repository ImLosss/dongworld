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
                        <input class="form-control @error('name') border border-danger rounded-3 @enderror" type="text" placeholder="Nama Series" name="name" id="name" value="{{ old('name') }}" autofocus>
                        @error('name')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="slug" class="form-control-label">Slug</label>
                        <input class="form-control @error('slug') border border-danger rounded-3 @enderror" type="text" placeholder="slug-series" name="slug" value="{{ old('slug') }}">
                        @error('slug')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="type" class="form-control-label">Tipe</label>
                        <select name="type" class="form-control @error('type') border border-danger rounded-3 @enderror">
                            <option value="tv" {{ old('type') == 'tv' ? 'selected' : '' }}>TV</option>
                            <option value="ona" {{ old('type') == 'ona' ? 'selected' : '' }}>ONA</option>
                            <option value="movie" {{ old('type') == 'movie' ? 'selected' : '' }}>Movie</option>
                            <option value="special" {{ old('type') == 'special' ? 'selected' : '' }}>Special</option>
                            <option value="ova" {{ old('type') == 'ova' ? 'selected' : '' }}>OVA</option>
                            <option value="pv" {{ old('type') == 'pv' ? 'selected' : '' }}>PV</option>
                        </select>
                        @error('type')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="type" class="form-control-label">Status</label>
                        <select name="status" class="form-control @error('status') border border-danger rounded-3 @enderror">
                            <option value="ongoing" {{ old('status') == 'ongoing' ? 'selected' : '' }}>Ongoing</option>
                            <option value="complete" {{ old('status') == 'complete' ? 'selected' : '' }}>Complete</option>
                            <option value="dropped" {{ old('status') == 'dropped' ? 'selected' : '' }}>Dropped</option>
                        </select>
                        @error('status')
                        <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="genres" class="form-control-label">Genres</label>
                        <select name="genres[]" id="genres" class="form-control select2 @error('genres') border border-danger rounded-3 @enderror" multiple>
                            @foreach($genres as $g)
                                <option value="{{ $g->id }}" {{ collect(old('genres', []))->contains($g->id) ? 'selected' : '' }}>{{ $g->name }}</option>
                            @endforeach
                        </select>
                        @error('genres')
                            <p class="text-danger text-xs mt-2" id="genres-error">{{ $message }}</p>
                        @else
                            <p class="text-warning text-xs mt-2 d-none" id="genres-error"></p>
                        @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="total_episodes" class="form-control-label">Total Episode</label>
                        <input class="form-control @error('total_episodes') border border-danger rounded-3 @enderror" type="number" placeholder="12" name="total_episodes" value="{{ old('total_episodes') }}">
                        @error('total_episodes')
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
                        <label for="aliases" class="form-control-label">Aliases</label>
                        <input class="form-control @error('aliases') border border-danger rounded-3 @enderror" type="text" placeholder="Pisah dengan koma (;)" name="aliases" value="{{ old('aliases') }}" autofocus>
                        @error('aliases')
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
                        <label for="thumbnail" class="form-control-label">Thumbnail</label>
                        <input id="thumbnailInput" class="form-control @error('thumbnail') border border-danger rounded-3 @enderror" type="file" accept="image/*" name="thumbnail">
                        <input type="hidden" name="thumbnail_url" id="thumbnailUrl">
                        <div id="thumbPreviewWrapper" class="mt-2"></div>
                        @error('thumbnail')
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
                <button type="button" class="btn btn-primary btn-md mt-4 mb-4 me-2" data-toggle="modal" data-target="#exampleModal">{{ 'Get Data From MyAnimeList' }}</button>
                <button type="submit" class="btn bg-gradient-dark btn-md mt-4 mb-4">{{ 'Simpan' }}</button>
            </div>
        </form>
    </div>
</div>

<!-- Modal -->
<div class="modal fade modal-lg" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Get Data From MyAnimeList</h5>
        </div>
        <div class="modal-body">
            <div class="modal-search-bar">
                <input type="text" class="form-control" id="searchDonghua" placeholder="Type to Search Donghua/Anime">
            </div>
            <div id="searchLoading" class="text-center py-3 d-none">
                <div class="spinner-border text-primary" role="status">
                <span class="sr-only">Loading...</span>
                </div>
            </div>
            <div id="searchResults" class="mt-2"></div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
@endsection

@section('script')
<script>
    function parseDurationToMinutes(text) {
        if (!text) return '';
        const hoursMatch = text.match(/(\d+)\s*hr/);
        const minutesMatch = text.match(/(\d+)\s*min/);
        const hours = hoursMatch ? parseInt(hoursMatch[1], 10) : 0;
        const minutes = minutesMatch ? parseInt(minutesMatch[1], 10) : 0;
        return hours * 60 + minutes;
    }
    let searchTimeout;

    document.addEventListener('DOMContentLoaded', function () {
        $('#searchDonghua').on('input', function() {
            clearTimeout(searchTimeout);

            let query = $(this).val();

            if (query.length < 3) {
                $('#searchResults').empty();
                return;
            }

            // Tunggu 500ms setelah user berhenti mengetik
            searchTimeout = setTimeout(() => {
                $('#searchLoading').removeClass('d-none');
                let resultsContainer = $('#searchResults');
                resultsContainer.empty();

                $.ajax({
                    url: '{{ route('series.fetch-mal') }}',
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    data: {
                        _token: '{{ csrf_token() }}',
                        q: query
                    },
                    success: (res) => {
                        if (!res.data.length) {
                            resultsContainer.html(`
                            <div class="alert alert-warning mb-0">
                                Tidak ada hasil untuk "<strong>${query}</strong>".
                            </div>
                            `);
                            return;
                        }
                        res.data.forEach(item => {
                            let year = item.aired && item.aired.from ? new Date(item.aired.from).getFullYear() : 'N/A';
                            resultsContainer.append(`
                                <div class="card mb-2">
                                    <div class="card-body p-2">
                                        <div class="row align-items-center g-2">
                                            <div class="col-3 col-md-2">
                                                <img src="${item.images.webp.image_url}" alt="${item.title}" class="img-fluid rounded" style="width: 100%; height: auto; object-fit: cover;">
                                            </div>
                                            <div class="col-9 col-md-8">
                                                <h6 class="mb-1 text-sm" style="word-wrap: break-word;">${item.title}</h6>
                                                <div>
                                                    <span class="badge badge-sm bg-gradient-info">${item.status}</span>
                                                    <span class="badge badge-sm bg-gradient-secondary">${item.episodes} eps</span>
                                                    <span class="badge badge-sm bg-gradient-success">${year}</span>
                                                    <span class="badge badge-sm bg-gradient-warning">⭐ ${item.score}</span>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-2 text-md-end mt-2 mt-md-0">
                                                <button type="button" class="btn btn-sm btn-primary select-anime w-100 w-md-auto"
                                                        data-id="${item.mal_id}"
                                                        data-title="${item.title}"
                                                        data-episodes="${item.episodes}"
                                                        data-rating="${item.score}"
                                                        data-synopsis="${item.synopsis}"
                                                        data-aliases="${item.titles.map(t => t.title).join('; ')}"
                                                        data-thumbnail="${item.images.webp.image_url}"
                                                        data-studios="${item.studios.map(s => s.name).join(', ')}"
                                                        data-status="${item.status == "Finished Airing" ? "complete" : "ongoing"}"
                                                        data-type="${item.type}"
                                                        data-genres='${JSON.stringify(item.genres || []).replace(/"/g, '&quot;')}'
                                                        data-date="${item.aired.from}"
                                                        data-duration="${parseDurationToMinutes(item.duration)}">
                                                    Pilih
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            `);
                        });

                        $('.select-anime').on('click', function() {
                            let data = $(this).data();
                            const malGenres = Array.isArray(data.genres) ? data.genres.map(g => g.name.toLowerCase()) : [];

                            const matchedIds = [];
                            const availableNames = [];
                            $('#genres option').each(function () {
                                const optionName = $(this).text().trim().toLowerCase();
                                availableNames.push({ name: optionName, id: $(this).val() });
                                if (malGenres.includes(optionName)) {
                                    matchedIds.push($(this).val());
                                }
                            });

                            $('#genres').val(matchedIds).trigger('change');

                            const missing = malGenres.filter(name => !availableNames.some(opt => opt.name === name));
                            const genresError = $('#genres-error');
                            if (missing.length) {
                                genresError
                                    .removeClass('d-none')
                                    .text(`Genre berikut belum tersedia di sistem: ${missing.map(m => m.charAt(0).toUpperCase() + m.slice(1)).join(', ')}`);
                            } else {
                                genresError.addClass('d-none').text('');
                            }

                            // Isi form dengan data yang dipilih
                            $('input[name="name"]').val(data.title).trigger('input');
                            $('input[name="total_episodes"]').val(data.episodes);
                            $('input[name="rating"]').val(Number.parseFloat(data.rating ?? 0).toFixed(1));
                            $('textarea[name="synopsis"]').val(data.synopsis);
                            $('#thumbnailUrl').val(data.thumbnail);
                            $('input[name="studios"]').val(data.studios);
                            $('input[name="duration"]').val(data.duration);
                            $('input[name="aliases"]').val(data.aliases);
                            if (data.date) {
                                const releaseDate = new Date(data.date);
                                const year = releaseDate.getFullYear();
                                const month = String(releaseDate.getMonth() + 1).padStart(2, '0');
                                const day = String(releaseDate.getDate()).padStart(2, '0');
                                $('input[name="release_date"]').val(`${year}-${month}-${day}`);
                            }
                            $('select[name="status"]').val(data.status.toLowerCase());
                            $('select[name="type"]').val(data.type.toLowerCase());

                            $('#thumbPreviewWrapper').html(`
                                <img src="${data.thumbnail}" alt="${data.title}" style="height:80px;border-radius:6px;object-fit:cover;">
                            `);

                            $('#thumbPreview').remove();
                            $('#thumbnailInput').val('');

                            // Tutup modal
                            $('#exampleModal button[data-dismiss="modal"]').trigger('click');
                        });
                    },
                    error: (err) => {
                        $('#searchResults').html(`
                            <div class="alert alert-danger mb-0">
                            Terjadi kesalahan saat mengambil data. Silakan coba lagi nanti.
                            </div>
                        `);
                    },
                    complete: () => $('#searchLoading').addClass('d-none')
                });
            }, 500);
        });

        $('#name').on('input', function() {
            const nameVal = $(this).val();
            const slugVal = slugify(nameVal);
            $('input[name="slug"]').val(slugVal);
        });

        // initialize select2 for genres
        if (window.$ && $('#genres').length) {
            $('#genres').select2({
                width: '100%',
                placeholder: '- Pilih Genre -'
            });
        }

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

        // preview selected thumbnail
        const thumbInput = document.getElementById('thumbnailInput');
        if (thumbInput) {
            thumbInput.addEventListener('change', function (e) {
                $('#thumbnailUrl').val('');
                $('#thumbPreviewWrapper').empty();
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
