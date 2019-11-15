<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class QuizSummary extends Model
{
    use SoftDeletes;

    protected $table = 'quiz_summary';

    protected $fillable = ['topic_id', 'title','description','is_active'];


}
