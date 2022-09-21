<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Shipping extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'district', 'price', 'description',
    ];
}
