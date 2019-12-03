<?php

namespace App\Http\Controllers;

use App\Http\Requests\MockSummaryRequest;
use App\MockSummary;
use Illuminate\Http\Request;
use View;

class MockSummaryController extends Controller
{
    public function __construct()
    {
        $this->_model = new MockSummary();

    }

    public function store(MockSummaryRequest $storeSummary)
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
       $data = $this->_model->where('is_active',1)->whereNull('deleted_at')->first();
        $raw = ($data) ? $data->toArray() : [];

        return View::make("/mock_summary",['data'=>$raw]);
    }

}