<?php namespace App\Http\Controllers;

		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiLessonReviewsController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "reviews";        
				$this->permalink   = "lesson_reviews";    
				$this->method_type = "post";    
		    }
		

		    public function hook_before(&$postdata) {
                $postdata['review_by'] = $postdata['user_id'];
                $postdata = filterPostRequest($postdata,$this->table);
		        //This method will be execute before run the main process

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}