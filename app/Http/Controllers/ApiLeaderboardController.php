<?php namespace App\Http\Controllers;

		use App\AppUser;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiLeaderboardController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "leaderboard";    
				$this->method_type = "get";    
		    }
		

		    public function hook_before(&$postdata) {
		        //This method will be execute before run the main process
                $data = [];
                $app_user_model = new AppUser();
                $response = $app_user_model->where('is_active',1)
                    ->where('avg_mock_score','>',0)
                    ->whereNull('deleted_at')
                    ->orderBy('avg_mock_score','DESC')
                    ->paginate(10);

                if($response){
                    // echo '<pre>'; print_r($response->toArray()); exit;
                    $data = makeClientHappyWithPagination($response);
                }
                // echo '<pre>'; print_r($data); exit;
                $this->output($data);

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