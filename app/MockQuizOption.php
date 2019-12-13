<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MockQuizOption extends Model
{

    protected $fillable = ['mock_quiz_id', 'answer', 'is_correct','is_active'];

    public function storeOption($storeOption, $question_id)
    {
        $options = $storeOption->all()['option'];
        $corr = $storeOption->all()['correct'];
        foreach ($options as $key => $option) {
            $is_correct = $key == $corr ? 1 : 0;
            if(!empty($option)) {
                $this->create(
                    ['mock_quiz_id' => $question_id,
                        'answer' => $option,
                        'is_correct' => $is_correct,
                        'is_active' => 1]
                );
            }
        }
        return $question_id;
    }
}
