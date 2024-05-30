<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;

    protected $table = "cart";

    public function products()
    {
        return $this->hasMany(Product::class, 'id','product_id');
    }

    public function orders()
    {
        return $this->hasOne(Order::class, 'id','order_id');
    }
}
