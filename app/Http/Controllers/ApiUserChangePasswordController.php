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

                $user_data = $this->user_model->with('token')->where(['id'=> $postdata['user_id'], 'is_active'=>1])->first();

				if(empty($user_data)) {
					$this->output(sendErrorToClient('No User Found.'));
				}
				else{
					$checkpass = $this->user_model->checkPassword($postdata['user_id'],$postdata['old_password']);
					if(!$checkpass) {
						$this->output(sendErrorToClient('Old Password is Incorrect'));
					}
					else {
                        $user_data->password = \Hash::make($postdata['password']);
                        $user_data->save();
						$this->output(makeClientHappy($user_data,'Password Changed Successfully'));
					}
				}

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

            /**
             * @param string $output
             * @return \Illuminate\Http\JsonResponse
             */
            public function execute_api($output = 'API')
            {
                try{
                    $result = parent::execute_api();
                    $api_response = isset($result->original) ? $result->original : [];
                    $response = apiResponse($api_response);

                    if($api_response['api_status'] == 1){
                        return response()->json($response, 200);
                    }
                    return response()->json($response, 400);
                }
                catch (\Exception $e){
                    $response['message'] = $e->getMessage();
                    // $response['trace'] = $e->getTraceAsString();
                    return response()->json($response,400);
                }
            }

		}