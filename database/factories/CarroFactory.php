<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Carro;
use Faker\Generator as Faker;
use Illuminate\Support\Str;

$factory->define(Carro::class, function (Faker $faker) {
    return [
        'groupType' => $faker->title,
        'marca' => $faker->name,
        'epocaBaixa' => rand(),
        'epocaMedia' => rand(),
        'epocaMediaAlta' => rand(),
        'epocaAlta' => rand(),
        'seguro' => rand(),
        'transmissao' => $faker->text,
        'lugares' => rand(),
        'bagagemGr' => rand(),
        'bagagemPq' => rand(),
        'combustivel' => $faker->paragraph,
        'arCondicionado' => $faker->paragraph,
        'imagem' => $faker->imageUrl,
        'numeroReservas' => rand(),
        'active' => 1,
    ];
});
