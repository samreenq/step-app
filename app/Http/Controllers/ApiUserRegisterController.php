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
                        $user_data->verification_token = $result['id'].time();
                        $user_data->save();
                        $this->user_model->sendRegisterMail($user_data);
                    }
                   // $result =  makeClientHappy($user_data);
                    $this->output(sendErrorToClient('Please check email to activate your account'));
                }
		    }

            /**
             * @param string $output
             * @return \Illuminate\Http\JsonResponse
             */
            public function execute_api($output = 'API')
            {
                try{
                    $result = parent::execute_api();
                    //echo '<pre>'; print_r($result->original); exit;
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