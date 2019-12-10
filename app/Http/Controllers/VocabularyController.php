<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\VocabularyWords;
use App\VocabularyWordsLang;
use crocodicstudio\crudbooster\helpers\CRUDBooster;
use Illuminate\Http\Request;
use View;
use Validator;
/**
 * Class VocabularyController
 */
Class VocabularyController extends Controller
{

    /**
     * VocabularyController constructor.
     */
    public function __construct()
    {
        $this->_model = new VocabularyWords();
        $this->_modelLang = new VocabularyWordsLang();
    }

    public function getByIdentifier(Request $request)
    {

        $word_id = CRUDBooster::getCurrentId();
        $return = [];
        $rules = array(
            'lang' => 'required',
          //  'word_id' => 'required'
        );

        $validator = Validator::make((array)$request->all(), $rules);

        if ($validator->fails()) {
            $return['error'] = 1;
            $return['message'] = $validator->errors()->first();
        }
        else{

            $return['error'] = 0;

            if($request->lang == 'ar'){
                $data  =  $this->_modelLang->where('word_id',$word_id)
                    ->where('lang','ar')->first();

            }else{
                $data = $this->_model->find($word_id);
            }

          //  echo '<pre>'; print_r($data);
            $return['data'] = isset($data->first_word) ?  $data : new \StdClass();
        }

        return $return;

    }



}