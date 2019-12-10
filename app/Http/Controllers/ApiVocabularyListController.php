<?php namespace App\Http\Controllers;

		use App\VocabularyWords;
        use Session;
		use Request;
		use DB;
		use CRUDBooster;

		class ApiVocabularyListController extends \crocodicstudio\crudbooster\controllers\ApiController {

		    function __construct() {    
				$this->table       = "vocabulary_words";        
				$this->permalink   = "vocabulary_list";    
				$this->method_type = "get";    
		    }
		

		    public function hook_before(&$postdata) {
		        //This method will be execute before run the main process
                $data = [];
                $model = new VocabularyWords();
                $user_id = $postdata['user_id'];
                $response = $model->select($this->table.'.*',DB::raw('IFNULL(read_words.is_read, 0) as is_read'))
                    ->with('arabic')
                   // ->leftJoin('read_words','read_words.word_id','=',$this->table.'.id')
                    ->leftJoin('read_words', function($join) use ($user_id) {
                        $join->on('read_words.word_id','=',$this->table.'.id')
                        ->where('read_words.user_id','=', $user_id);
                    })
                    ->where($this->table.'.is_active',1)
                    ->whereNull($this->table.'.deleted_at')
                    ->orderBy($this->table.'.id')
                    ->paginate(10);

                if($response){
                    $data = makeClientHappyWithPagination($response);
                }
               // echo '<pre>'; print_r($data); exit;
                $this->output($data);
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