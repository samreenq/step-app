<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LessonQuiz extends Model
{
    use SoftDeletes;

    protected $table = 'lesson_quiz';

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function options(){
        return $this->hasMany('App\LessonQuizOption','lesson_id','lesson_id');
    }



}
