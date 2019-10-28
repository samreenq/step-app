<?php namespace App\Http\Controllers;

		use App\AppUser;
		use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiUserLoginSocialController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "app_users";        
				$this->permalink   = "user_login_social";    
				$this->method_type = "post";
				$this->user_model = new AppUser();
		    }
		

		    public function hook_before(&$postdata) {
				$user_data = $this->user_model->where(['platform_id'=> $postdata['platform_id'],'is_active'=> '1'])->with('token')->first();
                //echo '<pre>'; print_r($user_data->id); exit;
				if($user_data) {

                    if(isset($postdata['email'])) {
                        $model = $this->user_model->where('id','!=',$user_data->id)->where(['email'=> $postdata['email'],'is_active'=> '1']);
                       // $user_data = $model->count();
                       // dd($model->count());
                        if($model->count() > 0) {
                            $this->output(sendErrorToClient('Email address already in use.'));
                        }
                        else{
                            //Update user other information
                           $this->user_model->find($user_data->id)->update($postdata);
                           // $user_data['id'] = $user_data->id;
                            $user_data =  $this->user_model->with('token')->find($user_data->id);
                            $this->output(makeClientHappy($user_data));
                        }
                    }

				}
				else if(isset($postdata['email'])) {
					$user_data = $this->user_model->where(['email'=> $postdata['email'],'is_active'=> '1'])->count();
					if($user_data) {
						$this->output(sendErrorToClient('Email address already in use.'));
					}
				}
		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
                if($result['api_status']) {
                    $this->user_model->setAccessToken($result['id']);
                    $user_data = $this->user_model->with('token')->find($result['id']);

                    if ($user_data) {
                        $user_data->is_active = 1;
                        $user_data->save();
                       // $this->user_model->sendRegisterMail($user_data);
                    }
                    $result =  makeClientHappy($user_data);
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
                    //echo '<pre>'; print_r($result->original); exit;
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