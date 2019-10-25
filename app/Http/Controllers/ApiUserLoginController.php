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