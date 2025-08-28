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
            'thumbnail' => 'path/to/thumbnail.jpg',
            'release_date' => '2020-08-27',
            'rating' => 4.5,
            'type' => 'episodes',
        ]);
    }
}
