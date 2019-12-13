<?php
namespace App\Http\Controllers;

use App\Http\Requests\LessonQuizRequest;
use App\LessonQuizOption;
use Illuminate\Http\Request;
use View;
use App\LessonQuiz;

Class LessonQuizController extends Controller
{

    public function __construct()
    {
       $this->_model = new LessonQuiz();

    }

    public function store(LessonQuizRequest $storeQuiz)
    {
        //echo '<pre>'; print_r($storeQuiz->all()); exit;
        if(isset($storeQuiz->lesson_quiz_id) && !empty($storeQuiz->lesson_quiz_id)){

            $this->_model->find($storeQuiz->lesson_quiz_id)->update(['question'=>$storeQuiz->question]);
            //Store Option
            $lesson_quiz_option = new LessonQuizOption();
            $lesson_quiz_option->storeOptions($storeQuiz->all());

            return $this->_model->find($storeQuiz->lesson_quiz_id);
        }
        else{
            $data = $this->_model->create($storeQuiz->all());

            $params = $storeQuiz->all();
            $params['lesson_quiz_id'] = $data->id;

            $lesson_quiz_option = new LessonQuizOption();
            $lesson_quiz_option->storeOptions($params);

            return $data;
        }

    }

    public function getData(Request $request)
    {
        $model = new LessonQuiz();
        $data = $model->with('options')->where('lesson_id',$request->lesson_id)
            ->where('is_active',1)
            ->whereNull('deleted_at')
            ->first();

        $raw = ($data) ? $data->toArray() : [];
        $raw['lesson_id'] = $request->lesson_id;
        //echo '<pre>'; print_r($raw); exit;

        return View::make("lesson_quiz_add",['data'=>json_decode(json_encode($raw))]);
    }


}