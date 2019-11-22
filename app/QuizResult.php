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
    public function getMaxScoreByCourse($course_id,$user_id)
    {
        //SELECT MAX(score) FROM quiz_result WHERE lesson_id = 1 AND user_id = 8
        $data = $this->select(DB::raw("MAX(score) as max_score"))
            ->where('course_id',$course_id)
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
        $data = \DB::select("SELECT topic_id,MAX(score) as score,attempted,correct,wrong
                FROM quiz_result
                WHERE user_id = $user_id
                GROUP BY topic_id");

        return $data;
    }

    /**
     * @param $user_id
     * @return array
     */
    public function coursesScore($user_id)
    {
        $courses = Course::where('course_type','lesson')->where('is_active',1)->whereNull('deleted_at')->get();
        $return = [];
        if(isset($courses)){
            foreach($courses as $course){
                $data['title'] = $course->title;
                $data['score'] = $this->getMaxScoreByCourse($course->id,$user_id);

                $return[] = $data;
            }
        }
        return $return;

    }

    /**
     * @param $user_id
     * @return mixed
     */

    public function quizStats($user_id)
    {
        $response['topic_graph'] = $this->coursesScore($user_id);

        $topic_model = new Topic();
        $total_topic = $topic_model->where('is_active',1)->whereNull('deleted_at')->count();

        $quiz_model = new Quiz();
        $total_questions = $quiz_model->where('is_active',1)->count();

        $user_quiz_total = $this->getQuizResult($user_id);

        $attempted = 0;
        $correct = 0;
        $wrong = 0;
        $score = 0;

        if(isset($user_quiz_total)){

            foreach($user_quiz_total as $quiz){

                $score += $quiz->score;
                $attempted += $quiz->attempted;
                $correct += $quiz->correct;
                $wrong += $quiz->wrong;
            }
        }

        $response['total_questions'] = $total_questions;
        $response['score_percent'] =$score/$total_topic;
        $response['attempted'] = $attempted;
        $response['correct'] = $correct;
        $response['wrong'] = $wrong;
        return $response;
        echo '<pre>'; print_r($user_quiz_total); exit;
    }

}
