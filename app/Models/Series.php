<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Series extends Model
{
    protected $guarded = ['id'];

    protected $casts = [
        'aliases' => 'array',
    ];

    public function genres() {
        return $this->belongsToMany(Genre::class, 'genre_series', 'series_id', 'genre_id');
    }

    public function episodes() {
        return $this->hasMany(Episode::class);
    }

    public function latestEpisode()
    {
        return $this->hasOne(Episode::class)->ofMany('episode_number', 'max');
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
}
