<?php namespace App\Http\Controllers;

		use App\MockQuiz;
        use App\Setting;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiMockQuizResultController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "mock_quiz_result";        
				$this->permalink   = "mock_quiz_result";    
				$this->method_type = "post";    
		    }
		

		    public function hook_before(&$postdata) {

                $count_wrong = substr_count($postdata['is_correct'],0);
                $count_correct = substr_count($postdata['is_correct'],1);
                $count_questions = MockQuiz::where('id', '>' , 0)->count();
                $passing_score = Setting::where('name','mock_passing_score')->first()->content;
                $marks_per_question = Setting::where('name','mock_marks_per_question')->first()->content;
                $score = number_format((float)( ($count_correct * $marks_per_question) / $passing_score * 100), 2, '.', '');
                //set data
                $postdata['total_questions'] = $count_questions;
                $postdata['correct'] = $count_correct;
                $postdata['wrong'] = $count_wrong;
                $postdata['attempted'] = $count_wrong + $count_correct;
                $postdata['score'] = $score . "%";
                $postdata['status'] = $score >= $passing_score ? "Pass" : "Fail";
                unset($postdata['is_correct']);
		        //This method will be execute before run the main process

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}