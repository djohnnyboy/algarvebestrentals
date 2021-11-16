<?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    protected $table = "companies";
    protected $fillable = [
        'id',
        'email',
        'name',
        'phone',
        'nif',
        'active'
    ];
}
