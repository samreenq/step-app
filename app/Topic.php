<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

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
     * @param $user_id
     * @param $topic_id
     */
    public function getPassedTopic($user_id,$topic_id)
    {

    }

}
