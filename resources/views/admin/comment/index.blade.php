@extends('layouts.admin-layout')

@section('title')
    - Comments
@endsection

@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('home') }}">Home</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Comments</li>
        </ol>
    <h5 class="font-weight-bolder mb-0">Comments</h5>
    </nav>
@endsection

@section('content')
<div class="row">
    <div class="col-12">
        <div class="card mb-1 p-3">
            <div class="card-header pb-3">
                <div class="row">
                    <div class="col d-flex align-items-center">
                        <h6>All Comments</h6>
                    </div>
                </div>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-3">
                    <table class="table align-items-center mb-0 w-100">
                        <thead>
                            <tr>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">#</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Nama</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Konten</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Series</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Episode</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Dibuat</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-1">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($comments as $idx => $comment)
                                <tr>
                                    <td class="text-sm">{{ $comments->firstItem() + $idx }}</td>
                                    <td class="text-sm">
                                        <div class="d-flex align-items-center">
                                            <span class="text-dark">{{ $comment->name }}</span>
                                            @if($comment->is_admin)
                                                <span class="badge badge-sm bg-gradient-dark ms-2">Admin</span>
                                            @endif
                                        </div>
                                    </td>
                                    <td class="text-sm" style="max-width: 420px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                        {{ $comment->content }}
                                    </td>
                                    <td class="text-sm">{{ optional($comment->series)->name ?? '-' }}</td>
                                    <td class="text-sm">{{ optional($comment->episode)->episode_number ?? '-' }}</td>
                                    <td class="text-sm">{{ $comment->created_at?->format('d M Y H:i') }}</td>
                                    <td class="text-sm">
                                        <a href="{{ route('comments.show', $comment->id) }}" class="btn btn-sm bg-gradient-info">Detail</a>
                                        <button type="button" class="btn btn-sm bg-gradient-danger" onclick="modalHapus({{ $comment->id }})">Hapus</button>
                                        <form id="form_{{ $comment->id }}" action="{{ route('comments.destroy', $comment->id) }}" method="POST" style="display:none;">
                                            @csrf
                                            @method('DELETE')
                                        </form>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="7" class="text-sm text-center text-secondary">Belum ada komentar</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="d-flex justify-content-end mt-3">
    {{ $comments->links() }}
</div>
@endsection
