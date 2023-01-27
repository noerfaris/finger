<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="{{ asset('backend/sneat-1.0.0/') }}/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>{{ env('APP_NAME') }}</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="{{ asset('backend/sneat-1.0.0/') }}/assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="{{ asset('backend/sneat-1.0.0/') }}/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="{{ asset('backend/sneat-1.0.0/') }}/assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            @include('backend.layouts.sidebar')

            <!-- Layout container -->
            <div class="layout-page">
                @include('backend.layouts.header')

                <div class="content-wrapper">

                    @yield('konten')

                    @include('backend.layouts.footer')

                    <div class="content-backdrop fade"></div>
                </div>

            </div>

      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->

    @csrf

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    {{-- <script src="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/libs/jquery/jquery.js"></script> --}}
    <script src="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/libs/popper/popper.js"></script>
    <script src="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/js/bootstrap.js"></script>
    <script src="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/js/menu.js"></script>
    <script src="{{ asset('backend/sneat-1.0.0/') }}/assets/vendor/libs/apex-charts/apexcharts.js"></script>
    <script src="{{ asset('backend/sneat-1.0.0/') }}/assets/js/main.js"></script>
    {{-- <script src="{{ asset('backend/sneat-1.0.0/') }}/assets/js/dashboards-analytics.js"></script> --}}
    {{-- <script async defer src="https://buttons.github.io/buttons.js"></script> --}}

    @yield('script', '')

  </body>
</html>
