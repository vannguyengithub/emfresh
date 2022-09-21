<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Advise extends Model
{
    protected $table = 'advise';
    
    protected $fillable = ['email_phone'];
}
