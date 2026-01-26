@extends('layouts.admin-layout')

@section('title')
    - Add Episode
@endsection

@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('home') }}">Home</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('series.index') }}">Series</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('episode.index', $series->id) }}">Episodes</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Add Episode</li>
        </ol>
        <h5 class="font-weight-bolder mb-0">Episodes - {{ $series->name }}</h5>
    </nav>
@endsection

@section('content')
<div class="card">
    <div class="card-header pb-0 px-3">
        <h5 class="mb-0">Add Episode</h5>
    </div>
    <div class="card-body pt-4 p-3">
    <form action="{{ route('episode.store', $series->id) }}" method="POST">
            @csrf
            @if($series->type !== 'movie')
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="episode_number" class="form-control-label">Episode Number</label>
                        <input class="form-control @error('episode_number') border border-danger rounded-3 @enderror" type="number" min="1" placeholder="{{ $nextEpisode ?? 1 }}" name="episode_number" value="{{ old('episode_number') }}" autofocus>
                        @error('episode_number')
                            <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group has-validation">
                        <label for="episode_number" class="form-control-label">Download Links</label>
                        <textarea class="form-control @error('download_links') border border-danger rounded-3 @enderror" type="text" placeholder="{{ old('download_links') ?? "https://link1\nhttps://link2\nhttps://link3" }}" name="download_links" autofocus>{{ old('download_links') }}</textarea>
                        @error('download_links')
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
                        <input class="form-control" type="text" name="links[{{ $srv->id }}]" placeholder="https://..." value="{{ old('links.'.$srv->id) }}">
                    </div>
                </div>
                @endforeach
            </div>

            <hr class="horizontal dark my-4">
            <div class="row">
                <div class="col-12">
                    <label class="form-control-label mb-2">Upload Video (opsional)</label>
                </div>
                <div class="col-md-12">
                    <div id="dropzone" class="w-100 p-4 border border-2 border-dashed rounded-3 text-center cursor-pointer"
                         style="border-style: dashed !important;">
                        <i class="fa-solid fa-cloud-arrow-up text-secondary" style="font-size: 32px;"></i>
                        <div class="mt-2 text-sm">Drag & drop file video di sini atau klik untuk memilih</div>
                        <div id="fileName" class="text-xs text-secondary mt-1"></div>
                        <input id="videoFile" type="file" accept="video/*" style="display:none;" />
                    </div>
                    <div class="mt-3" id="progressWrap" style="display:none;">
                        <div class="progress" style="height: 10px;">
                            <div id="uploadBar" class="progress-bar bg-gradient-dark" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="d-flex justify-content-between mt-1">
                            <small id="progressText" class="text-xs text-secondary">0%</small>
                            <small id="statusText" class="text-xs text-secondary">Menunggu file...</small>
                        </div>
                    </div>
                </div>
            </div>

            <div class="d-flex justify-content-end">
                <button id="submit" type="submit" class="btn bg-gradient-dark btn-md mt-4 mb-4">Simpan</button>
            </div>
        </form>
    </div>
</div>
@endsection

@section('script')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const dz = document.getElementById('dropzone');
        const fileInput = document.getElementById('videoFile');
        const fileName = document.getElementById('fileName');
    // no external API URL, we upload to our server endpoint
        const progressWrap = document.getElementById('progressWrap');
        const bar = document.getElementById('uploadBar');
        const progressText = document.getElementById('progressText');
        const statusText = document.getElementById('statusText');
        let isUploading = false;
        let activeXhr = null;

        function resetProgress() {
            progressWrap.style.display = 'none';
            bar.style.width = '0%';
            bar.setAttribute('aria-valuenow', '0');
            progressText.textContent = '0%';
            statusText.textContent = 'Menunggu file...';
        }

        function setUploading(percent, text) {
            progressWrap.style.display = 'block';
            const p = Math.max(0, Math.min(100, Math.round(percent)));
            bar.style.width = p + '%';
            bar.setAttribute('aria-valuenow', String(p));
            text = text ? text : 'Done';
            progressText.textContent = text + ' / ' + p + '%' + ' (Reload Halaman jika mengalami bug saat proses upload)';
        }

        function csrfToken() {
            const el = document.querySelector('meta[name="csrf-token"]');
            return el ? el.getAttribute('content') : '{{ csrf_token() }}';
        }

        function lockUI(lock) {
            isUploading = lock;
            $('#submit').prop('disabled', lock);
            dz.style.pointerEvents = lock ? 'none' : 'auto';
            dz.classList.toggle('opacity-50', lock);
        }

        function uploadFile(file) {
            if (isUploading && activeXhr) { // batalkan upload sebelumnya
                try { activeXhr.abort(); } catch(e) {}
            }
            lockUI(true);
            fileName.textContent = file.name + ' (' + Math.round(file.size/1024/1024*10)/10 + ' MB)';
            // Use XHR for progress events
            const xhr = new XMLHttpRequest();
            xhr.open('POST', '{{ route('upload.store') }}', true);
            // Build multipart form data: many APIs expect 'file'
            const formData = new FormData();
            formData.append('file', file);
            xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken());
            statusText.textContent = 'Mengupload...';
            setUploading(0);

            let lastTs = 0;
            let lastPct = -1;
            xhr.upload.onprogress = function (e) {
                if (!e.lengthComputable) return;
                const now = performance.now();
                const pct = Math.floor((e.loaded / e.total) * 100);
                if (pct === lastPct && (now - lastTs) < 100) return;
                lastPct = pct;
                lastTs = now;

                const text = e.loaded < 1024*1024
                    ? (Math.round(e.loaded/1024*10)/10)+' KB'
                    : (Math.round(e.loaded/1024/1024*10)/10)+' MB';
                setUploading(pct, text);
            };
            xhr.onerror = function() {
                statusText.textContent = 'Gagal upload (network error)';
                lockUI(false);
            };
            xhr.onreadystatechange = function() {
                if (xhr.readyState !== 4) return;
                if (xhr.status >= 200 && xhr.status < 300) {
                    setUploading(100);
                    statusText.textContent = 'Selesai diupload';
                } else if (xhr.status !== 0) { // 0 berarti dibatalkan
                    let msg = 'Gagal upload (' + xhr.status + ')';
                    try { const resp = JSON.parse(xhr.responseText); if (resp && resp.message) msg += ' - ' + resp.message; } catch(e){}
                    statusText.textContent = msg;
                }
                lockUI(false);
                activeXhr = null;
            };
            xhr.send(formData);
        }

        // drag & drop
        dz.addEventListener('click', () => { if (!isUploading) fileInput.click(); });
        dz.addEventListener('dragover', (e) => {
            e.preventDefault();
            dz.classList.add('bg-light');
        });
        dz.addEventListener('dragleave', (e) => {
            e.preventDefault();
            dz.classList.remove('bg-light');
        });
        dz.addEventListener('drop', (e) => {
            e.preventDefault();
            dz.classList.remove('bg-light');
            const files = e.dataTransfer.files;
            if (!files || !files.length) return;
            const file = files[0];
            if (!file.type.startsWith('video/')) {
                statusText.textContent = 'File bukan video';
                return;
            }
            uploadFile(file);
        });
        fileInput.addEventListener('change', (e) => {
            const file = e.target.files && e.target.files[0];
            if (!file) return;
            if (!file.type.startsWith('video/')) {
                statusText.textContent = 'File bukan video';
                return;
            }
            uploadFile(file);
        });
    });
</script>
@endsection
