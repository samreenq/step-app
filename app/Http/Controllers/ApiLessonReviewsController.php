<?php namespace App\Http\Controllers;

		use App\Lesson;
        use App\Review;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiLessonReviewsController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "reviews";        
				$this->permalink   = "lesson_reviews";    
				$this->method_type = "post";
				$this->model = new Review();
		    }
		

		    public function hook_before(&$postdata) {
		        //if exists update
               $check = $this->model->where('review_by',$postdata['user_id'])->where('lesson_id',$postdata['lesson_id'])->count();
                if ($check > 0) {
                    $response = $this->model->where('review_by', $postdata['user_id'])
                        ->where('lesson_id',$postdata['lesson_id'])
                        ->update([
                        'rating' => $postdata['rating'],
                        'review' => isset($postdata['review']) ? $postdata['review'] : '',
                        'review_by' => $postdata['user_id']
                    ]);


                    $lesson_model = new Lesson();
                    $lesson =  $lesson_model->where('id',$postdata['lesson_id'])->first();
                    $lesson_data = $lesson_model->getLessonData($postdata['lesson_id'],$postdata['user_id']);
                    $data = array_merge($lesson->toArray(),$lesson_data);

                    $this->output(makeClientHappy($data,'Successfully Reviewed'));
                }
                else {
                    $postdata['review_by'] = $postdata['user_id'];
                    $postdata = filterPostRequest($postdata, $this->table);
                }
		        //This method will be execute before run the main process
               //  $this->model->where('review_by',$postdata['user_id'])->where('lesson_id',$postdata['lesson_id'])->first();
		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process
              //  echo '<pre>'; print_r($result); exit;
                if($result['api_status'] == 1){
                    $lesson_model = new Lesson();
                    $lesson =  $lesson_model->where('id',$postdata['lesson_id'])->first();
                    $lesson_data = $lesson_model->getLessonData($postdata['lesson_id'],$postdata['review_by']);
                    $data = array_merge($lesson->toArray(),$lesson_data);

                    $this->output(makeClientHappy($data,'Successfully Reviewed'));
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