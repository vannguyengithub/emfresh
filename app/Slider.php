<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Slider extends Model
{
    public const PUBLISHED = 'PUBLISHED';

    public function banners(){
        return $this->belongsToMany(Banner::class ,'slider_banners');
    }

     /**
     * Scope a query to only published scopes.
     *
     * @param \Illuminate\Database\Eloquent\Builder $query
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopePushlished(Builder $query)
    {
        return $query->where('status', '=', static::PUBLISHED);
    }
}
