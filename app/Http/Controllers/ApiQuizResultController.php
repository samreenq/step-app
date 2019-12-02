<?php namespace App\Http\Controllers;

		use App\Course;
        use App\Option;
        use App\Quiz;
        use App\QuizResult;
        use App\Setting;
        use App\Topic;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiQuizResultController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "quiz_result";        
				$this->permalink   = "quiz_result";    
				$this->method_type = "post";
				$this->model = new QuizResult();
		    }
		

		    public function hook_before(&$postdata) {

                $count_questions = Quiz::where('topic_id', $postdata['topic_id'])->count();
                $quiz = is_string($postdata['quiz']) ? json_decode($postdata['quiz'], true) : $postdata['quiz'];
                    //  dd($postdata);
                if(is_string($postdata['quiz']) && (is_array($quiz) && count($quiz) > 0)) {

                        $count_correct = 0;
                        $count_wrong = 0;

                        $option_model = new Option();
                        foreach ($quiz as $rows) {

                            //Check if answer is correct or not
                            $is_correct = $option_model->where('quiz_id', $rows['question_id'])
                                ->where('id', $rows['answer_id'])->where('is_correct', 1)->count();


                            if ($is_correct == 1) {
                                $count_correct++;
                            } else {
                                $count_wrong++;
                            }
                        }


                        $passing_score = Setting::where('name', 'passing_score')->first()->content;
                        $marks_per_question = Setting::where('name', 'marks_per_question')->first()->content;
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

                    $postdata['total_questions'] = $count_questions;
                    $postdata['correct'] = 0;
                    $postdata['wrong'] = 0;
                    $postdata['attempted'] = 0;
                    $postdata['score'] = 0;
                    $postdata['status'] = "fail";
                    unset($postdata['quiz']);

                    //$this->output(sendErrorToClient('Invalid Request'));
                }

                //This method will be execute before run the main process

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

                if($result['api_status'] == 1){

                    $response = [];
                    $response['result'] = $this->model->find($result['id']);

                    $course_model = new Course();
                    $course_data  = $course_model->where('id',$postdata['topic_id'])->first();
                    $course = isset($course_data->id) ? $course_data->toArray(): [];

                    $course['completed_topic'] = $this->model->getTotalPassingTopic($postdata['topic_id'],$postdata['user_id']);
                    unset($course['icon']);

                    $response['course'] = $course;

                    $topic_model = new Topic();
                    $topic =  $topic_model->where('id',$postdata['topic_id'])->first();
                    $topic_data = $topic_model->getTopicData($postdata['topic_id'],$postdata['user_id']);
                    $response['topic'] = array_merge(isset($topic->id) ? $topic->toArray() : array(),$topic_data);

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