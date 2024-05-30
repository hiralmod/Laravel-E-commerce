<?php 

namespace App\Trait;


trait commonTrait 
{
    function adminFile($file,$data = null)
    {
        if(!empty($data))
        {
            return view('admin/pages/'.$file)->with($data);
        }
        else
        {
            return view('admin/pages/'.$file);
        }
    }

    function webFile($file,$data = null)
    {
        if(!empty($data))
        {
            return view('web/pages/'.$file)->with($data);
        }
        else
        {
            return view('web/pages/'.$file);
        }
    }
}


