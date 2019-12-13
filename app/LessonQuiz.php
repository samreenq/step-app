<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LessonQuiz extends Model
{
   // use SoftDeletes;

    protected $table = 'lesson_quiz';
    protected $fillable = ['lesson_id','question', 'is_active' ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function options(){
        return $this->hasMany('App\LessonQuizOption','lesson_id','lesson_id');
    }



}
