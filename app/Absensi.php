<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Absensi extends Model
{
    protected $table = 'checkinout';
    protected $primaryKey = 'id';
    protected $guarded = [];
    public $timestamp = false;

    public function userinfo()
    {
        return $this->belongsTo(UserInfo::class, 'userid');
    }
}
