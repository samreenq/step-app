<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use App\Lesson;
use App\LessonQuizResult;
use App\QuizResult;

class Topic extends Model
{

    public function result()
    {
        return $this->hasOne('App\QuizResult','topic_id','id');
    }

    public function summary()
    {
        return $this->hasOne('App\QuizSummary','topic_id','topic_id');
    }

    /**
     * @param $topic_id
     * @param $user_id
     * @return mixed
     */
   public function getTopicData($topic_id,$user_id)
   {
       $lesson_model = new Lesson();
       $quiz_model = new QuizResult();
       $lesson_quiz_result = new LessonQuizResult();

       $data['total_lesson'] = $lesson_model->where('topic_id',$topic_id)
           ->whereNull('deleted_at')->count();

       $data['completed_lesson'] = $lesson_quiz_result->getPassedLesson($topic_id,$user_id);
       $data['score'] = $quiz_model->getMaxScore($topic_id,$user_id);

       return $data;
   }

}
