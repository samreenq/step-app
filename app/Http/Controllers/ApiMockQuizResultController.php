<?php namespace App\Http\Controllers;

		use App\AppUser;
        use App\MockQuiz;
        use App\MockQuizOption;
        use App\MockQuizResult;
        use App\MockQuizResultDetail;
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
				$this->quizDetail = [];
		    }
		

		    public function hook_before(&$postdata) {

		        $quiz = is_string($postdata['quiz']) ? json_decode($postdata['quiz'],true) : $postdata['quiz'];

                $count_questions = MockQuiz::where('id', '>', 0)->count();

                if(is_string($postdata['quiz']) && (is_array($quiz) && count($quiz) > 0)) {
                    //  dd($postdata);

                    $count_correct = 0;
                    $count_wrong = 0;
                    $mock_quiz_model = new MockQuiz();
                    $option_model = new MockQuizOption();

                    foreach ($quiz as $rows) {

                        //Check if answer is correct or not
                        $is_correct = $option_model->where('mock_quiz_id', $rows['question_id'])
                            ->where('id', $rows['answer_id'])->where('is_correct', 1)->count();

                        if ($is_correct == 1) {
                            $count_correct++;
                        } else {
                            $count_wrong++;
                        }

                        $course_type = $postdata['course_type'];

                        if(!isset($postdata['course_type'])){
                            $mock_quiz_raw =  $mock_quiz_model->select('course_type')
                                ->where('id', $rows['question_id'])->first();

                            $course_type =  $mock_quiz_raw->course_type;
                           // echo '<pre>'; print_r($mock_quiz_raw->course_type); exit;
                        }

                        $rows['user_id'] = $postdata['user_id'];
                        $rows['course_type'] = $course_type;
                        $rows['is_correct'] = $is_correct;
                        $this->quizDetail[] = $rows;
                    }

                    //$count_wrong = substr_count($postdata['is_correct'], 0);
                    // $count_correct = substr_count($postdata['is_correct'], 1);

                    $passing_score = Setting::where('name', 'mock_passing_score')->first()->content;
                    $marks_per_question = Setting::where('name', 'mock_marks_per_question')->first()->content;
                    $obtained_marks = $count_correct * $marks_per_question;
                    $total_marks = $count_questions*$marks_per_question;
                    $score = ($obtained_marks / $total_marks) * 100;

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
                    //set data
                    $postdata['total_questions'] = $count_questions;
                    $postdata['correct'] = 0;
                    $postdata['wrong'] = 0;
                    $postdata['attempted'] = 0;
                    $postdata['score'] = 0;
                    $postdata['status'] = "fail";
                    unset($postdata['quiz']);
                }

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process
                if($result['api_status'] == 1){
                    //Save Quiz Detail
                    $mock_quiz_detail = new MockQuizResultDetail();

                    if(count($this->quizDetail)>0){
                        foreach($this->quizDetail as $key => $quiz_detail){

                            $this->quizDetail[$key]['quiz_result_id'] = $result['id'];
                            $mock_quiz_detail->create($this->quizDetail[$key]);
                        }
                    }

                    //Update App User for score update
                    $max_quiz_result =   $this->model->getQuizResult($postdata['user_id']);
                    $crown_badge_score = CRUDBooster::getSetting("crown_badge_score");
                    $gold_badge_score = CRUDBooster::getSetting("gold_badge_score");
                    $silver_badge_score = CRUDBooster::getSetting("silver_badge_score");

                    $badge = '';
                    if($max_quiz_result['score'] >= $crown_badge_score){
                        $badge = 'bronze';
                    }
                    elseif($max_quiz_result['score'] >= $gold_badge_score && $max_quiz_result['score'] < $crown_badge_score){
                        $badge = 'gold';
                    }
                    elseif($max_quiz_result['score'] >= $silver_badge_score && $max_quiz_result['score'] < $gold_badge_score){
                        $badge = 'silver';
                    }


                    $app_user_model = new AppUser();
                    $app_user_model->find($postdata['user_id'])->update(
                        ['avg_mock_score' => $max_quiz_result['score'],
                            'badge' => $badge]
                    );


                    $response = $this->model->find($result['id']);
                    $this->output(makeClientHappy($response));
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