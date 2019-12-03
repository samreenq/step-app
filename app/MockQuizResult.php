<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

Class MockQuizResult extends Model
{
    protected $table = 'mock_quiz_result';

    /**
     * @param $user_id
     * @return mixed
     */
    public function getQuizResult($user_id)
    {
       return $this->select('score','attempted','correct','wrong')->where('user_id',$user_id)
            ->orderBy('score','DESC')
            ->take(1)
            ->skip(0)
             ->first();
    }

    public function quizStats($user_id)
    {
        $response = [];

        $quiz_result_model = new MockQuizResult();
        $response['graph'] = $quiz_result_model->coursesScore($user_id);

        $mock_quiz = new MockQuiz();
        $total_questions = $mock_quiz->where('is_active',1)->whereNull('deleted_at')->count();

        $quiz_result =  $this->getQuizResult($user_id);

        $score_arr = isset($quiz_result) ? $quiz_result->toArray() : [];
        $score_arr['total_questions'] = $total_questions;

        $response['score'] = $score_arr;

        return $response;
       //echo '<pre>'; print_r($quiz_result); exit;
    }

    /**
     * @param $user_id
     * @return array
     */
    public function coursesScore($user_id)
    {
        $return = [];
        $courses = Course::where('course_type','lesson')->where('is_active',1)->whereNull('deleted_at')->get();

        $quiz_result_detail = new MockQuizResultDetail();

        if(isset($courses)){
            foreach($courses as $course){
                $data['title'] = $course->title;
                $data['score'] = $quiz_result_detail->getMaxScoreByCourse($user_id,$course->type);

                $return[] = $data;
            }
        }
        return $return;

    }

}
