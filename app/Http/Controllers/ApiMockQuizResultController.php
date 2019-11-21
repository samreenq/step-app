<?php namespace App\Http\Controllers;

		use App\MockQuiz;
        use App\MockQuizOption;
        use App\MockQuizResult;
        use App\Setting;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiMockQuizResultController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "mock_quiz_result";        
				$this->permalink   = "mock_quiz_result";    
				$this->method_type = "post";
				$this->model = new MockQuizResult();
		    }
		

		    public function hook_before(&$postdata) {

		        $quiz = is_string($postdata['quiz']) ? json_decode($postdata['quiz'],true) : $postdata['quiz'];
                //  dd($postdata);

		        if(count($quiz)>0) {

                    $count_correct = 0;
                    $count_wrong = 0;
                    $option_model = new MockQuizOption();

		            foreach($quiz as $rows){

                        //Check if answer is correct or not
                        $is_correct = $option_model->where('mock_quiz_id',$rows['question_id'])
                            ->where('id',$rows['answer_id'])->where('is_correct',1)->count();

                        if($is_correct == 1){
                            $count_correct++;
                        }
                        else{
                            $count_wrong++;
                        }
                    }

                    //$count_wrong = substr_count($postdata['is_correct'], 0);
                   // $count_correct = substr_count($postdata['is_correct'], 1);
                    $count_questions = MockQuiz::where('id', '>', 0)->count();
                    $passing_score = Setting::where('name', 'mock_passing_score')->first()->content;
                    $marks_per_question = Setting::where('name', 'mock_marks_per_question')->first()->content;
                    $score = (($count_correct * $marks_per_question) / $passing_score) * 100;
                    //set data
                    $postdata['total_questions'] = $count_questions;
                    $postdata['correct'] = $count_correct;
                    $postdata['wrong'] = $count_wrong;
                    $postdata['attempted'] = $count_wrong + $count_correct;
                    $postdata['score'] = $score;
                    $postdata['status'] = $score >= $passing_score ? "pass" : "fail";
                    unset($postdata['quiz']);
                    //This method will be execute before run the main process
                }
		        else{
                    $this->output(sendErrorToClient('Invalid Request'));
                }

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process
                $response = $this->model->find($result['id']);
                $this->output(makeClientHappy($response));

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