<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class QuizResult extends Model
{
    protected $table = 'quiz_result';

    public function course(){
        return $this->belongsTo('App\Course','course_id','id');
    }

    public function getMaxScore($topic_id,$user_id)
    {
        //SELECT MAX(score) FROM quiz_result WHERE lesson_id = 1 AND user_id = 8
        $data = $this->select(DB::raw("MAX(score) as max_score"))
            ->where('topic_id',$topic_id)
            ->where('user_id',$user_id)
            ->first();
        return (isset($data->max_score) && !empty($data->max_score)) ?  round($data->max_score) : 0;
    }

    /**
     * @param $course_id
     * @param $user_id
     * @return float|int
     */

    public function getTotalPassingTopic($course_id,$user_id)
    {
         $data = $this->select(DB::raw("COUNT(DISTINCT topic_id) as total"))
            ->where('course_id',$course_id)
            ->where('user_id',$user_id)
            ->where('status','pass')
            ->first();

        return (isset($data->total) && !empty($data->total)) ?  $data->total : 0;
    }

    /**
     * @param $user_id
     * @return mixed
     */
    public  function getCoursesScore($user_id)
    {
        $data = $this->select(DB::raw("MAX(".$this->table.".score) as score, courses.title"))
            ->leftJoin('courses','courses.id','=',$this->table.'.course_id')
            ->where($this->table.'.user_id',$user_id)
            ->groupBy($this->table.'.course_id')
            ->get();

        return $data;
    }

    /**
     * @param $user_id
     * @return mixed
     */
    public function getQuizResult($user_id)
    {
       /* SELECT topic_id,MAX(score),attempted,correct,wrong
        FROM quiz_result
        WHERE user_id = 1
        GROUP BY topic_id*/
        $data = $this->select(DB::raw("MAX(".$this->table.".score) as score"),$this->table.".attempted,".$this->table.".correct,".$this->table.".wrong")
            ->where($this->table.'.user_id',$user_id)
            ->groupBy($this->table.'.topic_id')
            ->get();

        return $data;
    }

}
