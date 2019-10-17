<?php

namespace App;

use App\Libraries\RocketChat;
use crocodicstudio\crudbooster\helpers\CRUDBooster;
use Illuminate\Database\Eloquent\Model;
use App\Libraries\Authy;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use DB;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class AppUser extends Model
{

    use SoftDeletes;

    protected $fillable = [
        'first_name', 'last_name', 'email', 'password', 'photo', 'device_token', 'platform_type', 'platform_id', 'image_url',
        'reset_token', 'is_paid', 'is_active'
    ];

    protected $hidden = [
        'password'
    ];

    final function authenticateUser($postdata)
    {
        $user_data = $this->where('email', $postdata['email'])->first();
        $status = 0;

        if (!$user_data) {
            $data = 'Invalid Email Address';
        } else if (!$user_data->is_active) {
            $username = $user_data->first_name . ' ' . $user_data->last_name;
            $email_data = ['to' => $user_data->email, 'data' => ['username' => $username],
                'template' => 'user_registration'];
            CRUDBooster::sendEmail($email_data);
            $data = 'Inactive User. Please Enter the Activation Code to Continue';

        } else if (!\Hash::check($postdata['password'], $user_data->password)) {
            $data = 'Invalid Password';
        } else {
            unset($user_data->password);
            $status = 1;
            $device_token = isset($postdata['device_token']) ? $postdata['device_token'] : 'no_token';
            $user_data->device_token = $device_token;
            $user_data->save();
            $this->setAccessToken($user_data->id);

            $data = $this->with('token')->find($user_data->id);
        }

        return ['api_status' => $status, 'data' => $data];
    }

    final function changePassword($postdata)
    {
        $user_data = $this->where('id', $postdata['user_id'])->first();
        $status = 0;

        if (!$user_data->is_active) {
            $username = $user_data->first_name . ' ' . $user_data->last_name;
            $email_data = ['to' => $user_data->email, 'data' => ['username' => $username],
                'template' => 'user_registration'];
            CRUDBooster::sendEmail($email_data);
            $data = 'Inactive User. Please Enter the Activation Code to Continue';

        } else if (!\Hash::check($postdata['password'], $user_data->password)) {
            $data = 'Invalid Password';
        } else {
            unset($user_data->password);
            $status = 1;
            $device_token = isset($postdata['device_token']) ? $postdata['device_token'] : 'no_token';
            $user_data->device_token = $device_token;
            $user_data->save();
            $this->setAccessToken($user_data->id);

            $data = $this->with('token')->find($user_data->id);
        }

        return ['api_status' => $status, 'data' => $data];
    }

    public function token()
    {
        return $this->hasOne('App\AccessToken', 'user_id');
    }

    public function checkPassword($user_id, $old_password)
    {
        $user_data = \DB::table('app_users')
            ->select('app_users.password')
            ->where('app_users.id', $user_id)->first();
        if (Hash::check($old_password, $user_data->password))
            return 1;
        else
            return 0;
    }

    public function setAccessToken($user_id)
    {
        $token = Str::random() . time();
        $exp_time = time() + (365 * 24 * 60 * 60);  // +1 Year

        $data = \App\AccessToken::updateOrCreate(
            ['user_id' => $user_id],
            ['user_id' => $user_id, 'access_token' => $token, 'expiry_time' => $exp_time]
        );

        return $data;
    }

    public function sendResetPassMail($user)
    {
        $emailData = ['to' => $user->email, 'data' => ['reset_token' => $user->reset_token], 'template' => 'forgot_password_app'];
        \CRUDBooster::sendEmail($emailData);

        return 'Email has been sent to your email address with reset token.';
    }

    public function sendRegisterMail($user)
    {
        $username = $user->first_name.' '.$user->last_name;
        $email_data = ['to' => $user->email, 'data' => ['username' => $username], 'template' => 'user_registration'];
        \CRUDBooster::sendEmail($email_data);
        
    }



}
