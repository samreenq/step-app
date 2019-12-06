<?php namespace App\Http\Controllers;

		use App\ReadWords;
        use App\VocabularyWords;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiReadWordController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "read_words";        
				$this->permalink   = "read_word";    
				$this->method_type = "post";
				$this->model = new ReadWords();
		    }
		

		    public function hook_before(&$postdata) {
		        //This method will be execute before run the main process
                $already_read = $this->model->where('user_id',$postdata['user_id'])
                    ->where('word_id',$postdata['word_id']);


                if($already_read->count() > 0){
                    $row = $already_read->first();
                   // echo '<pre>'; print_r($row['id']); exit;
                    $vocabulary_model = new VocabularyWords();
                    $data = $vocabulary_model->getUserVocabulary($postdata['word_id'],$postdata['user_id']);

                    $this->output(makeClientHappy($data));
                }
                else{
                    $postdata['is_read'] = 1;
                }
		    }

		    public function hook_query(&$query) {
		        //This method is to customize the sql query

		    }

		    public function hook_after($postdata,&$result) {
		        //This method will be execute after run the main process
                if($result['api_status'] == 1){

                    $vocabulary_model = new VocabularyWords();
                    $data = $vocabulary_model->getUserVocabulary($postdata['word_id'],$postdata['user_id']);
                    $this->output(makeClientHappy($data));
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