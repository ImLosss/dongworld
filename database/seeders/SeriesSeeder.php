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
            'thumbnail' => 'storage/series/C1vi4nBu8KssC48lj0pqdUFZ8ZiVf4X3MLBhjntF.png',
            'release_date' => '2020-08-27',
            'rating' => 4.5,
            'total_episodes' => 200,
            'type' => 'episodes',
        ]);
    }
}
