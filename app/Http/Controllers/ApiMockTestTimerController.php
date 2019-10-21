<?php namespace App\Http\Controllers;

		use App\Setting;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiMockTestTimerController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "cms_settings";        
				$this->permalink   = "mock_test_timer";    
				$this->method_type = "get";
				$this->p_model = new Setting();
		    }
		

		    public function hook_before(&$postdata) {
		        $response = Setting::where('name','mock_test_timer')->first()->content;
                if($response) {
                    $this->output(makeClientHappy($response));
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