<?php

namespace Database\Seeders;

use App\Models\Comment;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CommentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Comment::create([
            'series_id' => 1,
            'episode_id' => null,
            'name' => 'Ray',
            'content' => 'This is an test comment.',
            'is_admin' => false,
        ]);

        Comment::create([
            'series_id' => 1,
            'episode_id' => null,
            'name' => 'Admin',
            'content' => 'This is an admin comment.',
            'is_admin' => true,
        ]);
    }
}
