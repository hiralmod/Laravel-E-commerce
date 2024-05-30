<?php

namespace App\Http\Controllers\Website;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\Subcategory;
use App\Trait\commonTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    use commonTrait;

    public function index() 
    {       
        return $this->webFile('home');
    }

    public function product($id,$subcategory_id = "")
    {
        $data['sub_category'] = Subcategory::where('status',1)->where('deleted_at', NULL)->where('category_id', $id)->get();
        $data['products'] = Product::with('category')->where('status',1)->where('deleted_at', NULL)->where('category_id', $id)->where('subcategory_id',$subcategory_id)->get();
        return $this->webFile('product',$data);
    }

    public function product_details($category_id = "",$subcategory_id = "",$id="")
    { 
        $data['product_details'] = Product::with('category')->with('subcategory')->where('status',1)->where('deleted_at', NULL)->where('id',$id)->where('category_id', $category_id)->where('subcategory_id',$subcategory_id)->first();
        return $this->webFile('product_details',$data);
    }
     
    public function searchProducts(Request $request)
    {
        $searchTerm = $request->input('search');
        $products = Product::with('category', 'subcategory')->where('status', 1)->whereNull('deleted_at') ->where(function ($query) use ($searchTerm) {
            $query->where('name', 'like', "%$searchTerm%")
                ->orWhere('description', 'like', "%$searchTerm%");
            })
            ->orwhereHas('category', function ($query) use ($searchTerm) {
                $query->where('name', 'like', "%$searchTerm%");
            })
            ->orWhereHas('subcategory', function ($query) use ($searchTerm) {
                $query->where('name', 'like', "%$searchTerm%");
        })->get();

        return response()->json($products);
    }
}