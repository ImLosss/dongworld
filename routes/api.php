<?php

use App\Http\Controllers\api\HomeController;
use App\Http\Controllers\api\SearchController;
use App\Http\Controllers\api\SeriesController;
use App\Http\Controllers\api\WatchController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(
    [
        'middleware' => ['apikey'],
        'namespace' => 'App\Http\Controllers',
        'prefix' => '/',
    ],
    function () {
        Route::get('/status', function () {
            return response()->json([
                'service' => 'OK',
                'time' => now()
            ]);
        });

        Route::get('/all-series', [HomeController::class, 'getSeries']);
        Route::get('/series/{slug}', [SeriesController::class, 'getSeriesDetail']);
        Route::get('/series', [SearchController::class, 'search']);
        Route::get('/genres', [SearchController::class, 'getFilters']);
        Route::get('/watch/{slug}', [WatchController::class, 'watch']);
        Route::get('/recommendations', [SeriesController::class, 'getRecomendation']);
        Route::post('/view-series/{slug}', [SeriesController::class, 'incrementViewCount']);
        Route::post('/comments', [SeriesController::class, 'postComment']);

        // telegramEndpoints
        Route::post('telegram/episode/new', [\App\Http\Controllers\api\telegram\EpisodeController::class, 'newEpisode']);
        Route::get('telegram/series/{id}', [\App\Http\Controllers\api\telegram\SeriesController::class, 'getSeriesDetail']);
    }
);
