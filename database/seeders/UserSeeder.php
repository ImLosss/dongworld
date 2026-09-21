<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::updateOrCreate(
            ['username' => 'superadmin'],
            [
                'name' => 'Losss',
                'password' => bcrypt('premi040103'),
            ]
        )->assignRole('superadmin');

        User::updateOrCreate(
            ['username' => 'yunshan'],
            [
                'name' => 'Yunshan',
                'password' => bcrypt('yahaha'),
            ]
        )->assignRole('subber');
    }
}
