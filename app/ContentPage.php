<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ContentPage extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'type', 'title', 'content'
    ];

    protected $visible = [
        'type', 'title', 'content'
    ];
}
