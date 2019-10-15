<?php namespace App\Http\Controllers;

		use App\AppUser;
		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiUserRegisterController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "user_register";    
				$this->method_type = "post";
				$this->user_model = new AppUser();
		    }
		

		    public function hook_before(&$postdata) {
				//This method will be execute before run the main process
				if($postdata['platform_type'] == 'custom' && empty($postdata['password'])) {
					$this->output(sendErrorToClient('The password field is required.'));
				}
				else {
                    $postdata = filterPostRequest($postdata, $this->table);
				}

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
                if($result['api_status']) {
                    $this->user_model->setAccessToken($result['id']);
                    $user_data = $this->user_model->with('token')->find($result['id']);

                    if ($user_data) {
                        $this->user_model->sendRegisterMail($user_data);
                    }
                    $result =  makeClientHappy($user_data);
                }
		    }

		}