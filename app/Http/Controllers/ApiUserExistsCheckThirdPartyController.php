<?php namespace App\Http\Controllers;

		use App\AppUser;
		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiUserExistsCheckThirdPartyController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "user_exists_check_third_party";    
				$this->method_type = "get";
				$this->user_model = new AppUser();
		    }
		

		    public function hook_before(&$postdata) {
				$user_data = $this->user_model->with('token')->where(['platform_id' => $postdata['platform_id'], 'is_active' => 1])->first();
				$user_email = $this->user_model->where(['email' => $postdata['email'], 'is_active' => 1])->count();

				if ($user_data) {

					$device_token = (!empty($postdata['device_token']) ? $postdata['device_token'] : 'no_token');
					$user_data->device_token = $device_token;
					$user_data->save();

					$this->user_model->setAccessToken($user_data->id);
                    $this->output(makeClientHappy($user_data, 'Success'));

				} else if ($user_email > 0) {
					$this->output(sendErrorToClient('Email Already Exist.'));
				} else {
					$this->output(sendErrorToClient('Does not Exist.'));
				}

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}