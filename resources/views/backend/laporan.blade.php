@extends('backend.layouts.layout')

@section('konten')
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="card mb-4">
        <h5 class="card-header">Rekap Absensi</h5>
        <div class="card-body">
            <div class="row mb-4">
                <div class="col-sm-4"><input type="text" id="tanggal" class="tanggal form-control"></div>
                <div class="col-sm-1"><button class="btn btn-warning" onclick="getList()">Go</button></div>
            </div>

            <table class="table table-hover display nowrap mb-4" id="datatable">
                <thead>
                    <tr>
                        <th>user id</th>
                        <th>name</th>
                        <th>hari kerja</th>
                        <th>kehadiran</th>
                        <th>tidak masuk</th>
                        <th>early ci</th>
                        <th>ontime</th>
                        <th>late ci</th>
                        <th>tidak absen ci</th>
                        <th>tidak absen co</th>
                        <th>selish early/late</th>
                        <th>total ot</th>
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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

    <script>
        getList();

        $(document).ready(function(){
            $(".tanggal").flatpickr({
                defaultDate: "{{ date('Y-m-d') }}",
                mode : 'range',
            });
        });

        function getList(){
            let status = $('.btn-check:checked').val();

            $('#datatable').DataTable({
                scrollX: true,
                processing: true,
                serverSide: true,
                searching : false,
                lengthChange : false,
                pageLength  : 10,
                bDestroy: true,
                ajax: {
                    url  : "{{ route('laporan') }}",
                    type : "POST",
                    data : function(d){
                        d._token = $("input[name=_token]").val();
                        d.tanggal = $('.tanggal').val();
                    },
                },
                columns: [
                    { data: 'userid'},
                    { data: 'name'},
                    { data: 'working_day'},
                    { data: 'kehadiran'},
                    { data: 'tidak_masuk'},
                    { data: 'early'},
                    { data: 'ontime'},
                    { data: 'late_ci'},
                    { data: 'tidak_checkin'},
                    { data: 'tidak_checkout'},
                    { data: 'selisih'},
                    { data: 'selisih_ot'},
                ]
            });
        }
    </script>
@endsection
