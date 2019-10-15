<?php namespace App\Http\Controllers;

		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiUserProfileUpdateController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "user_profile_update";    
				$this->method_type = "post";
				$this->user_model = new AppUser();
		    }
		

		    public function hook_before(&$postdata) {
				$postdata = removeEmptyKeys($postdata);
				$postdata = filterPostRequest($postdata , $this->table);

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
				if($result['api_status']) {

					$user_data = $this->user_model->find($result['id']);

					$result =  makeClientHappy($user_data);
				}

		    }

		}