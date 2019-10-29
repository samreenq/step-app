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
		        $is_notify  = isset($postdata['is_notify']) ? $postdata['is_notify'] : 0;
                $response = $this->p_model->where('id',$postdata['user_id'])->update(['is_notify' =>$is_notify]);
                if($response) {
                    $user_data = $this->p_model->with('token')->find($postdata['user_id']);
                    $this->output(makeClientHappy($user_data));
                }
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