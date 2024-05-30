<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Trait\commonTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Yajra\DataTables\Facades\DataTables;

class BrandController extends Controller
{
    use commonTrait;

    public function index()
    {
        return $this->adminFile('brands.index');
    }

    public function datatable(Request $request)
    {
        if($request->ajax()) {
            $data = Brand::where('deleted_at', null);
            return DataTables::of($data)
            ->addIndexColumn()
            ->editColumn('status',function ($row) {
                if($row->status == 1) {
                    $btn = '<a href="javascript:void(0)" class="text-success" id="status_'.$row->id.'" data-table="brands" data-id="'.$row->id.'" onclick="change_status(this);"><span class="badge bg-success"> Active</span></a>';
                } else {
                    $btn = '<a href="javascript:void(0)" class="text-danger" id="status_'.$row->id.'" data-table="brands" data-id="'.$row->id.'" onclick="change_status(this);return false;"><span class="badge bg-danger"> Inactive</span></a>';
                }
                return $btn;
            })
            ->addColumn('action', function($row) {
                $result = '<a href="' . url('admin/brand/edit/'.$row['id']) . '" class="btn btn-outline-blue btn-xs mr-1"><i class="fas fa-pen"></i></a>';
                $result .= '<a href="" class="btn btn-outline-danger btn-xs" id="'.$row->id.'" data-table="brands" data-id="'.$row->id.'"onclick="delete_record(this);return false;"><i class="far fa-trash-alt"></i></a>';
                return $result;
            })
            ->rawColumns(['status', 'action'])->make(true);
        }
    }

    public function create()
    {
        return $this->adminFile('brands.add');
    }

    public function store(Request $request)
    {
        $post_field = $request->all();

        $brand = Brand::where('name',$post_field['name'])->first();
        if(empty($brand)) {
            $data = new Brand();
            $data->name = $request['name'];
            $data->save();
          
            Session::flash( "success_message", "Brand added successfully");
        } else {
            Session::flash("error_message","This Brand already exists.");
        }
        return redirect()->route('admin.brand');
    }

    public function edit($id)
    {
        $data = Brand::find($id);
        return $this->adminFile('brands.edit',compact('data'));
    }

    public function update(Request $request,$id)
    {
        $data = $request->input();
        $update['name'] = $data['name'];
        Brand::where('id', $id)->update($update);
        Session::flash('success_message', 'Brand Updated successfully!!');
        return redirect()->route('admin.brand');
    }
}