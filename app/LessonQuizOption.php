<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class LessonQuizOption extends Model
{
    //use SoftDeletes;

    protected $table = 'lesson_quiz_options';
    protected $fillable = ['lesson_id','lesson_quiz_id','answer', 'is_correct','is_active' ];

    /**
     * @param $params
     * @return bool
     */
    public function storeOptions($params)
    {
        if(count($params['option']) > 0){

            $this->where('lesson_id',$params['lesson_id'])->delete();

            $correct = $params['correct'];
            foreach($params['option'] as $key => $option){

                $is_correct = isset($correct[$key]) ? 1 : 0;
                $arr = array(
                    'lesson_id' => $params['lesson_id'],
                    'lesson_quiz_id' => $params['lesson_quiz_id'],
                    'answer' => $option,
                    'is_correct' => $is_correct,
                    'is_active' => 1
                );

                $this->create($arr);
            }

            return true;
        }
        return false;
    }




}
