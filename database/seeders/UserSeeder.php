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
        User::create([
            'name' => 'Losss',
            'username' => 'superadmin',
            'password' => bcrypt('password'),
        ])->assignRole('superadmin');

        User::create([
            'name' => 'Yunshan',
            'username' => 'yunshan',
            'password' => bcrypt('password'),
        ])->assignRole('subber');
    }
}
