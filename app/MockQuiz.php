<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MockQuiz extends Model
{
    use SoftDeletes;

    protected $fillable = ['question'];

    public function storeQuiz($storeQuiz)
    {
        $response = $this->create($storeQuiz->only($this->getFillable()));
        return $response->id;

    }

    /**
     * Options
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function options(){
        return $this->hasMany('App\MockQuizOption','mock_quiz_id','id');
    }
}
