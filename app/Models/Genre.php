<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Genre extends Model
{
    protected $guarded = ['id'];

    public function series() {
        return $this->belongsToMany(Series::class, 'genre_series', 'genre_id', 'series_id');
    }
}
