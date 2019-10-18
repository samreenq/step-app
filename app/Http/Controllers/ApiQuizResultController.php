<?php namespace App\Http\Controllers;

		use App\Lesson;
        use App\Quiz;
        use App\QuizResult;
        use App\Setting;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiQuizResultController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "quiz_result";        
				$this->permalink   = "quiz_result";    
				$this->method_type = "post";
		    }
		

		    public function hook_before(&$postdata) {
		        //delete if already exists
                QuizResult::where('lesson_id',$postdata['lesson_id'])->where('user_id',$postdata['user_id'])->delete();
		        $count_wrong = substr_count($postdata['is_correct'],0);
		        $count_correct = substr_count($postdata['is_correct'],1);
		        $count_questions = Quiz::where('lesson_id',$postdata['lesson_id'])->count();
		        $passing_score = Setting::where('name','passing_score')->first()->content;
		        $marks_per_question = Setting::where('name','marks_per_question')->first()->content;
		        $score = number_format((float)( ($count_correct * $marks_per_question) / $passing_score * 100), 2, '.', '');
		        //set data
                $postdata['total_questions'] = $count_questions;
                $postdata['correct'] = $count_correct;
                $postdata['wrong'] = $count_wrong;
                $postdata['attempted'] = $count_wrong + $count_correct;
                $postdata['score'] = $score . "%";
                $postdata['status'] = $score >= $passing_score ? "Pass" : "Fail";
                $postdata['course_id'] = Lesson::where('id',$postdata['lesson_id'])->first()->course_id;
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