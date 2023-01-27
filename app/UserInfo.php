<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserInfo extends Model
{
    protected $table = 'userinfo';
    protected $primaryKey = 'userid';
    protected $guarded = [];
    public $timestamp = false;
}
