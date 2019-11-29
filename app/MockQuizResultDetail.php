<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

Class MockQuizResultDetail extends Model
{
    protected $table = 'mock_quiz_result_detail';

    protected $fillable = [
        'user_id', 'quiz_result_id', 'question_id', 'answer_id', 'is_correct','course_type'
    ];


    /**
     * @param $course_id
     * @param $user_id
     * @return float|int
     */
    public function getMaxScoreByCourse($user_id,$course_type)
    {
        $score = 0.00;
        $data = $this->select(DB::raw("SUM(is_correct) as total_correct"))
            ->where('user_id',$user_id)
            ->where('course_type',$course_type)
            ->groupBy('quiz_result_id')
            ->orderBy('total_correct','DESC')
            ->take(1)
            ->skip(0)
            ->first();

        $total_correct = (isset($data->total_correct) && !empty($data->total_correct)) ?  $data->total_correct : 0;

        $mock_quiz = new MockQuiz();
        $total_questions = $mock_quiz ->where('course_type',$course_type)->count();

        if($total_questions > 0){
            $score = ($total_correct/$total_questions)*100;
            return round($score,2);
        }

        return $score;

    }


}
