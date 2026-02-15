<?php

use App\Http\Controllers\auth\LoginController;
use App\Http\Controllers\auth\LogoutController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\GenreController; // add
use App\Http\Controllers\SeriesController;
use App\Http\Controllers\ServerController;
use App\Http\Controllers\EpisodeController;
use App\Http\Controllers\UploadController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\LinkController;
use Illuminate\Support\Facades\Route;

Route::get('/login', function () {
    return view('auth.login');
})->name('login')->middleware('guest');

Route::post('/login', [LoginController::class, 'authenticate'])->name('login')->middleware('guest');
Route::post('/logout', [LogoutController::class, 'logout'])->name('logout')->middleware('auth');

Route::group([
    'middleware' => ['auth'],
    'prefix'     => '/',
], function () {

    // routeDashboard
    Route::get('/', [DashboardController::class, 'index'])->name('home');
    //endRoute

    // routeGenre
    Route::get('genre/datatable', [GenreController::class, 'datatable'])->name('genre.datatable');
    Route::resource('genre', GenreController::class)->names('genre');
    // endRoute

    // routeSeries
    Route::get('series/datatable', [SeriesController::class, 'datatable'])->name('series.datatable');
    Route::resource('series', SeriesController::class)->names('series');
    Route::post('series/fetch-mal', [SeriesController::class, 'fetchFromMal'])->name('series.fetch-mal');
    // endRoute

    // routeServer
    Route::get('server/datatable', [ServerController::class, 'datatable'])->name('server.datatable');
    Route::resource('server', ServerController::class)->names('server');
    // endRoute

    // routeEpisodes nested in series
    Route::get('series/{series}/episodes/datatable', [EpisodeController::class, 'datatable'])->name('episode.datatable');
    Route::resource('series.episode', EpisodeController::class)->parameters([
        'episode' => 'episode'
    ])->names('episode');
    // endRoute

    // upload endpoints
    Route::post('upload', [UploadController::class, 'store'])->name('upload.store');
    // keep proxy available but not used by default anymore
    Route::post('upload/proxy', [UploadController::class, 'proxy'])->name('upload.proxy');

    // routeComments
    Route::get('comments/datatable', [CommentController::class, 'datatable'])->name('comments.datatable');
    Route::resource('comments', CommentController::class)->only(['index', 'show', 'destroy'])->names('comments');
    Route::post('comments/{comment}/reply', [CommentController::class, 'reply'])->name('comments.reply');
    // endRoute

    // routeLinks
    Route::delete('links/{link}', [LinkController::class, 'destroy'])->name('links.destroy');
});
