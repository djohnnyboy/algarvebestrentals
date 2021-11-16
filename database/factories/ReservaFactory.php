<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Reserva;
use Faker\Generator as Faker;

$factory->define(Reserva::class, function (Faker $faker) {
    return [
        'visitor' => $faker->title,
        'device' => $faker->userAgent,
        'name' => $faker->name,
        'email' => $faker->safeEmail,
        'phone' => rand(),
        'dateOfBirth' => $faker->dateTimeThisCentury->format('Y-m-d'),
        'drivinglicence' => $faker->paragraph,
        'pickUpPlace' => rand(),
        'pickUpDate' => $faker->dateTimeThisCentury->format('Y-m-d'),
        'pickUpTime' => $faker->time($format = 'H:i:s', $max = 'now'),
        'dropOffPlace' => rand(),
        'dropOffDate' => $faker->dateTimeThisCentury->format('Y-m-d'),
        'dropOffTime' => $faker->time($format = 'H:i:s', $max = 'now'),
        'flightNumber' => $faker->paragraph,
        'fullInsurance' => rand(),
        'spainInsurance' => rand(),
        'gps' => rand(),
        'extraDriver' => rand(),
        'childTodlerSeats' => rand(),
        'childInfantSeats' => rand(),
        'childBoosterSeats' => rand(),
        'textArea' => $faker->text,
        'age' => rand(),
        'termsAndConditions' => $faker->title,
        'preco' => rand(),
        'commission' => rand(),
        'paymentId' => $faker->title,
    ];
});
