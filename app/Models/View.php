<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class View extends Model
{
    protected $guarded = ['id'];

    public function series()
    {
        return $this->belongsTo(Series::class);
    }
}
