<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class PermissionRoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Role::create(['name' => 'superadmin']);
        Role::create(['name' => 'subber']);
        Permission::create(['name' => 'userAccess'])
        ->assignRole(['superadmin']);
        Permission::create(['name' => 'seriesAccess'])
        ->assignRole(['subber', 'superadmin']);
        Permission::create(['name' => 'seriesAdd'])
        ->assignRole(['superadmin']);
        Permission::create(['name' => 'seriesUpdate'])
        ->assignRole(['superadmin']);
        Permission::create(['name' => 'seriesDelete'])
        ->assignRole(['superadmin']);
        Permission::create(['name' => 'episodeAccess'])
        ->assignRole(['superadmin', 'subber']);
        Permission::create(['name' => 'episodeAdd'])
        ->assignRole(['subber', 'superadmin']);
        Permission::create(['name' => 'episodeUpdate'])
        ->assignRole(['subber', 'superadmin']);
        Permission::create(['name' => 'episodeDelete'])
        ->assignRole(['subber', 'superadmin']);
        Permission::create(['name' => 'genreAccess'])
        ->assignRole(['subber', 'superadmin']);
        Permission::create(['name' => 'genreAdd'])
        ->assignRole(['superadmin']);
        Permission::create(['name' => 'genreUpdate'])
        ->assignRole(['superadmin']);
        Permission::create(['name' => 'genreDelete'])
        ->assignRole(['superadmin']);
    }
}
