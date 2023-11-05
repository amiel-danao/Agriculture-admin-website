<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Faker\Factory as Faker;

class CropsSeeder extends Seeder
{
    public function run()
    {
        DB::table('crops')->insert([
            'name'=> 'Corn',
            'description' => 'Corn, scientifically known as Zea mays, is a widely cultivated cereal grain and one of the most important staple crops in the world. It is also commonly referred to as maize in many parts of the world.',
            'count' => 100,
            'harvest' => "The corn harvest, also known as maize harvest, is a vital stage in the cultivation of corn (Zea mays). Corn is a widely grown cereal grain with various uses, including food production, animal feed, and industrial applications."
        ]);

        DB::table('crops')->insert([
            'name'=> 'Rice',
            'description' => "Rice is a vital and widely cultivated crop that serves as a staple food for a significant portion of the world's population. ",
            'count' => 100,
            'harvest' => "Rice harvest is a crucial phase in the cultivation of rice, and it involves the process of gathering mature rice crops from the fields for consumption or further processing. The timing and techniques for rice harvesting can vary depending on the rice variety, local climate, and farming practices."
        ]);

        DB::table('crops')->insert([
            'name'=> 'Onion',
            'description' => "Onions are a widely cultivated and versatile crop that belongs to the genus Allium. They are known for their distinctive pungent flavor and are used in various culinary dishes worldwide. ",
            'count' => 100,
            'harvest' => "The onion harvest is a crucial stage in onion cultivation. Onions are popular vegetables used in various culinary dishes, and they are grown worldwide. The timing and methods for harvesting onions can vary depending on the onion variety and intended use."
        ]);
    }
}
