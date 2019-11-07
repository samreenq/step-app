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

                $user_data = $this->user_model->where(['platform_id'=> $postdata['platform_id']])->with('token')->first();

                if($user_data->is_active == 1){ //if user is created and active

                  //  dd($user_data->toArray());

                    if(isset($postdata['email']) && !empty($postdata['email'])) {
                        $model = $this->user_model->where('id','!=',$user_data->id)->where(['email'=> $postdata['email'],'is_active'=> '1']);
                        // $user_data = $model->count();

                        if($model->count() > 0) {
                            $this->output(sendErrorToClient('Email address already in use.'));
                        }
                        else{
                            //Update user other information
                            $this->user_model->find($user_data->id)->update($postdata);
                            $this->user_model->setAccessToken($user_data->id);
                            $user_data =  $this->user_model->with('token')->find($user_data->id);
                            $this->output(makeClientHappy($user_data));
                        }
                    }else{
                        //Update user other information
                        $this->user_model->find($user_data->id)->update($postdata);
                        $this->user_model->setAccessToken($user_data->id);
                        $user_data =  $this->user_model->with('token')->find($user_data->id);
                        $this->output(makeClientHappy($user_data));
                    }

                }
                else if($user_data->is_active == 0){ //if user is login first time or login as inactive

                    $user = false;
                    if(isset($postdata['email']) && !empty($postdata['email'])) {
                        $user = $this->user_model->where('id', '!=', $user_data->id)->where(['email' => $postdata['email']])->count();
                    }

                    if((isset($postdata['email']) && !empty($postdata['email'])) && $user){
                        $this->output(sendErrorToClient('Email address already in use.'));
                    }
                    else{

                        if(isset($user_data)){
                            $this->user_model->find($user_data->id)->update($postdata);
                        }else{
                            $postdata = filterPostRequest($postdata, $this->table);
                            $user_data = $this->user_model->create($postdata);
                        }

                        $this->user_model->setAccessToken($user_data->id);
                        $user_data = $this->user_model->with('token')->find($user_data->id);
                        $this->output(makeClientHappy($user_data));
                    }

                }
		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
               /* if($result['api_status']) {
                    $this->user_model->setAccessToken($result['id']);
                    $user_data = $this->user_model->with('token')->find($result['id']);

                    if ($user_data) {
                      //  $user_data->is_active = 0;
                       // $user_data->save();
                       // $this->user_model->sendRegisterMail($user_data);
                    }
                    $result =  makeClientHappy($user_data);
                }*/

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