<?php

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

Route::get('/', function () {
    return view('welcome');
});

Route::get("/admin/quiz-add", function(){
    return View::make("/quiz_add_view");
});

Route::post('/admin/quiz-store', 'AdminQuestionController@store')->name('quiz.store');

Route::post('/admin/mock-quiz-store', 'AdminQuestionController@storeMock')->name('mock-quiz.store');