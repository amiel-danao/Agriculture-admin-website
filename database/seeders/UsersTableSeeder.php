<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Faker\Factory as Faker;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        DB::table('users')->insert([
            'name'=> 'admin1',
            'email' => 'admin@email.com',
            'user_id' => 'admin1',
            'mobile_number' => '',
            'role_id' => 1,
            'password' => Hash::make('password123'), // You can set a default password here
        ]);

        // $faker = Faker::create();

        // foreach (range(1, 100) as $index) {
        //     // Generate mobile numbers in the format "09123456789"
        //     $mobileNumber = '09' . $faker->numberBetween(100000000, 999999999);

        //     DB::table('users')->insert([
        //         'name'=> $faker->unique()->name,
        //         'email' => $faker->unique()->safeEmail,
        //         'user_id' => $faker->userName,
        //         'mobile_number' => $mobileNumber,
        //         'password' => Hash::make('password123'), // You can set a default password here
        //         'role_id' => 1,
        //     ]);
        // }
    }
}
