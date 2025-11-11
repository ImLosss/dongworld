<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Series extends Model
{
    protected $guarded = ['id'];

    public function genres() {
        return $this->belongsToMany(Genre::class, 'genre_series', 'series_id', 'genre_id');
    }

    public function episodes() {
        return $this->hasMany(Episode::class);
    }
}
