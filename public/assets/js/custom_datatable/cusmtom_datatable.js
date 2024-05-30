$(document).ready(function() {
    var datatable = $(datatable_id).DataTable({
                    dom:"lBfrtip",
                    processing: true,
                    serverSide: true,
                    searchDelay: 500,
                    responsive: true,
                    "ajax":{
                        url:datatable_url,
                        type:"POST",
                        datatype:"json",
                        data:{
                                _token:$('meta[name="csrf-token"]').attr('content')
                            }
                    },
                    columns:datatable_column,
                    buttons: [{
                                extend: 'csv',
                                title: app_name+' - '+$(datatable_id).data("export-title")
                                // exportOptions: {
                                //     columns: [ 0,1,2,3,4,6]
                                // }
                            },
                            {
                                extend: 'pdfHtml5',
                                orientation: 'landscape',
                                pageSize: 'A4',
                                title: app_name+' - '+$(datatable_id).data("export-title")
                                // exportOptions: {
                                //     columns: [ 0,1,2,3,4,6]
                                // }
                            },

                    ],
                    order: [
                        [0, "desc"]
                    ],
                    "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull){
                            $(nRow).attr("id", 'row_' + aData.id);
                            return nRow;
                    }
                });
    datatable.buttons().container().appendTo($('#printbar'));


    $('#filter-form').on('submit', function(e) {

        console.log(e);

        e.preventDefault();
        var obj = {};
        var obj = $(this).serializeObject();
        $.ajaxSetup({
            data: obj
        });
        datatable.draw();

    });

    $.fn.serializeObject = function()
    {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };

});

