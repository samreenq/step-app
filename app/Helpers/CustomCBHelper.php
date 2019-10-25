<?php

function updateData(String $table, String $matchingData, array $data, String $findingColumn = 'id')
{
    if (!empty($data['password'])) {
        $data['password'] = \Hash::make($data['password']);
    }
    return \DB::table($table)->where($findingColumn, $matchingData)->update($data);
}

function getData(String $table, array $whereData, $extendedQuery = false, $limit = false, $offset = false, $count = false)
{
    $query = \DB::table($table);

    if (Schema::hasColumn($table, 'deleted_at')) {
        $query->whereNull('deleted_at');
    }

    if (Schema::hasColumn($table, 'password')) {
        $query->select(array_diff(Schema::getColumnListing($table), ['password']));
    }

    if ($whereData) {
        $query->where($whereData);
    }

    if ($extendedQuery) {
        $query->select($extendedQuery);
    }

    if ($count) {
        return $query->count();
    }

    if ($offset) {
        $value = $query->skip($offset);
    }

    if ($limit) {
        $value = $query->take($limit)->get();
    } else {
        if ($query->count() === 1) {
            $value = $query->first();
        } else if ($query->count() > 1) {
            $value = $query->get();
        } else {
            $value = false;
        }
    }

    return $value;

}

function deleteDatabyid($table, $id)
{
    return \DB::table($table)->where('id', $id)->delete();
}

function deleteData($table, $whereData)
{
    return \DB::table($table)->where($whereData)->delete();
}

function insertData($table, $data)
{
    return \DB::table($table)->insert($data);
}

function getNowDateTime()
{
    return \Carbon\Carbon::now()->format('Y-m-d H:i:s');
}

function sendErrorToClient($msg, $data = false)
{
    $result = [];
    $result['api_status'] = 0;
    $result['api_message'] = $msg;
    if ($data !== false) {
        $result['data'] = $data;
    }
   // http_response_code(500);
    return $result;
}

function makeClientHappy($data, $msg = 'success')
{
    $result = [];
    $result['api_status'] = 1;
    $result['api_message'] = $msg;

    if(isset($data)){
        $data = $data->toArray();
    }

    $result['data'] = $data;


    return $result;
}

function hook_data($arr, $columns_to_hook)
{

    foreach ($columns_to_hook as $data) {
        if (isset($arr->{$data['column_name']})) {
            $arr->{$data['column_name']} = getData($data['table_name'], [['id', $arr->{$data['column_name']}]]);
        }
    }
    return $arr;
}

function getNowTime()
{
    return date('H:i:s');
}

function getNowDate()
{
    return date('Y-m-d');
}

function makeClientHappyWithPagination($data, $msg = 'success')
{
    $data = $data->toArray();
    $result = [];
    $result['api_status'] = 1;
    $result['api_message'] = $msg;

    $result['data'] = $data['data'];
    unset($data['data']);
    $result['page'] = $data;

    return $result;
}


function cron_log($slug)
{
    \DB::table('cron_logs')->insert([
        'cron_name' => $slug,
        'created_at' => getNowDateTime()
    ]);
}

function uploadCustomFile($file)
{
    $name = time() . $file->getClientOriginalName();
    $file->move(public_path() . '/files/', $name);
    return '/files/' . $name;
}

function filterPostRequest($postdata, $table)
{
    $columns = \Schema::getColumnListing($table);

    foreach ($postdata as $key => $value1) {
        if (!in_array($key, $columns)) {
            unset($postdata[$key]);
        }
    }
    return $postdata;
}

function filterHeaders($postdata, $arr)
{

    foreach ($postdata as $key => $val) {
        if (in_array($key, $arr)) {
            unset($postdata[$key]);
        }
    }
    return $postdata;
}

function removeEmptyKeys($postdata)
{
    foreach ($postdata as $key => $value1) {
        if (empty($value1) && $value1 != 0) {
            unset($postdata[$key]);
        }
    }
    return $postdata;
}

function createReferralCode($name = 'spotit')
{
    $refname = str_replace(' ', '', $name);
    $ref_code = substr($refname, 0, 5) . rand(1000, 9999);
    return $ref_code;
}


function uploadFile($file, $user_id = null, $encrypt = false)
{
    $src = "";
    $thumbnail = "";
    $file_size = "";
    $basename = str_slug(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME));
    $ext = $file->getClientOriginalExtension();

    if (in_array(strtolower($ext), ['jpg', 'jpeg', 'png', 'bmp', 'pdf', 'doc', 'docx'])) {
        $file_size_kb = $file->getSize() / 1024;
        $file_size = ($file_size_kb > 1024 ? (round($file_size_kb / 1024, 2)) . ' MB' : (round($file_size_kb, 2)) . ' KB');
        $file_name = ($encrypt == true ? md5(str_random(5)) : time() . $basename) . '.' . $ext;
        $file_path = 'uploads/' . $user_id;

        //Create Directory Monthly
        Storage::makeDirectory($file_path);

        if (Storage::putFileAs($file_path, $file, $file_name)) {
            $src = $file_path . '/' . $file_name;

            if (in_array(strtolower($ext), ['jpg', 'jpeg', 'png', 'bmp'])) {
                //Create Thumbnail
                $img = Image::make($file);
                $img->resize(null, 200, function ($constraint) {
                    $constraint->aspectRatio();
                });
                $resource = $img->stream()->detach();

                //Save Thumbnail
                $file_path = 'uploads/' . $user_id . '/thumbnail/';
                $thumbnail = $file_path . $file_name;
                Storage::disk('s3')->put($thumbnail, $resource);
            }
        }
    }
    return ['src' => $src, 'thumbnail' => $thumbnail, 'filename' => $file->getClientOriginalName(), 'filesize' => $file_size];
}

function get_nearest_timezone($cur_lat, $cur_long, $country_code = '') {
    $timezone_ids = ($country_code) ? DateTimeZone::listIdentifiers(DateTimeZone::PER_COUNTRY, $country_code)
        : DateTimeZone::listIdentifiers();

    if($timezone_ids && is_array($timezone_ids) && isset($timezone_ids[0])) {

        $time_zone = '';
        $tz_distance = 0;

        //only one identifier?
        if (count($timezone_ids) == 1) {
            $time_zone = $timezone_ids[0];
        } else {
            foreach($timezone_ids as $timezone_id) {
                $timezone = new DateTimeZone($timezone_id);
                $location = $timezone->getLocation();
                $tz_lat   = $location['latitude'];
                $tz_long  = $location['longitude'];

                $theta    = $cur_long - $tz_long;
                $distance = (sin(deg2rad($cur_lat)) * sin(deg2rad($tz_lat)))
                    + (cos(deg2rad($cur_lat)) * cos(deg2rad($tz_lat)) * cos(deg2rad($theta)));
                $distance = acos($distance);
                $distance = abs(rad2deg($distance));
                // echo '<br />'.$timezone_id.' '.$distance;

                if (!$time_zone || $tz_distance > $distance) {
                    $time_zone   = $timezone_id;
                    $tz_distance = $distance;
                }

            }
        }
        return  $time_zone;
    }
    return 'unknown';
}

/**
 * @param $response
 * @return array
 */
function apiResponse($response)
{
   // dd($response);
    $result = [];
   // $result['status'] = isset($response['api_status']) ? $response['api_status'] : 0;

    if($response['api_status'] == 1){
        $result['message'] = isset($response['api_message']) ? $response['api_message'] : 'success';
    }else{
        $result['message'] = isset($response['api_message']) ? $response['api_message'] : 'No Response Found';
    }
       if(isset($response['data'])){
           $result['data'] = $response['data'];
       }

    return $result;
}

?>
    