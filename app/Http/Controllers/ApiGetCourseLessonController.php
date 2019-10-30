<?php namespace App\Http\Controllers;

		use App\Lesson;
        use App\Quiz;
        use App\QuizResult;
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
		        //echo '<pre>';  print_r($postdata['user_id']); exit;
                $user_id = $postdata['user_id'];
		        $response = $this->lesson_model
                   // ->with(['reviews','result'])
                    ->where('course_id',$postdata['course_id'])
                    ->whereNull('deleted_at')
                    ->paginate(10);
		       // echo '<pre>'; print_r($response);

		        if($response){

                    $data = makeClientHappyWithPagination($response);
                   //
		          //  $data = $response->toArray();
		            $quiz_model = new QuizResult();

		            foreach($data['data'] as $key => $row){
                        $row = (object)$row;
                       //dd($row->id);
                        $data['data'][$key]['score'] = $quiz_model->getMaxScore($row->id,$user_id);
                        $data['data'][$key]['audio_duration'] = '';
                    }
                }
              //  echo '<pre>'; print_r($data); exit;
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