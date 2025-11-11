<?php

namespace Database\Seeders;

use App\Models\Episode;
use App\Models\Link;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class EpisodeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 1; $i <= 50; $i++) {
            Episode::create([
                'series_id' => 1,
                'episode_number' => $i,
                'slug' => 'renegade-immortal-' . $i,
            ]);

            Link::create([
                'episode_id' => $i,
                'server_id' => 1,
                'url' => 'https://www.dailymotion.com/embed/video/x9q52oc'
            ]);
        }
    }
}
