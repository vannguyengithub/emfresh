<?php

namespace App;

use Laravel\Scout\Searchable;
use Illuminate\Database\Eloquent\Model;
use Nicolaslopezj\Searchable\SearchableTrait;
use TCG\Voyager\Traits\Translatable;
class Product extends Model
{
    use SearchableTrait, Searchable , Translatable;

    protected $fillable = ['quantity'];

    protected $translatable = ['name', 'desciption'];

    /**
     * Searchable rules.
     *
     * @var array
     */
    protected $searchable = [
        /**
         * Columns and their priority in search results.
         * Columns with higher values are more important.
         * Columns with equal values have equal importance.
         *
         * @var array
         */
        'columns' => [
            'products.name' => 10,
            'products.details' => 5,
            'products.description' => 2,
        ],
    ];

    public function categories()
    {
        return $this->belongsToMany('App\Category');
    }

    public function presentPrice()
    {
        return number_format($this->price / 100);
    }

    public function scopeMightAlsoLike($query)
    {
        return $query->inRandomOrder()->take(4);
    }

    /**
     * Get the indexable data array for the model.
     *
     * @return array
     */
    public function toSearchableArray()
    {
        $array = $this->toArray();

        $extraFields = [
            'categories' => $this->categories->pluck('name')->toArray(),
        ];

        return array_merge($array, $extraFields);
    }

    public static function groupProductByMeals($date)
    {
        return $products = Product::where('sale_at' , $date)->get();
    }

    public static function getGroupProductforWeeks($current_day)
    {
        $day_products = [
            [
                'date' =>  date("d/m",$current_day),
                'day' => date('D' , strtotime(date("Y-m-d",$current_day))),
                'fulldate' => date("Y-m-d",$current_day)
            ],
            [
                'date' => date("d/m",strtotime("+1 day", $current_day)),
                'day' => date('D' , strtotime(date("Y-m-d",strtotime("+1 day", $current_day)))),
                'fulldate' => date("Y-m-d",strtotime("+1 day", $current_day))
            ],
            [
                'date' => date("d/m",strtotime("+2 day", $current_day)),
                'day' => date('D' , strtotime(date("Y-m-d",strtotime("+2 day", $current_day)))),
                'fulldate' => date("Y-m-d",strtotime("+1 day", $current_day))
            ],
            [
                'date' => date("d/m",strtotime("+3 day", $current_day)),
                'day' => date('D' , strtotime(date("Y-m-d",strtotime("+3 day", $current_day)))),
                'fulldate' => date("Y-m-d",strtotime("+1 day", $current_day))
            ],
            [
                'date' => date("d/m",strtotime("+4 day", $current_day)),
                'day' => date('D' , strtotime(date("Y-m-d",strtotime("+4 day", $current_day)))),
                'fulldate' => date("Y-m-d",strtotime("+1 day", $current_day))
            ],
            [
                'date' => date("d/m",strtotime("+5 day", $current_day)),
                'day' => date('D' , strtotime(date("Y-m-d",strtotime("+5 day", $current_day)))),
                'fulldate' => date("Y-m-d",strtotime("+1 day", $current_day))
            ],
            [   
                'date' => date("d/m",strtotime("+6 day", $current_day)),
                'day' => date('D', strtotime(date("Y-m-d",strtotime("+6 day", $current_day)))),
                'fulldate' => date("Y-m-d",strtotime("+1 day", $current_day))
            ]
        ];

        return $day_products;
    }
}
