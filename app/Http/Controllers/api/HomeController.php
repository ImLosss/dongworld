<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Series;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function getSeries()
    {
        $series = Series::all();
        return response()->json([
            'series' => $series
        ]);
    }
}
