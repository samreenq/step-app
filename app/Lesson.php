<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\LessonQuiz;
use App\LessonQuizResult;
use Illuminate\Support\Facades\Storage;

class Lesson extends Model
{
    //
    protected $appends = [
        'avg_rating',
        'audio_file_path',
    ];

    public function reviews()
    {
        return $this->hasOne('App\Review','lesson_id','id');
    }
    public function result()
    {
        return $this->hasOne('App\QuizResult','topic_id','id');
    }

    public function lessonQuiz()
    {
        return $this->hasOne('App\LessonQuiz','lesson_id','id');
    }

    /**
     * @return string
     */
    public function getAvgRatingAttribute()
    {
        $reviews_model = new Review();
        $rating =  $reviews_model->getRatingByLesson($this->id);
        return (string)$rating;
    }

    /**
     * @return string
     */
    public function getAudioFilePathAttribute()
    {
        if(!empty($this->audio_file))
            return Storage::url($this->audio_file);
        else
            return '';
    }

    /**
     * @param $lesson_id
     * @return mixed
     */
    public function getLessonData($lesson_id,$user_id)
    {
        $lesson_quiz = new LessonQuiz();
        $lesson_quiz_model = new LessonQuizResult();
        $review_model = new Review();

        $check_is_passed = $lesson_quiz_model->select('is_passed')
            ->where('lesson_id',$lesson_id)
            ->where('user_id',$user_id)
            ->first();

        $data['audio_duration'] = '';
        $data['is_passed'] = isset($check_is_passed->is_passed) ? $check_is_passed->is_passed : 0;

        $data['reviews'] = $review_model ->where('lesson_id',$lesson_id)
            ->where('review_by',$user_id)->first();

        //Get Lesson Question
        $data['quiz'] = $lesson_quiz->where('lesson_id',$lesson_id)->with('options')->get();

        return $data;
    }

    /**
     * @param $topic_id
     * @param $lesson_id
     * @param $user_id
     * @return mixed
     */
    public function getLessonDetail($topic_id,$lesson_id,$user_id)
    {
        $topic_model = new Topic();
        $topic =  $topic_model->where('id',$topic_id)->first();
        $topic_data = $topic_model->getTopicData($topic_id,$user_id);
        $data['topic'] = array_merge(isset($topic->id) ? $topic->toArray() : array(),$topic_data);

        $lesson =  $this->where('id',$lesson_id)->first();
        $lesson_data = $this->getLessonData($lesson_id,$user_id);
        $data['lesson'] = array_merge(isset($lesson->id) ? $lesson->toArray() : array(),$lesson_data);

        return $data;
    }

}
