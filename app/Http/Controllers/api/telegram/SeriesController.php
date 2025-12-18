<?php

namespace App\Http\Controllers\api\telegram;

use App\Http\Controllers\Controller;
use App\Models\Series;
use Illuminate\Http\Request;

class SeriesController extends Controller
{
    public function getSeriesDetail($id)
    {
        $series = Series::where('id', $id)->first();
        if (!$series) {
            return response()->json([
                'message' => 'Series not found'
            ], 404);
        }

        return response()->json([
            'series' => $series,
        ]);
    }
}
