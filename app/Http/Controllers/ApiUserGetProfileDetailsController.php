<?php namespace App\Http\Controllers;

		use App\AppUser;
		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiUserGetProfileDetailsController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "user_get_profile_details";    
				$this->method_type = "get";
				$this->user_model = new AppUser();
		    }
		

		    public function hook_before(&$postdata) {
				$user_id = !empty($postdata['id']) ? $postdata['id'] : $postdata['user_id'];
				$this->output(makeClientHappy($this->user_model->with('token')->find($user_id)));

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}