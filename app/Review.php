<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Review extends Model
{
    //
    public function __construct()
    {
        // set tables and keys
        $this->__table = $this->table = 'reviews';
        $this->primaryKey =  'id';
    }

    /**
     * @param $course_id
     * @return string
     */
    public function getRatingByCourse($course_id)
    {
       $data = $this->select(DB::raw("SUM(rating)/COUNT(id) as avg_rating"))->where('course_id', $course_id)->first();
       return (isset($data->avg_rating) && !empty($data->avg_rating)) ?  round($data->avg_rating,1) : 0;
    }
}
