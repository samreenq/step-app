<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
    //
    protected $appends = [
        'avg_rating',
        'audio_file_path',
    ];

    public function reviews()
    {
        return $this->hasMany('App\Review','lesson_id','id');
    }
    public function result()
    {
        return $this->hasOne('App\QuizResult','lesson_id','id');
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
            return url('/').'/'.$this->audio_file;
        else
            return '';
    }
}
