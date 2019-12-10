<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class VocabularyWordsLang extends Model
{
    public $table = 'vocabulary_words_lang';

    protected $fillable = ['lang', 'word_id','first_word','second_word','full_word','sentence','is_active'];



}
