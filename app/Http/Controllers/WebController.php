<?php
namespace App\Http\Controllers;
use App\AppUser;
use App\Http\Controllers\Controller;
use crocodicstudio\crudbooster\helpers\CRUDBooster;
use Illuminate\Http\Request;
use View;

/**
 * Class WebController
 * @package App\Http\Controllers
 */
class WebController extends Controller {

    public $_assignData;

    /**
     * WebController constructor.
     */
    public function __construct()
    {
        $this->_assignData['app_name'] = CRUDBooster::getSetting('appname');
    }

    /**
     * @param Request $request
     * @return mixed
     */
    public function resetPassword(Request $request)
    {
        if($request->do_post){
           $data = $this->_resetPassword($request);
        }
        else {
            if (isset($request->token)) {

                $data['is_error'] = 0;
                //print_r($request->token);
                $app_user = new AppUser();
                $user = $app_user->where('reset_token', $request->token)->first();

                if (isset($user)) {
                    $data['user'] = $user->toArray();
                    // echo '<pre>'; print_r($data); exit;
                } else {
                    $data['is_error'] = 1;
                    $data['error'] = 'Invalid request, user does not exist';
                }

            } else {
                $data['is_error'] = 1;
                $data['error'] = 'Invalid Request';
            }
        }


       return View::make('reset-password',array_merge($this->_assignData,$data));
    }

    /**
     * @param Request $request
     * @return mixed
     */
    private function _resetPassword(Request $request)
    {
       // echo '<pre>'; print_r($request->all()); exit;
        $app_user = new AppUser();
        $user =  $app_user->where('reset_token',$request->reset_token)->first();
        if(isset($user)){
            $data['user'] = $user->toArray();

            $user->password = \Hash::make($user['password']);
            $user->reset_token = NULL;
            $user->save();
            $data['message'] = 'Password reset successfully';

        }else{
            $data['is_user_error'] = 1;
            $data['error'] = 'Invalid request, user does not exist';
        }
        return $data;
    }

    /**
     * @param Request $request
     * @return mixed
     */
    public function activateAccount(Request $request)
    {
        if (isset($request->token)) {

            $data['is_error'] = 0;
            //print_r($request->token);
            $app_user = new AppUser();
            $user = $app_user->where('verification_token', $request->token)->first();

            if (isset($user)) {

                $user->is_active = 1;
                //$user->verification_token = NULL;
                $user->save();
                $data['user'] = $user->toArray();

                $data['is_error'] =  0;
              //  echo '<pre>'; print_r($data); exit;
            } else {
                $data['is_error'] = 1;
                $data['error'] = 'Invalid request, user does not exist';
            }

        } else {
            $data['is_error'] = 1;
            $data['error'] = 'Invalid Request';
        }

        return View::make('activate-user',array_merge($this->_assignData,$data));
    }


}