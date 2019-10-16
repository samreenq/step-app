<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AccessToken extends Model
{
    protected $fillable = ['user_id','access_token', 'expiry_time' ];

    protected $visible = ['access_token', 'expiry_time'];
}