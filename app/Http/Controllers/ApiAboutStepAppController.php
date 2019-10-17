<?php namespace App\Http\Controllers;

		use App\Setting;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiAboutStepAppController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "cms_settings";        
				$this->permalink   = "about_step_app";    
				$this->method_type = "get";

		    }
		

		    public function hook_before(&$postdata) {
                $response = Setting::where('name','about_step_app')->first()->content;
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