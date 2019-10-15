<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Quiz extends Model
{
    use SoftDeletes;

    protected $fillable = ['lesson_id', 'question'];

    public function storeQuiz($storeQuiz)
    {
        $response = $this->create($storeQuiz->only($this->getFillable()));
        return $response->id;
    }
}
