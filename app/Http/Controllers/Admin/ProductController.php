<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\Subcategory;
use App\Trait\commonTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Yajra\DataTables\Facades\DataTables;

class ProductController extends Controller
{
    use commonTrait;

    public function index()
    {
        return $this->adminFile('products.index');
    }

    public function datatable(Request $request)
    {
        if($request->ajax()) {
            // $data = Product::whereNull('deleted_at')->whereHas("category")->whereHas("brand")->with("category:id,name")->with("brand:id,name");
            $data = Product::whereNull('deleted_at')->whereHas("category")->with("category:id,name");
            return DataTables::of($data)
            ->addIndexColumn()
            ->editColumn('status', function($row) {
                if($row->status == 1) {
                    $btn = '<a href="javascript:void(0)" class="text-success" id="status_'.$row->id.'" data-table="products" data-id="'.$row->id.'" onclick="change_status(this);"><span class="badge bg-success"> Active</span></a>';
                } else {
                    $btn = '<a href="javascript:void(0)" class="text-danger" id="status_'.$row->id.'" data-table="products" data-id="'.$row->id.'" onclick="change_status(this);return false;"><span class="badge bg-danger"> Inactive</span></a>';
                }
                return $btn;
            })
            ->addColumn('action', function($row) {
                $result = '<a href="' . url('admin/product/edit/'.$row['id']) . '" class="btn btn-outline-blue btn-xs mr-1"><i class="fas fa-pen"></i></a>';
                $result .= '<a href="" class="btn btn-outline-danger btn-xs" id="'.$row->id.'" data-table="products" data-id="'.$row->id.'"onclick="delete_record(this);return false;"><i class="far fa-trash-alt"></i></a>';
                return $result;
            })
            ->addColumn('category', function($row) {
                if($row->category) {
                    return $row->category->name;
                }
            })
            ->addColumn('subcategory', function($row) {
                if($row->subcategory) {
                    return $row->subcategory->name;
                }
            })
            // ->addColumn('brand', function($row) {
            //     if($row->brand) {
            //         return $row->brand->name;
            //     }
            // })
            ->rawColumns(['status', 'action'])->make(true);
        }
    }

    public function create()
    {
        $data['category'] = Category::where('status', 1)->whereNull('deleted_at')->get();
        //$data['brand'] = Brand::where('status',1)->whereNull('deleted_at')->get();
       return $this->adminFile('products.add',$data); 
    }
    
    public function fetchSubcategory(Request $request)
    {
        $data['subcategory'] = Subcategory::where("category_id", $request->category_id)->where('status', 1)->whereNull('deleted_at')->get(["id","name"]);
        return response()->json($data);
    }

    public function store(Request $request)
    {
        $data = $request->all();
        $product = new Product();
        $product->category_id = $data['category_id'];
        $product->subcategory_id = $data['subcategory_id'];
        $product->name = $data['name'];
        $product->description = $data['description'];
        $product->quantity = $data['quantity'];
        $product->price = $data['price'];

        if($file = $request->hasFile('profile_picture')) {
            $file = $request->file('profile_picture');
            $profile_picture_name = time() . rand(1,100) . '.' . $file->extension();
            $profile_picture_path = 'public/uploads/products';
            $path = $request->file('profile_picture')->storeAs(
                $profile_picture_path ,$profile_picture_name
            );
            $product->profile_picture = $path;
        }

        if($primary_file = $request->hasFile('primary_image')) {
            $primary_file = $request->file('primary_image');
            $primary_image_name = time() . rand(1,100) . '.' . $primary_file->extension();
            $primary_image_path = 'public/uploads/primary_images';
            $path = $request->file('primary_image')->storeAs(
                $primary_image_path ,$primary_image_name
            );
            $product->primary_image = $path;
        }
        $product->save();

        Session::flash('success_message', 'Product Added Successfully');
        return redirect()->route('admin.product');
    }

    public function edit($id)
    {
        $data['products'] = Product::find($id);
        $data['category'] = Category::where('status',1)->whereNull('deleted_at')->get();
        $data['subcategory'] = Subcategory::where('category_id', $data['products']['category_id'])->where('status',1)->whereNull('deleted_at')->get();
        //$data['brand'] = Brand::where('status',1)->whereNull('deleted_at')->get();
        return $this->adminFile('products.edit',$data);
    }
 
    public function update(Request $request, $id)
    {
        $data = $request->input();
        $product = Product::find($id);
        $update['category_id'] = $data['category_id'];
        $update['subcategory_id'] = $data['subcategory_id'];
        $update['name'] = $data['name'];
        $update['description'] = $data['description'];
        $update['quantity'] = $data['quantity'];
        $update['price'] = $data['price'];
        if($file = $request->hasFile('profile_picture')) {
            $existingFile = $product->profile_picture;
            if ($existingFile && Storage::exists($existingFile)) {
                Storage::delete($existingFile);
            }
            $file = $request->file('profile_picture');
            $profile_picture_name = time() . rand(1,100) . '.' . $file->extension();
            $profile_picture_path = 'public/uploads/products';
            $path = $request->file('profile_picture')->storeAs(
                $profile_picture_path ,$profile_picture_name
            );
            $update['profile_picture'] = $path;
        }

        if($primary_file = $request->hasFile('primary_image')) {
            $existingFile = $product->primary_image;
            if ($existingFile && Storage::exists($existingFile)) {
                Storage::delete($existingFile);
            }
            $primary_file = $request->file('primary_image');
            $primary_image_name = time() . rand(1,100) . '.' . $primary_file->extension();
            $primary_image_path = 'public/uploads/primary_images';
            $path = $request->file('primary_image')->storeAs(
                $primary_image_path ,$primary_image_name
            );
            $update['primary_image'] = $path;
        }
        Product::where('id', $id)->update($update);
        Session::flash('success_message', 'Producs Updated Successfully');
        return redirect()->route('admin.product');
    }
}
  