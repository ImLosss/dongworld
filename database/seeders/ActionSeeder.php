<?php

namespace Database\Seeders;

use App\Models\Episode;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ActionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $episodes = Episode::all();

        foreach($episodes as $episode) {
            foreach($episode->download_links as $link) {
                $episode->downloads()->create([
                    'episode_id' => $episode->id,
                    'link' => $link,
                    'quality' => '1080P',
                    'server' => 'drive'
                ]);
            }
        }
    }
}
