<?php namespace App\Http\Controllers;

		use App\Quiz;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiQuizListController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "quizzes";        
				$this->permalink   = "quiz_list";    
				$this->method_type = "get";
				$this->p_model = new Quiz();
		    }
		

		    public function hook_before(&$postdata) {
                $response = $this->p_model->with(['options'])->get();
                $this->output(makeClientHappy($response));
		        //This method will be execute before run the main process

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}