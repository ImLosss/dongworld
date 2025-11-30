<?php

namespace Database\Seeders;

use App\Models\Series;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SeriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Series::create([
            'name' => 'Renegade Immortal',
            'slug' => 'renegade-immortal',
            'synopsis' => 'This is an example series synopsis.',
            'thumbnail' => 'storage/series/image.jpg',
            'release_date' => '2020-08-27',
            'rating' => 4.5,
            'total_episodes' => 200,
            'current_episode' => 21,
            'type' => 'tv',
        ]);

        Series::create([
            'name' => 'Alchemy Supreme',
            'slug' => 'alchemy-supreme',
            'synopsis' => 'This is an example series synopsis.',
            'thumbnail' => 'storage/series/image2.jpg',
            'release_date' => '2020-08-27',
            'rating' => 4.5,
            'total_episodes' => 200,
            'current_episode' => 50,
            'type' => 'tv',
        ]);
    }
}
