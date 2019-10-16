<?php namespace App\Http\Controllers;

		use App\AppUser;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiUserChangePasswordController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "user_change_password";    
				$this->method_type = "post";
                $this->user_model = new AppUser();
		    }
		

		    public function hook_before(&$postdata) {

                $user_data = $this->user_model->where(['id'=> $postdata['user_id'], 'status'=>1])->first();

				if(!empty($user_data)) {
					$this->output(sendErrorToClient('No User Found.'));
				}
				else{
					$checkpass = $this->user_model->checkPassword($postdata['user_id'],$postdata['old_password']);
					if(!$checkpass) {
						$this->output(sendErrorToClient('Old Password is Incorrect'));
					}
					else {
                        $user_data->password = $postdata['password'];
                        $user_data->save();
						$this->output(makeClientHappy('Password Changed Successfully'));
					}
				}

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}