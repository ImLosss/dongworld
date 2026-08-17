<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Series;
use App\Models\Episode;

class Comment extends Model
{
    protected $guarded = ['id'];

    protected $casts = [
        'is_admin' => 'boolean',
    ];

    public function series()
    {
        return $this->belongsTo(Series::class);
    }

    public function episode()
    {
        return $this->belongsTo(Episode::class);
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
