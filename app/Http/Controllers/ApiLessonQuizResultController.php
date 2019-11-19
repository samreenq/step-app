<?php namespace App\Http\Controllers;

		use App\Lesson;
        use App\LessonQuizResult;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiLessonQuizResultController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "lesson_quiz_result";        
				$this->permalink   = "lesson_quiz_result";    
				$this->method_type = "post";
				$this->model = new LessonQuizResult();
		    }
		

		    public function hook_before(&$postdata) {
		        //This method will be execute before run the main process

                //if exists update
               /* $check = $this->model->where('user_id',$postdata['user_id'])->where('lesson_id',$postdata['lesson_id'])->exists();

                if ($check) {
                    $response = $this->model->where('user_id',$postdata['user_id'])->where('lesson_id',$postdata['lesson_id'])
                        ->update([
                            'is_passed' => $postdata['is_passed'],
                        ]);

                    $lesson_model = new Lesson();
                    $data = $lesson_model->getLessonDetail($postdata['topic_id'],$postdata['lesson_id'],$postdata['user_id']);
                    $this->output(makeClientHappy($data,'Completed Successfully'));
                }*/

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {

		        //This method will be execute after run the main process
                $lesson_model = new Lesson();
                $data = $lesson_model->getLessonDetail($postdata['topic_id'],$postdata['lesson_id'],$postdata['user_id']);
                $this->output(makeClientHappy($data,'Completed Successfully'));
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