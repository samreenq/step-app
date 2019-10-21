<?php namespace App\Http\Controllers;

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
		    }
		

		    public function hook_before(&$postdata) {
		        //if exists update
                $check = Review::where('review_by',$postdata['user_id'])->where('lesson_id',$postdata['lesson_id'])->exists();

                if ($check) {
                    $response = Review::where('review_by', $postdata['user_id'])
                        ->update([
                        'rating' => $postdata['rating'],
                        'review' => $postdata['review'],
                        'review_by' => $postdata['user_id']
                    ]);
                    if($response) {
                        $this->output(makeClientHappy($response));
                    }
                }
                else {
                    $postdata['review_by'] = $postdata['user_id'];
                    $postdata = filterPostRequest($postdata, $this->table);
                }
		        //This method will be execute before run the main process

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}