<?php

namespace App\Http\Controllers;

use App\Http\Requests\QuizSummaryRequest;
use App\QuizSummary;
use Illuminate\Http\Request;
use View;

class QuizSummaryController extends Controller
{
    public function __construct()
    {
        $this->_model = new QuizSummary();

    }

    public function store(QuizSummaryRequest $storeSummary)
    {
        if(isset($storeSummary->id) && !empty($storeSummary->id)){
             $this->_model->find($storeSummary->id)->update($storeSummary->all());
             return $this->_model->find($storeSummary->id);
        }
        else{
            return $this->_model->create($storeSummary->all());
        }

    }

    public function getData(Request $request)
    {
      // $data =  $this->_model->get();
       $data = $this->_model->where('topic_id',$request->topic_id)->first();
        $raw = ($data) ? $data->toArray() : [];
        return View::make("/quiz_summary",['data'=>$raw]);
    }

}