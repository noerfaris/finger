<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware('xss')->group(function(){
    Route::any('/', 'LoginController@index')->name('login');

    Route::middleware('auth')->group(function(){
        Route::any('/dashboard', 'HomeController@index')->name('dashboard');
        Route::any('/laporan', 'HomeController@laporan')->name('laporan');
        Route::any('/profil', 'LoginController@profil')->name('profil');
        Route::any('/password', 'LoginController@password')->name('password');
        Route::get('/logout', 'LoginController@logout')->name('logout');
    });
});
