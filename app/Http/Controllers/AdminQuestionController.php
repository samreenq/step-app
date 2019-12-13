<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreMockQuestion;
use App\Http\Requests\StoreQuestion;
use App\MockQuiz;
use App\MockQuizOption;
use App\Option;
use App\Quiz;
use Illuminate\Http\Request;
use View;

class AdminQuestionController extends Controller
{
    public function __construct()
    {
        $this->quiz_model = new Quiz();
        $this->option_model = new Option();
        $this->mock_quiz_model = new MockQuiz();
        $this->mock_option_model = new MockQuizOption();

    }

    public function store(StoreQuestion $storeQuiz)
    {
        $question_id = $this->quiz_model->storeQuiz($storeQuiz);
        $this->option_model->storeOption($storeQuiz , $question_id);
        return $this->quiz_model->find($question_id);
    }

    public function storeMock(StoreMockQuestion $storeQuiz)
    {
        $question_id = $this->mock_quiz_model->storeQuiz($storeQuiz);
        $this->mock_option_model->storeOption($storeQuiz , $question_id);
        return $question_id;
    }

    public function getData(Request $request)
    {
       // die($request->topic_id);
        return View::make("quiz_add_view",['topic_id'=>$request->topic_id]);
    }
}
