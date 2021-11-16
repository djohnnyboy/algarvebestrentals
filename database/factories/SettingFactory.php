<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Setting;
use Faker\Generator as Faker;

$factory->define(Setting::class, function (Faker $faker) {
    return [
        'email' => $faker->safeEmail,
        'spainInsurance' => rand(),
        'gps' => rand(),
        'extraDriver' => rand(),
        'todlerSeat' => rand(),
        'infantSeat' => rand(),
        'boosterSeat' => rand(),
    ];
});
