<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Episode extends Model
{
    protected $guarded = ['id'];

    public function series()
    {
        return $this->belongsTo(Series::class);
    }

    public function linkForServer(int $server_id)
    {
        return $this->hasMany(Link::class)->where('server_id', $server_id);
    }
}
