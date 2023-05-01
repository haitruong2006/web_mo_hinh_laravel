<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
class Comment extends Model
{
    use HasFactory;
    protected $table = "comment";

    public function user(){
        Return $this->belongsTo(User::class,'id_users','id');
    }

}
