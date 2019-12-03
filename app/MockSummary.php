<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MockSummary extends Model
{
    use SoftDeletes;

    protected $table = 'mock_summary';

    protected $fillable = [ 'title','description','is_active','duration_seconds'];


}
