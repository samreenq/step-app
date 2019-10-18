<?php namespace App\Http\Controllers;

		use App\Lesson;
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
		        $response = $this->lesson_model
                    ->with(['reviews','result'])
                    ->where('course_id',$postdata['course_id'])
                    ->whereNull('deleted_at')
                    ->get();
		        $this->output(makeClientHappy($response));
		        //This method will be execute before run the main process

		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process

		    }

		}