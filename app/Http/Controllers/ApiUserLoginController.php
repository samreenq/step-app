<?php namespace App\Http\Controllers;

		use App\AppUser;
		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiUserLoginController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "user_login";    
				$this->method_type = "post";  
				$this->user_model = new AppUser();
		    }
		

		    public function hook_before(&$postdata) {
				$response = $this->user_model->authenticateUser($postdata);
                if($response['api_status']){
                    $this->output(makeClientHappy($response['data']));
                }
                else {
                    $this->output(sendErrorToClient($response['data']));
                }

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}