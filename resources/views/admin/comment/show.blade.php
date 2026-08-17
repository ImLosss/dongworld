@extends('layouts.admin-layout')

@section('title')
    - Comment Detail
@endsection

@section('breadcrumb')
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('home') }}">Home</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="{{ route('comments.index') }}">Comments</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Detail</li>
        </ol>
        <h5 class="font-weight-bolder mb-0">Comment Detail</h5>
    </nav>
@endsection

@section('content')
<div class="row">
    <div class="col-12 col-lg-8">
        <div class="card mb-4">
            <div class="card-header pb-0 px-3">
                <div class="d-flex justify-content-between align-items-center">
                    <h6 class="mb-0">Komentar</h6>
                    <span class="text-xs text-secondary">{{ $comment->created_at?->format('d M Y H:i') }}</span>
                </div>
            </div>
            <div class="card-body pt-3">
                <div class="d-flex align-items-center mb-2">
                    <h6 class="mb-0 me-2">{{ $comment->name }}</h6>
                    @if($comment->is_admin)
                        <span class="badge badge-sm bg-gradient-dark">Admin</span>
                    @endif
                </div>
                <p class="text-sm mb-0">{{ $comment->content }}</p>
                @if($comment->replyTo)
                    <div class="mt-3 p-3 border rounded">
                        <div class="text-xs text-secondary mb-1">
                            Membalas komentar:
                        </div>

                        <div class="text-sm font-weight-bold">
                            {{ $comment->replyTo->name }}
                        </div>

                        <div class="text-sm text-secondary">
                            {{ $comment->replyTo->content }}
                        </div>
                    </div>
                @endif
                <hr class="horizontal dark my-4">
                <div class="row text-sm">
                    <div class="col-md-6">
                        <div class="mb-2"><strong>Series:</strong> {{ $comment->episode?->series?->name ?? $comment->series?->name ?? '-' }}</div>
                        <div><strong>Episode:</strong> {{ optional($comment->episode)->episode_number ?? '-' }}</div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-2"><strong>Series ID:</strong> {{ $comment->episode?->series?->id ?? $comment->series?->id ?? '-' }}</div>
                        <div><strong>Episode ID:</strong> {{ $comment->episode_id ?? '-' }}</div>
                    </div>
                </div>
            </div>
        </div>

        @if($comment->replies->count())
            <div class="mt-4">
                <h6 class="text-sm mb-3">
                    Balasan ({{ $comment->replies->count() }})
                </h6>

                @foreach($comment->replies as $reply)
                    <div class="border rounded p-3 mb-3">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <div>
                                <span class="text-sm font-weight-bold">
                                    {{ $reply->name }}
                                </span>

                                @if($reply->is_admin)
                                    <span class="badge badge-sm bg-gradient-dark">
                                        Admin
                                    </span>
                                @endif
                            </div>

                            <span class="text-xs text-secondary">
                                {{ $reply->created_at?->format('d M Y H:i') }}
                            </span>
                        </div>

                        <p class="text-sm mb-0">
                            {{ $reply->content }}
                        </p>
                    </div>
                @endforeach
            </div>
        @endif

        <div class="card">
            <div class="card-header pb-0 px-3">
                <h6 class="mb-0">Balas Komentar</h6>
            </div>
            <div class="card-body pt-3">
                <form action="{{ route('comments.reply', $comment->id) }}" method="POST">
                    @csrf
                    <div class="form-group has-validation">
                        <label class="form-control-label">Isi Balasan</label>
                        <textarea class="form-control @error('content') border border-danger rounded-3 @enderror" name="content" rows="4" placeholder="Tulis balasan..." autofocus>{{ old('content') }}</textarea>
                        @error('content')
                            <p class="text-danger text-xs mt-2">{{ $message }}</p>
                        @enderror
                        <p class="text-xs text-secondary mt-2 mb-0">Balasan akan diawali otomatis dengan <strong>@{{ $comment->name }}</strong>.</p>
                    </div>
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="btn bg-gradient-dark btn-md">Kirim Balasan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="col-12 col-lg-4">
        <div class="card mb-4">
            <div class="card-header pb-0 px-3">
                <h6 class="mb-0">Komentar Terkait</h6>
            </div>
            <div class="card-body pt-3">
                @forelse($relatedComments as $rel)
                    <div class="mb-3">
                        <div class="d-flex justify-content-between">
                            <span class="text-sm font-weight-bold">{{ $rel->name }}</span>
                            <span class="text-xs text-secondary">{{ $rel->created_at?->format('d M') }}</span>
                        </div>
                        <div class="text-sm text-secondary" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                            {{ $rel->content }}
                        </div>
                    </div>
                    <hr class="horizontal dark my-2">
                @empty
                    <p class="text-sm text-secondary mb-0">Belum ada komentar terkait.</p>
                @endforelse
            </div>
        </div>
    </div>
</div>
@endsection
