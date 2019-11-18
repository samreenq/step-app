<?php namespace App\Http\Controllers;

		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiContactUsController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "contact_us";        
				$this->permalink   = "contact_us";    
				$this->method_type = "post";    
		    }


		    public function hook_before(&$postdata) {
		        unset($postdata['user_id']);

		        //This method will be execute before run the main process
               // $this->user_model->sendRegisterMail($user_data);

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process
                $this->output(makeClientHappy('','Thank you for contact, we will reach you soon.',true));
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