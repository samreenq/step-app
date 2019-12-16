<?php namespace App\Http\Controllers;

		use App\MockQuizResult;
        use App\Quiz;
        use App\QuizResult;
        use App\Topic;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiQuizGraphController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "quiz_result";        
				$this->permalink   = "quiz_graph";    
				$this->method_type = "get";    
		    }
		

		    public function hook_before(&$postdata) {
		        //This method will be execute before run the main process
                $response = [];
                $quiz_result_model = new QuizResult();
                $response['quiz_result'] = $quiz_result_model->quizStats($postdata['user_id']);

                $mock_quiz_model = new MockQuizResult();
               $response['mock_result'] = $mock_quiz_model->quizStats($postdata['user_id']);


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
                    // echo '<pre>'; print_r($result->original); exit;
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