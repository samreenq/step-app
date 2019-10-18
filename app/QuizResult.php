<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class QuizResult extends Model
{
    protected $table = 'quiz_result';

    public function course(){
        return $this->belongsTo('App\Course','course_id','id');
    }
}
