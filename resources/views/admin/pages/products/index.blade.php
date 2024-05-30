@extends('admin.layouts.master')
@section('title','Product')
@section('content')
<div class="row">
    <div class="col-12">
        <div class="page-title-box">
            <div class="page-title-right">
                <a href="{{ route('product.add') }}" class="btn btn-sm waves-effect waves-light button-color"><i class="fas fa-plus-circle"></i> Add</a>
            </div>
            <h4 class="page-title mt-3">Product</h4>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                <div class="table">
                    <table class="table table-bordered datatable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Category Name</th>
                                <th>Sub Category Name</th>
                                {{-- <th>Brand</th> --}}
                                <th>Name</th>
                                <th>Status</th>
                                <th width="100px">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
@endsection
@section('footer_script')
<script type="text/javascript">
    var table;

    $(document).ready(function(){
        table = $('.datatable').DataTable({
            processing : true,
            serverSide: true,
            "ajax": {
                    "url": "{{ route('product.datatable') }}",
                    "type": "POST",
                    "dataType": "json",
                    "data": {
                        _token: "{{ csrf_token() }}"
                    }
                },
                columns: [{
                        data: 'id',
                        name: 'id'
                    },
                    {
                        data: 'category',
                        name: 'category',
                        orderable: true,
                        searchable: true
                    },
                    {
                        data: 'subcategory',
                        name: 'subcategory',
                        orderable: true,
                        searchable: true
                    },
                    // {
                    //     data: 'brand',
                    //     name: 'brand',
                    //     orderable: true,
                    //     searchable: true
                    // },
                    {
                        data: 'name',
                        name: 'name',
                        orderable: true,
                        searchable: true
                    },
                    {
                        data: 'status',
                        name: 'status',
                        orderable: false,
                        searchable: false
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false,
                    }
                ],
                order: [
                    [0, "desc"]
                ],
                "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    $(nRow).attr("id", 'row_' + aData.id);
                    return nRow;
                }
        });
    })
</script>
@endsection