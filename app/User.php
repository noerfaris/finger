<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    // use Notifiable;

    protected $table = 'auth_user';
    protected $primaryKey = 'id';
    protected $guarded = [];
    public $timestamps = false;

}
