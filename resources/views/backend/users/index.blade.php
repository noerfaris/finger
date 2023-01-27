@extends('backend.layouts.layout')

@section('konten')
<div class="container-xxl flex-grow-1 container-p-y">

    <div class="card mb-4">
        <h5 class="card-header">User</h5>
        <div class="card-body">
            <table class="table table-hover display nowrap mb-4" id="datatable">
                <thead>
                    <tr>
                        <th>user</th>
                        <th>keterangan</th>
                        <th>ip</th>
                        <th>device</th>
                        <th>platform</th>
                        <th>diakses</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
@endsection

@section('script')
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap5.min.js"></script>

    <script>
        getList();

        function getList(){
            $('#datatable').DataTable({
                scrollX: true,
                processing: true,
                serverSide: true,
                searching : false,
                lengthChange : false,
                pageLength  : 10,
                bDestroy: true,
                ajax: {
                    url  : "{{ route('aktivitas') }}",
                    type : "POST",
                    data : function(d){
                        d._token = $("input[name=_token]").val();
                        d.cari = $('input[name="cari"]').val();
                    },
                },
                columns: [
                    { data: 'user.username'},
                    { data: 'keterangan'},
                    { data: 'ip'},
                    { data: 'browser'},
                    { data: 'platform'},
                    { data: 'tanggal'},
                ]
            });
        }
    </script>
@endsection
