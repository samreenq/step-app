<?php namespace App\Http\Controllers;

		use Session;
		use Request;
		use DB;
		use CRUDBooster;
		use App\AppUser;

		class ApiUserProfileUpdateController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "user_profile_update";    
				$this->method_type = "post";
				$this->user_model = new AppUser();
                $this->_requestSocialLogin = false;
		    }
		

		    public function hook_before(&$postdata) {

                if(isset($postdata['social_first_login'])){
                    if($postdata['social_first_login'] == 1)
                        $this->_requestSocialLogin = true;
                }
				$postdata = removeEmptyKeys($postdata);
				$postdata = filterPostRequest($postdata , $this->table);
		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
                if($result['api_status'] == 1){
                    $user_data = $this->user_model->with('token')->find($postdata['id']);

                    if( $this->_requestSocialLogin){
                        $this->user_model->sendRegisterMail($user_data);
                    }

					$result =  makeClientHappy($user_data);
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