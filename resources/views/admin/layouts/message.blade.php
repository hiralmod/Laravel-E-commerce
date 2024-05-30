@if(session('success_message'))

<script type="text/javascript">
    $(document).ready(function() {

        toastr.options.timeOut = 4000;

        toastr.success(' {{ session('success_message') }}');

    });
</script>

@endif

@if(session('error_message'))

<script type="text/javascript">
    $(document).ready(function() {

        toastr.options.timeOut = 4000;

        toastr.error(' {{ session('error_message') }}');

    });
</script>

@endif