@extends('backend.layouts.layout')

@section('konten')
<div class="container-xxl flex-grow-1 container-p-y">
    <div class="card mb-4">
        <h5 class="card-header">Harian</h5>
        <div class="card-body">
            <div class="row mb-4">
                <div class="col-sm-2"><input type="text" id="tanggal" class="tanggal form-control"></div>
                <div class="col-sm-10">
                    <div class="btn-group float-end" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="btnradio" value="I" id="btnradio1" autocomplete="off" checked="checked">
                        <label class="btn btn-outline-primary btn-sm btn-check-label" for="btnradio1">Masuk</label>

                        <input type="radio" class="btn-check" name="btnradio" value="O" id="btnradio2" autocomplete="off">
                        <label class="btn btn-outline-primary btn-sm btn-check-label" for="btnradio2">Keluar</label>

                        <input type="radio" class="btn-check" name="btnradio" value="4" id="btnradio3" autocomplete="off">
                        <label class="btn btn-outline-primary btn-sm btn-check-label" for="btnradio3">Lembur Masuk</label>

                        <input type="radio" class="btn-check" name="btnradio" value="5" id="btnradio4" autocomplete="off">
                        <label class="btn btn-outline-primary btn-sm btn-check-label" for="btnradio4">Lembur Keluar</label>
                    </div>
                </div>
            </div>

            <table class="table table-hover display nowrap mb-4" id="datatable">
                <thead>
                    <tr>
                        <th>user id</th>
                        <th>name</th>
                        <th>checktime</th>
                        <th>sn</th>
                        <th>note</th>
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
                onChange: function(selectedDates, dateStr, instance){
                    getList();
                }
            });

            $('.btn-check').click(function(e){
                e.preventDefault();

                let val = $(this).val();
                let id = $(this).attr('id');
                $('.btn-check').removeAttr('checked');
                $('.btn-check-label').removeClass('active');
                $('.btn-outline-primary').css('color','#26267d').css('background-color','transparent').css('border-color','#26267d');

                $(this).attr('checked','checked');
                $('label[for="'+id+'"]').addClass('active');
                $('label[for="'+id+'"]').css('color','#fff').css('background-color','#26267d').css('border-color','#26267d');

                getList();
            })
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
                    url  : "{{ route('dashboard') }}",
                    type : "POST",
                    data : function(d){
                        d._token = $("input[name=_token]").val();
                        d.status = status;
                        d.tanggal = $('.tanggal').val();
                    },
                },
                columns: [
                    { data: 'userid'},
                    { data: 'userinfo.name'},
                    { data: 'checktime'},
                    { data: 'SN'},
                    { data: 'userid'},
                ]
            });
        }
    </script>
@endsection
