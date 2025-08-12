<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Student>
 */
class StudentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'khmer_name' => fake()->name(), // You can replace with Khmer faker if needed
            'latin_name' => fake()->name(),
            'gender' => fake()->randomElement(['male', 'female']),
            'dob' => fake()->date('Y-m-d', '2015-12-31'), // Random DOB before 2015
            'address' => fake()->address(),
            'tel' => fake()->phoneNumber(),
        ];
    }
}
