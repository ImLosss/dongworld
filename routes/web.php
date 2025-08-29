<?php

use App\Http\Controllers\auth\LoginController;
use App\Http\Controllers\auth\LogoutController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\GenreController; // add
use App\Http\Controllers\SeriesController;
use App\Http\Controllers\ServerController;
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
    // endRoute

    // routeServer
    Route::get('server/datatable', [ServerController::class, 'datatable'])->name('server.datatable');
    Route::resource('server', ServerController::class)->names('server');
    // endRoute
});
