<?php namespace App\Http\Controllers;

		use App\Course;
        use App\Lesson;
        use App\Quiz;
        use App\QuizResult;
        use App\QuizSummary;
        use Illuminate\Support\Facades\Storage;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiGetCourseLessonController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "lessons";        
				$this->permalink   = "get_course_lesson";    
				$this->method_type = "get";
				$this->lesson_model = new Lesson();
		    }
		

		    public function hook_before(&$postdata) {

		        $course = Course::where('type',$postdata['type'])->first();
		        if(!$course){
                    $this->output(sendErrorToClient('Invalid Course type'));
                }
		        $course_id = $course->id;
                $user_id = $postdata['user_id'];
		       /* $response = $this->lesson_model
                    ->leftJoin('courses','courses.id','=',$this->table.'.course_id')
                   // ->with(['reviews','result'])
                    ->where('courses.type',$postdata['type'])
                    ->whereNull($this->table.'.deleted_at')
                    ->paginate(10);*/

                $response = $this->lesson_model
                    ->where('course_id',$course_id)
                    ->whereNull('deleted_at')
                    ->paginate(10);

		        if($response){
                   // echo '<pre>'; print_r($response->toArray()); exit;
                    $data = makeClientHappyWithPagination($response);

                   //
		            $quiz_model = new QuizResult();
		            $quiz_summary = new QuizSummary();
                    $i =0;
		            foreach($data['data'] as $key => $row){
                        $row = (object)$row;

                       $quiz_summary = $quiz_summary->where('topic_id',$row->topic_id)->first();

                        $data['data'][$i]['score'] = $quiz_model->getMaxScore($row->topic_id,$user_id);
                        $data['data'][$i]['audio_duration'] = '';
                        $data['data'][$i]['quiz_summary'] = isset($quiz_summary->id) ? $quiz_summary : new \StdClass();
                        $i++;
                        unset($row);
                    }
                }
               // echo '<pre>'; print_r($data); exit;
		        $this->output($data);
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