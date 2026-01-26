<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Episode extends Model
{
    protected $guarded = ['id'];

    protected $casts = [
        'download_links' => 'array',
    ];

    public function series()
    {
        return $this->belongsTo(Series::class);
    }

    public function links() {
        return $this->hasMany(Link::class);
    }

    public function linkForServer(int $server_id)
    {
        return $this->links()->where('server_id', $server_id);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
}
