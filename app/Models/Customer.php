<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $table = 'employee';
    protected $fillable = ['name', 'email', 'user_id', 'mobile_number']; // Add your columns here
}
  