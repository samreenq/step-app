<?php namespace App\Http\Controllers;

		use App\AppUser;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiNotificationSettingController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "cms_settings";        
				$this->permalink   = "notification_setting";    
				$this->method_type = "post";
				$this->p_model = new AppUser();
		    }
		

		    public function hook_before(&$postdata) {
                $response = $this->p_model->where('id',$postdata['user_id'])->update(['is_notify' => $postdata['status']]);
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