<?php

namespace App\Repositories;

use Validator;

Class CommonLib
{

    public function validateTitle($params,$table,$column,$id)
    {
        $data = [];
        $messages = array(

        );
        $validator = Validator::make(
            $params,
            [
                $column => 'unique:' .$table . ','.$column.','.$id.',id,deleted_at,NULL'
            ],$messages
        );

        if($validator->fails()) {
            $data['error'] = 1;
            $data['message'] = $validator->errors()->first();
        }

        return $data;
    }

}