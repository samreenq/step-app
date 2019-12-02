<?php namespace App\Http\Controllers;


        use App\Topic;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiGetTopicsController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "topics";        
				$this->permalink   = "get_topics";    
				$this->method_type = "get";    
		    }
		

		    public function hook_before(&$postdata) {
		        //This method will be execute before run the main process

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

                if($result['api_status'] == 1){

                    $topic_model = new Topic();
                    $response = $topic_model->where('course_id',$postdata['course_id'])
                        ->where('is_active',1)
                        ->whereNull('deleted_at')
                        ->paginate(10);

                    if($response){
                        // echo '<pre>'; print_r($response->toArray()); exit;
                        $data = makeClientHappyWithPagination($response);

                        $i =0;
                        foreach($data['data'] as $key => $row){
                            $row = (object)$row;

                            $topic_data = $topic_model->getTopicData($row->id,$postdata['user_id']);
                            $data['data'][$i] = array_merge( $data['data'][$i],$topic_data);

                            $i++;
                            unset($row);
                        }
                    }
                    // echo '<pre>'; print_r($data); exit;
                    $this->output($data);
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