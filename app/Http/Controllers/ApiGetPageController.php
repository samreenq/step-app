<?php namespace App\Http\Controllers;

		use App\ContentPage;
		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiGetPageController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "content_pages";        
				$this->permalink   = "get_page";    
				$this->method_type = "get";
				$this->page_model = new ContentPage();
		    }
		

		    public function hook_before(&$postdata) {
				$response = $this->page_model->where(['type'=>$postdata["slug"],'is_active'=>1])->first();
				$this->output(makeClientHappy($response));

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