<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LessonQuizOption extends Model
{
    use SoftDeletes;

    protected $table = 'lesson_quiz_options';




}
