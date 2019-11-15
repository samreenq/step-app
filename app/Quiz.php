<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Quiz extends Model
{
    use SoftDeletes;

    protected $fillable = ['topic_id', 'question'];

    /**
     * @param $storeQuiz
     * @return mixed
     */
    public function storeQuiz($storeQuiz)
    {
        $response = $this->create($storeQuiz->only($this->getFillable()));
        return $response->id;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function options(){
        return $this->hasMany('App\Option','quiz_id','id');
    }


}
