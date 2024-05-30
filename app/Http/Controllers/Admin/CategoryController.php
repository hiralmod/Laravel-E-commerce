<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Trait\commonTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Yajra\DataTables\Facades\DataTables;

class CategoryController extends Controller
{
    use commonTrait;
    public function index()
    {
        return $this->adminFile('category.index');
    }

    public function datatable(Request $request)
    {
        if($request->ajax()) {
            $data = Category::where('deleted_at',null);
            return DataTables::of($data)
            ->addIndexColumn()
            ->editColumn('status', function($row) {
                if($row->status == 1) {
                    $btn = '<a href="javascript:void(0)" class="text-success" id="status_'.$row->id.'" data-table="categories" data-id="'.$row->id.'" onclick="change_status(this);"><span class="badge bg-success"> Active</span></a>';
                } else {
                    $btn = '<a href="javascript:void(0)" class="text-danger" id="status_'.$row->id.'" data-table="categories" data-id="'.$row->id.'" onclick="change_status(this);return false;"><span class="badge bg-danger"> Inactive</span></a>';
                }
                return $btn;
            })
            ->addColumn('action', function($row){
                $result = '<a href="' . url('admin/category/edit/'.$row['id']) . '" class="btn btn-outline-blue btn-xs mr-1"><i class="fas fa-pen"></i></a>';
            
                $result .= '<a href="" class="btn btn-outline-danger btn-xs" id="'.$row->id.'" data-table="categories" data-id="'.$row->id.'"onclick="delete_record(this);return false;"><i class="far fa-trash-alt"></i></a>';
                return $result;
            })
            ->rawColumns(['status', 'action'])->make(true);
        }
    }

    public function create() 
    {
        return $this->adminFile('category.add');        
    }

    public function store(Request $request)
    {
        $post_field = $request->all();

        $category = Category::where('name',$post_field['name'])->first();
        if(empty($category)) {
            $data = new Category();
            $data->name = $request['name'];
            if($file = $request->hasFile('profile_picture')) {
                $file = $request->file('profile_picture');
                $profile_picture_name = time() . rand(1,100) . '.' . $file->extension();
                $profile_picture_path = 'public/uploads/category';
                $path = $request->file('profile_picture')->storeAs(
                    $profile_picture_path ,$profile_picture_name
                );
                $data->profile_picture = $path;
            }
            $data->save();
          
            Session::flash( "success_message", "Category added successfully");
        } else {
            Session::flash("error_message","This category already exists.");
        }
        return redirect()->route('admin.category');
    }

    public function edit($id) {
        $data = Category::find($id);
        return $this->adminFile('category.edit',compact('data'));
    }

    public function update(Request $request, $id)
    {
        $data = $request->input();
        $category = Category::find($id);
        $update['name'] = $data['name'];
        if($file = $request->hasFile('profile_picture')) {
            $existingFile = $category->profile_picture;

            if ($existingFile && Storage::exists($existingFile)) {
                Storage::delete($existingFile);
            }
            $file = $request->file('profile_picture');
            $profile_picture_name = time() . rand(1,100) . '.' . $file->extension();
            $profile_picture_path = 'public/uploads/category';
            $path = $request->file('profile_picture')->storeAs(
                $profile_picture_path ,$profile_picture_name
            );
            $update['profile_picture'] = $path;
        }
        Category::where('id', $id)->update($update);
        Session::flash('success_message', 'Category Updated successfully!!');
        return redirect()->route('admin.category');
    }
}
