<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Faq extends Model
{
    public const PUBLISHED = 'PUBLISHED';
    public const CRAFT = 'DRAFT';

    /**
     * Scope a query to only include active testimonial.
     *
     * @param  $query  \Illuminate\Database\Eloquent\Builder
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */

    public function scopePublished($query)
    {
        return $query->where('status', static::PUBLISHED);
    }
}   
