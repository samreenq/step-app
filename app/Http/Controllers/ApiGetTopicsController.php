<?php namespace App\Http\Controllers;

		use App\Lesson;
        use App\LessonQuizResult;
        use App\Topic;
        use App\QuizResult;
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
                $courses = new Topic();
                $response = $courses->where('course_id',$postdata['course_id'])
                    ->where('is_active',1)
                    ->whereNull('deleted_at')
                    ->paginate(10);

                if($response){
                    // echo '<pre>'; print_r($response->toArray()); exit;
                    $data = makeClientHappyWithPagination($response);

                    $lesson_model = new Lesson();
                    $lesson_quiz_result = new LessonQuizResult();
                    $quiz_model = new QuizResult();

                    $i =0;
                    foreach($data['data'] as $key => $row){
                        $row = (object)$row;

                        $data['data'][$i]['total_lesson'] = $lesson_model->where('topic_id',$row->id)
                           ->whereNull('deleted_at')->count();

                        $data['data'][$i]['completed_lesson'] = $lesson_quiz_result->getPassedLesson($row->id,$postdata['user_id']);
                        $data['data'][$i]['score'] = $quiz_model->getMaxScore($row->id,$postdata['user_id']);

                        $i++;
                        unset($row);
                    }
                }
                // echo '<pre>'; print_r($data); exit;
                $this->output($data);
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