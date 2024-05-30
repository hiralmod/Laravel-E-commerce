<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Subcategory;
use App\Trait\commonTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Yajra\DataTables\Facades\DataTables;

class SubCategoryController extends Controller
{
    use commonTrait;
    public function index()
    {
        return $this->adminFile('subcategory.index');
    }

    public function datatable(Request $request) 
    {
        if($request->ajax()){
            $data = Subcategory::where('deleted_at', NULL)->whereHas('category')->with('category:id,name');
            return DataTables::of($data)
            ->addIndexColumn()
            ->editColumn('status', function($row) {
                if($row->status == 1) {
                    $btn = '<a href="javascript:void(0)" class="text-success" id="status_'.$row->id.'" data-table="sub_categories" data-id="'.$row->id.'" onclick="change_status(this);"><span class="badge bg-success"> Active</span></a>';
                } else {
                    $btn = '<a href="javascript:void(0)" class="text-danger" id="status_'.$row->id.'" data-table="sub_categories" data-id="'.$row->id.'" onclick="change_status(this);return false;"><span class="badge bg-danger"> Inactive</span></a>';
                }
                return $btn;
            })
            ->addColumn('action', function($row) {
                $result = '<a href="' . url('admin/subcategory/edit/'.$row['id']) . '" class="btn btn-outline-blue btn-xs mr-1"><i class="fas fa-pen"></i></a>';
                $result .= '<a href="" class="btn btn-outline-danger btn-xs" id="'.$row->id.'" data-table="sub_categories" data-id="'.$row->id.'"onclick="delete_record(this);return false;"><i class="far fa-trash-alt"></i></a>';
                return $result;
            })
            ->addColumn('category', function($row) {
                if($row->category) {
                    return $row->category->name;
                }
            })
            ->rawColumns(['status', 'action'])->make(true);
        }
    } 
    
    public function add()
    {
        $data['category'] = Category::where('status', 1)->whereNull('deleted_at')->get();
        return $this->adminFile('subcategory.add', $data);
    }

    public function store(Request $request) 
    {
        $data = $request->all();
        $subcategory = Subcategory::where('name', $data['name'])->where('category_id', $data['category_id'])->first();

        if(empty( $subcategory )) {
            $subcategory_data = new Subcategory();
            $subcategory_data->category_id = $request['category_id'];
            $subcategory_data->name = $request['name'];
            $subcategory_data->description = $request['description'];
            if($file = $request->hasFile('profile_picture')) {
                $file = $request->file('profile_picture');
                $profile_picture_name = time() . rand(1,100) . '.' . $file->extension();
                $profile_picture_path = 'public/uploads/subcategory';
                $path = $request->file('profile_picture')->storeAs(
                    $profile_picture_path ,$profile_picture_name
                );
                $subcategory_data->profile_picture = $path;
            }
            $subcategory_data->save();

            Session::flash("success_message", "Sub Category added succesfully");
        } else {
            Session::flash("error_message", "Sub Category already exist");
        }
        return redirect()->route('admin.subcategory');
    }

    public function edit($id)
    {
        $data['subcategory'] = Subcategory::find($id);
        $data['category'] = Category::where('status', 1)->whereNull('deleted_at')->get();
        return $this->adminFile('subcategory.edit',$data); 
    }

    public function update(Request $request, $id)
    {
        $data = $request->input();
        $subcategory = Subcategory::find($id);
        $update['category_id'] = $data['category_id'];
        $update['name'] = $data['name'];
        $update['description'] = $data['description'];
        if($file = $request->hasFile('profile_picture')) {
            $existingFile = $subcategory->profile_picture;

            if ($existingFile && Storage::exists($existingFile)) {
                Storage::delete($existingFile);
            }
            $file = $request->file('profile_picture');
            $profile_picture_name = time() . rand(1,100) . '.' . $file->extension();
            $profile_picture_path = 'public/uploads/subcategory';
            $path = $request->file('profile_picture')->storeAs(
                $profile_picture_path ,$profile_picture_name
            );
            $update['profile_picture'] = $path;
        }
        Subcategory::where('id', $id)->update($update);
        Session::flash('success_message', 'Sub Category Updated Successfully');
        return redirect()->route('admin.subcategory');
    }
}