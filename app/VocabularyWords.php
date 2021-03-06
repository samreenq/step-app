<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class VocabularyWords extends Model
{
    public $table = 'vocabulary_words';

    /**
     * @param $word_id
     * @param $user_id
     * @return mixed
     */
    public function getUserVocabulary($word_id,$user_id)
    {
        return $this->select($this->table.'.*',DB::raw('IFNULL(read_words.is_read, 0) as is_read'))
            ->with('arabic')
            //->leftJoin('read_words','read_words.word_id','=',$this->table.'.id')
            ->leftJoin('read_words', function($join) use ($user_id) {
                $join->on('read_words.word_id','=',$this->table.'.id')
                    ->where('read_words.user_id','=', $user_id);
            })
            ->where($this->table.'.id',$word_id)
            ->where($this->table.'.is_active',1)
            ->whereNull($this->table.'.deleted_at')
            ->first();


    }

    public function arabic()
    {
        return $this->hasOne('App\VocabularyWordsLang','word_id','id');
    }




}
