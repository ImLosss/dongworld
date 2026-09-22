<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Series extends Model
{
    use Searchable;

    protected $guarded = ['id'];

    protected $casts = [
        'aliases' => 'array',
        'release_day' => 'array',
    ];

    public function toSearchableArray()
    {
        return [
            'id' => (int) $this->id,
            'name' => $this->name,
            'aliases' => $this->aliases, // Array JSON akan otomatis terbaca oleh Meilisearch
            'type' => $this->type,
            'status' => $this->status,
            // Ambil semua nama genre ke dalam bentuk array string, contoh: ["Action", "Comedy"]
            'genres' => $this->genres->pluck('name')->toArray(),
        ];
    }

    protected function makeAllSearchableUsing($query)
    {
        return $query->with('genres');
    }

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

    public function mainEpisodes()
    {
        return $this->hasMany(Episode::class)->where('is_preview', false);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function views()
    {
        return $this->hasMany(View::class);
    }

    public function nextSeries()
    {
        return $this->belongsTo(Series::class, 'next_series_id', 'id');
    }

    public function previousSeries()
    {
        return $this->belongsTo(Series::class, 'previous_series_id', 'id');
    }

    public function replyTo()
    {
        return $this->belongsTo(Comment::class, 'reply_to_comment_id');
    }

    public function replies()
    {
        return $this->hasMany(Comment::class, 'reply_to_comment_id');
    }
}
