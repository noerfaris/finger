@extends('backend.layouts.layout')

@section('konten')
    <div class="container-xxl flex-grow-1 container-p-y">
        <div class="row">
          <div class="col-md-12">
            <ul class="nav nav-pills flex-column flex-md-row mb-3">
              <li class="nav-item">
                <a class="nav-link active" href="javascript:void(0);"><i class="bx bx-user me-1"></i> Profil</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="{{ route('password') }}"
                  ><i class="bx bx-bell me-1"></i> Ganti Password</a
                >
              </li>
            </ul>

            <div class="card mb-4">
              <h5 class="card-header">Detail Profil</h5>
              <hr class="my-0" />
              <div class="card-body">
                @if (session()->has('pesan'))
                    {!! session('pesan') !!}
                @endif

                <form id="my-form" method="POST" enctype="multipart/form-data" action="{{ route('profil') }}">
                    @csrf
                  <div class="row">
                    <div class="mb-4 col-md-4">
                        <label for="username" class="form-label">Username</label>
                        <input
                          class="form-control"
                          type="text"
                          id="username"
                          name="username"
                          value="{{ Auth::user()->username }}"
                          readonly
                        />
                      </div>

                    <div class="mb-4 col-md-4">
                      <label for="first_name" class="form-label">First Name</label>
                      <input
                        class="form-control"
                        type="text"
                        id="first_name"
                        name="first_name"
                        value="{{ Auth::user()->first_name }}"
                        autofocus
                      />
                    </div>

                    <div class="mb-4 col-md-4">
                      <label for="last_name" class="form-label">Last Name</label>
                      <input
                        class="form-control"
                        type="text"
                        id="last_name"
                        name="last_name"
                        value="{{ Auth::user()->last_name }}"
                      />
                    </div>
                  </div>

                  <div class="mt-2">
                    <button type="submit" class="btn btn-primary me-2">Perbarui</button>
                  </div>
                </form>
              </div>
              <!-- /Account -->
            </div>

          </div>
        </div>
      </div>


@endsection

@section('script')
    <script type="text/javascript" src="{{ asset('vendor/jsvalidation/js/jsvalidation.js')}}"></script>
    {!! $validator->selector('#my-form') !!}

@endsection
