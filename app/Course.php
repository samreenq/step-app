<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Course extends Model
{
    //
    protected $appends = [
       // 'avg_rating',
        'icon_path',
        'total_topics'
    ];

    /**
     * @return string
     */
  /*  public function getAvgRatingAttribute()
    {

        $reviews_model = new Review();
        $rating =  $reviews_model->getRatingByCourse($this->id);
        return (string)$rating;
    }*/

    public function getIconPathAttribute()
    {
        if(!empty($this->icon)){
            return  Storage::url($this->icon);
        }

    }

    /**
     * @return mixed
     */
    public function getTotalTopicsAttribute()
    {
        $model = new Topic();
        return $model->where('course_id',$this->id)
           ->where('is_active',1)
           ->whereNull('deleted_at')->count();
    }
}
