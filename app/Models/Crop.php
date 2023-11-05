<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Crop extends Model
{
    protected $table = 'crops';

    protected $fillable = [
        'name',
        'description',
        'count',
        'variations',
    ];

    public function variations()
    {
        return $this->hasMany(Variation::class);
    }

    protected $casts = [
        'variations' => 'json',
    ];
}
