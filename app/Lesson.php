<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    //

    public function reviews()
    {
        return $this->hasMany('App\Review','lesson_id','id');
    }
}
