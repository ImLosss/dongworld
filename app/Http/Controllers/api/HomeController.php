<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Episode;
use App\Models\Series;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function getSeries()
    {
        $series = Series::latest('updated_at')
            ->withMax('episodes', 'episode_number')
            ->take(10)
            ->get();

        $movies = Series::where('type', 'movie')
            ->latest('updated_at')
            ->withMax('episodes', 'episode_number')
            ->take(10)
            ->get();

        $heroSlides = Series::inRandomOrder()
            ->take(3)
            ->get();

        $schedules = Series::whereNotNull('release_day')
            ->withMax('episodes', 'episode_number')
            ->where('status', 'ongoing')
            ->get();

        return response()->json(['series' => $series, 'movies' => $movies, 'heroSlides' => $heroSlides, 'schedules' => $schedules]);
    }
}
