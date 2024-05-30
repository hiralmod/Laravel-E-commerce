<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CommonController extends Controller
{
    public function changeStatus(Request $request)
    {
        $table = $request->table;
        $id = $request->id;
        $data = DB::table($table)->whereId($id)->first();
        if(isset($data)) {
            $status = ($data->status == 1) ? 0 : 1;
            DB::table($table)->whereId($id)->update(['status' => $status]);
            Session::flash('success_message', 'Status Changed Successfully!!');
            return response()->json(['status' => true]);
        } else {
            return response()->json(['status' => false]);
        }
    }

    public function deleteRecord(Request $request){
        $table = $request->table;
        $id = $request->id;
        $data = DB::table($table)->whereId($id)->update(['deleted_at' => date('Y-m-d H:i:s')]);
        Session::flash('success_message', 'Record deleted successfully!!');
        return response()->json(['status', true]);
    }
}
