<?php namespace App\Http\Controllers;

		use App\AppUser;
		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiUserLoginSocialController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "user_login_social";    
				$this->method_type = "post";
				$this->user_model = new AppUser();
		    }
		

		    public function hook_before(&$postdata) {
				$user_data = $this->user_model->where(['platform_id'=> $postdata['platform_id'],'is_active'=> '1'])->first();

				if($user_data) {
					$this->output(makeClientHappy($user_data));
				}
				else if(isset($postdata['email'])) {
					$user_data = $this->user_model->where(['email'=> $postdata['email'],'is_active'=> '1'])->count();
					if($user_data) {
						$this->output(sendErrorToClient('Email address already in use.'));
					}
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