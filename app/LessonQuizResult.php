<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;

class LessonQuizResult extends Model
{
    use SoftDeletes;

    protected $table = 'lesson_quiz_result';

    /**
     * @param $topic_id
     * @param $user_id
     * @return int
     */
    public function getPassedLesson($topic_id,$user_id)
    {
        $data = $this->select(DB::raw("COUNT(id) AS total"))
            ->where('topic_id',$topic_id)
            ->where('user_id',$user_id)
            ->where('is_passed',1)
            ->first();

        return (isset($data->total) && !empty($data->total)) ?  $data->total : 0;
    }



}
