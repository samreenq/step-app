<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Option extends Model
{
    use SoftDeletes;

    protected $fillable = ['quiz_id', 'answer', 'is_correct'];

    public function storeOption($storeOption, $question_id)
    {
        $options = $storeOption->all()['option'];
        $corr = $storeOption->all()['correct'];
        foreach ($options as $key => $option) {
            $is_correct = $key == $corr ? 1 : 0;
            if(!empty($option)) {
                $this->create(
                    ['quiz_id' => $question_id,
                        'answer' => $option,
                        'is_correct' => $is_correct]
                );
            }
        }
        return $question_id;
    }
}
