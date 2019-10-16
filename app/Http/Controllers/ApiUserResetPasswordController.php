<?php namespace App\Http\Controllers;

		use App\AppUser;
		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiUserResetPasswordController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "user_reset_password";    
				$this->method_type = "post";
				$this->user_model = new AppUser();
		    }
		

		    public function hook_before(&$postdata) {

				$user_data = $this->user_model->find($postdata['user_id']);

				if (!empty($postdata['password'])) {


					$user_data->password = \Hash::make($postdata['password']);
					$user_data->reset_token = NULL;
					$user_data->save();

					$this->output(makeClientHappy('Password Changed Successfully'));
				}
				elseif ($postdata['resend']) {

                    $response = $this->user_model->sendResetPassMail($user_data);
                    $this->output(makeClientHappy($response));

				}
				elseif (!empty($postdata['reset_type'])) {
					$response = $this->user_model->where(['is_active' => 1, 'id'=>$postdata['user_id'], 'reset_token'=>$postdata['code']])->count();
					$msg = (!$response ? 'Invalid Token' : 'Valid Token');
					$this->output(makeClientHappy($msg));
				}
				else {
					$this->output(sendErrorToClient('Error! Please Try Again'));
				}

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}