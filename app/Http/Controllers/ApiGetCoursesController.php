<?php namespace App\Http\Controllers;

		use App\Course;
        use App\QuizResult;
        use App\ReadWords;
        use App\VocabularyWords;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiGetCoursesController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "courses";        
				$this->permalink   = "get_courses";    
				$this->method_type = "get";    
		    }
		

		    public function hook_before(&$postdata)
            {
                //This method will be execute before run the main process
            }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process
                if($result['api_status'] == 1){

                    $courses = new Course();
                    $data = $courses->orderBy('sort_order')->get();

                    $vocabulary_model = new VocabularyWords();
                    $total_words = $vocabulary_model->where('is_active',1)->whereNull('deleted_at')->count();

                    $read_words = new ReadWords();
                    $completed_words =  $read_words->where('user_id',$postdata['user_id'])->where('is_read',1)->whereNull('deleted_at')->count();

                    if(count($data) > 0){

                        $records = $data->toArray();
                        $quiz_result_model = new QuizResult();

                        foreach($records as $key => $row){
                            $records[$key]['completed_topic'] = $quiz_result_model->getTotalPassingTopic($row['id'],$postdata['user_id']);
                            unset($records[$key]['icon']);

                            if($row['type'] == 'vocabulary'){
                                $records[$key]['total_topics'] = $total_words;
                                $records[$key]['completed_topic'] = $completed_words;
                            }
                        }
                        $result['data'] = $records;
                    }
                    else{
                        $result['data'] = array();
                    }
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