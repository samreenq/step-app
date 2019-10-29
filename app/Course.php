<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    //
    protected $appends = [
        'avg_rating',
        'icon_path'
    ];

    /**
     * @return string
     */
    public function getAvgRatingAttribute()
    {

        $reviews_model = new Review();
        $rating = $reviews_model->getRatingByCourse($this->id);
        return $rating;
    }

    public function getIconPathAttribute()
    {

        return url('/').'/'.$this->icon;
    }
}
