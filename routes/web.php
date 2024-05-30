<?php

use App\Http\Controllers\Admin\AuthController;
use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\CommonController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\SubCategoryController;
use App\Http\Controllers\Website\AuthController as WebsiteAuthController;
use App\Http\Controllers\Website\CartController;
use App\Http\Controllers\Website\HomeController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Route::get('/', [AuthController::class, 'index'])->name('admin.login');
Route::prefix('/admin')->group(function() {
    Route::get('login', [AuthController::class, 'index'])->name('admin.login');
    Route::post('check_login', [AuthController::class, 'checkLogin'])->name('admin.check_login');
    Route::middleware('admin')->group(function () { 
        Route::get('dashboard', [ProfileController::class, 'index'])->name('admin.dashboard');
        Route::get('logout', [AuthController::class, 'logout'])->name('admin.logout');
        Route::match(['get', 'post'], 'profile', [ProfileController::class, 'myProfile'])->name('admin.profile');
        Route::match(['get', 'post'], 'change-password', [ProfileController::class, 'change_password'])->name('admin.change-password');

        //Common 
        Route::post('change_status/',[CommonController::class,'changeStatus'])->name('change_status');
        Route::post('delete_record/',[CommonController::class,'deleteRecord'])->name('deleteRecord');

        //Category
        Route::get('category', [CategoryController::class, 'index'])->name('admin.category');
        Route::get('category/add', [CategoryController::class, 'create'])->name('category.add');
        Route::post('category/store', [CategoryController::class, 'store'])->name('category.store');
        Route::get('category/edit/{id}', [CategoryController::class, 'edit'])->name('category.edit');
        Route::post('category/update/{id}', [CategoryController::class, 'update'])->name('category.update');
        Route::post('category/datatable', [CategoryController::class, 'datatable'])->name('category.datatable');

        //Sub Category
        Route::get('subcategory', [SubCategoryController::class, 'index'])->name('admin.subcategory');
        Route::post('subcategory/datatable', [SubCategoryController::class , 'datatable'])->name('subcategory.datatable');
        Route::get('subcategory/add', [SubCategoryController::class, 'add'])->name('subcategory.add');
        Route::post('subcategory/store', [SubCategoryController::class, 'store'])->name('subcategory.store');
        Route::get('subcategory/edit/{id}',[SubCategoryController::class , 'edit'])->name('subcategory.edit');
        Route::post('subcategory/update/{id}', [SubCategoryController::class, 'update'])->name('subcategory.update');

        //Brands
        Route::get('brand', [BrandController::class , 'index'])->name('admin.brand');
        Route::post('brand/datatable', [BrandController::class, 'datatable'])->name('brand.datatable');
        Route::get('brand/add', [BrandController::class, 'create'])->name('brand.add');
        Route::post('brand/store', [BrandController::class, 'store'])->name('brand.store');
        Route::get('brand/edit/{id}',[BrandController::class , 'edit'])->name('brand.edit');
        Route::post('brand/update/{id}', [BrandController::class, 'update'])->name('brand.update');

        //Products
        Route::get('product', [ProductController::class , 'index'])->name('admin.product');
        Route::post('product/datatable', [ProductController::class, 'datatable'])->name('product.datatable');
        Route::get('product/add', [ProductController::class, 'create'])->name('product.add');
        Route::post('product/store', [ProductController::class, 'store'])->name('product.store');
        Route::get('/fetchSubcategory', [ProductController::class, 'fetchSubcategory']);
        Route::get('product/edit/{id}',[ProductController::class , 'edit'])->name('product.edit');
        Route::post('product/update/{id}', [ProductController::class, 'update'])->name('product.update');
    });
});

//Web 

//Login
Route::get('login', [WebsiteAuthController::class, 'index'])->name('login');
Route::post('web_login', [WebsiteAuthController::class, 'webLogin'])->name('website.login');

//Sign Up
Route::get('register', [WebsiteAuthController::class, 'signup'])->name('register');
Route::post('web_register', [WebsiteAuthController::class, 'register'])->name('website.register');

Route::get('/', [HomeController::class, 'index'])->name('website.home');
Route::get('home', [HomeController::class, 'index'])->name('website.home');
Route::get('product/{id}', [HomeController::class, 'product'])->name('website.product');
Route::get('product/{id}/{subcategory_id}', [HomeController::class , 'product'])->name('website.product');
Route::get('product-details/{category_id}/{subcategory_id}/{id}', [HomeController::class, 'product_details'])->name('website.product-details');
Route::post("search-item", [HomeController::class, "searchProducts"])->name("search-item");

Route::middleware('website')->group(function () { 
    Route::get('logout', [WebsiteAuthController::class, 'logout'])->name('website.logout');
    Route::get('cart', [CartController::class, 'cart'])->name('website.cart');
    Route::post('add-cart', [CartController::class, 'cart_products'])->name('website.add-cart');
    Route::post('change-quantity', [CartController::class, 'change_quantity'])->name('website.change-quantity');
    Route::post('remove-cart-item', [CartController::class, 'remove_cart_items'])->name('website.remove-cart-item');
    Route::post('checkout', [CartController::class, 'checkout'])->name('website.checkout');
    Route::get('payment', [CartController::class, 'payment'])->name('website.payment');
    Route::post('card-payment', [CartController::class, 'card_payment'])->name('card-payment');
    Route::get('order-placed', [CartController::class, 'order_place'])->name('order-palced');
});