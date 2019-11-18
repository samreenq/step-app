<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LessonQuiz extends Model
{
    use SoftDeletes;

    protected $table = 'lesson_quiz';



}
