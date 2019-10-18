<?php namespace App\Http\Controllers;

        use App\QuizResult;
		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiQuizOverallResultController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "quiz_result";        
				$this->permalink   = "quiz_overall_result";    
				$this->method_type = "get";
				$this->p_model = new QuizResult();
		    }
		

		    public function hook_before(&$postdata) {
		        $response = $this->p_model->with(['course'])->where('user_id',$postdata['user_id'])->get();
                if($response) {
                    $this->output(makeClientHappy($response));
                }
		        //This method will be execute before run the main process

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}