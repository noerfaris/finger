<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Proengsoft\JsValidation\Facades\JsValidatorFacade;

class LoginController extends Controller
{
    public function index(Request $request)
    {
        if (Auth::check()) {
            return redirect(route('dashboard'));
        }

        $validasi = [
            'username' => 'required',
            'password' => 'required',
        ];

        if ($request->method() === 'POST') {
            $request->validate($validasi);

            if (Auth::attempt(['username' => $request->username, 'password' => $request->password])) {
                return redirect(route('dashboard'));
            }

            return redirect(route('login'))->with([
                'pesan' => '<div class="alert alert-danger">Username atau password Anda salah!</div>',
            ]);
        }

        $validator = JsValidatorFacade::make($validasi);
        return view('backend.auth.login', compact('validator'));
    }

    public function profil(Request $request)
    {
        $validasi = [
            'first_name' => 'required',
            'last_name' => 'required',
        ];

        if ($request->method() === 'POST') {
            $validasi = $request->validate($validasi);

            DB::beginTransaction();
            try {
                User::find(Auth::id())->update($validasi);
                DB::commit();
            } catch (\Throwable $th) {
                DB::rollBack();
                return redirect()->back()->with([
                    'pesan' => '<div class="alert alert-danger">Terjadi kesalahan</div>',
                ]);
            }

            return redirect()->back()->with([
                'pesan' => '<div class="alert alert-success">Profil berhasil diperbarui</div>',
            ]);
        }

        $validator = JsValidatorFacade::make($validasi);

        return view('backend.pengaturan.show', compact('validator'));
    }

    public function password(Request $request)
    {
        $validasi = [
            'password_lama' => 'required',
            'password' => 'required|min:6|confirmed',
        ];

        if ($request->method() === 'POST') {
            $validasi = $request->validate($validasi);

            if (Hash::check($request->password_lama, Auth::user()->password)) {

                DB::beginTransaction();
                try {
                    User::find(Auth::id())->update(['password' => Hash::make($request->password)]);
                    DB::commit();

                    return redirect()->back()->with([
                        'pesan' => '<div class="alert alert-success">Password berhasil diperbarui</div>',
                    ]);

                } catch (\Throwable $th) {
                    DB::rollBack();
                    return redirect()->back()->with([
                        'pesan' => '<div class="alert alert-danger">Terjadi kesalahan</div>',
                    ]);
                }

            } else {
                return redirect(route('password'))->with([
                    'pesan' => '<div class="alert alert-danger mt-2">Password lama Anda salah!</div>'
                ]);
            }
        }

        $validator = JsValidatorFacade::make($validasi);

        return view('backend.pengaturan.ganti_password', compact('validator'));
    }

    public function logout()
    {
        Auth::logout();
        return redirect(route('login'));
    }
}
