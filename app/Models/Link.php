<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Link extends Model
{
    protected $guarded = ['id'];

    public function episode()
    {
        return $this->belongsTo(Episode::class);
    }

    public function server()
    {
        return $this->belongsTo(Server::class);
    }
}
