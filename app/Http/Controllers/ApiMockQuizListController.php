<?php namespace App\Http\Controllers;

		use App\ContentPage;
        use App\MockQuiz;
        use App\MockSummary;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiMockQuizListController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "mock_quizzes";        
				$this->permalink   = "mock_quiz_list";    
				$this->method_type = "get";
				$this->p_model = new MockQuiz();
		    }
		

		    public function hook_before(&$postdata) {

                $quiz_summary_model = new MockSummary();
                $response['summary'] = $quiz_summary_model
                    ->where('is_active',1)
                    ->first();

                $response['quiz'] = $this->p_model->with(['options'])->get();

                $content_page_model = new ContentPage();
                $response['about'] =  $content_page_model->where('type','about-mock-quiz')->first();

                $this->output(makeClientHappy($response));
		        //This method will be execute before run the main process

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