<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OTP extends Model
{
    // Nama tabel di database
    protected $table = 'otps';

    // Atribut yang dapat diisi secara massal
    protected $fillable = ['email', 'otp'];
}
