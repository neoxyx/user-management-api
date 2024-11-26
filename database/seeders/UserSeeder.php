<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            [
                'nombre' => 'John',
                'apellido' => 'Doe',
                'email' => 'john.doe@example.com',
                'telefono' => '1234567890',
                'password' => Hash::make('password123'),
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'nombre' => 'Jane',
                'apellido' => 'Doe',
                'email' => 'jane.doe@example.com',
                'telefono' => '0987654321',
                'password' => Hash::make('password123'),
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
