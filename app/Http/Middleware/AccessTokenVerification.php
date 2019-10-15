<?php

namespace App\Http\Middleware;

use Closure;
use App\AccessToken;

class AccessTokenVerification
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        
        if($this->whiteListApi($request->path())) {
            return $next($request);
        }

        $access_token = $request->header('X-Access-Token');

        if (!$access_token) {
            return response()->json($this->errorMsgs('access_token_required'), 500);
        } else {
            $user_id = AccessToken::where('access_token', $access_token)
                ->where('expiry_time', '>', time())
                ->first()->user_id;

            if (!$user_id) {
                return response()->json($this->errorMsgs('access_token_expired'), 500);
            }

            $request->merge(['user_id' => $user_id]);
        }


        return $next($request);
    }

    private function errorMsgs($type)
    {
        switch ($type) {
            case 'access_token_required':
                $error = ['msg' => 'X-Access-Token is required', 'status_code' => 500];
                break;

            case 'access_token_expired':
                $error = ['msg' => 'Token has been expired', 'status_code' => 500];
                break;

            default:
                $error = ['msg' => 'Token mismatched', 'status_code' => 500];
                break;
        }

        return $error;
    }

    private function whiteListApi($route) {

        $whiteListRoutes = [
            'api/user_register',
            'api/user_login',
            'api/check_third_party_user_exists',
            'api/forgot_password',
            'api/get_page'
        ];

        return in_array($route ,$whiteListRoutes);
    }
}
