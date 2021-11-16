<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Quote;
use Faker\Generator as Faker;

$factory->define(Quote::class, function (Faker $faker) {
    return [
        'pickUpDate' => $faker->dateTimeThisCentury->format('Y-m-d'),
        'dropOffDate' => $faker->dateTimeThisCentury->format('Y-m-d'),
        'age' => rand(),
        'carros' => $faker->title,
        'days' => rand(),
    ];
});
