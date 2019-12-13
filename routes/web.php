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

/*Route::get("/admin/quiz-add", function(){
    return View::make("/quiz_add_view");
});*/

Route::any('/admin/quiz-add', 'AdminQuestionController@getData');

/*Route::get("/admin/quiz-summary", function(){
    return View::make("/quiz_summary");
});*/

Route::post('/admin/quiz-store', 'AdminQuestionController@store')->name('quiz.store');
Route::post('/admin/quiz-summary-store', 'QuizSummaryController@store')->name('quiz.summary-store');
Route::any('/admin/quiz-summary', 'QuizSummaryController@getData');


Route::post('/admin/mock-quiz-store', 'AdminQuestionController@storeMock')->name('mock-quiz.store');
Route::any('/reset-password/token/{token}', 'WebController@resetPassword');
Route::any('/activate/token/{token}', 'WebController@activateAccount');

Route::post('/admin/mock-summary-store', 'MockSummaryController@store')->name('mock.summary-store');
Route::any('/admin/mock-summary', 'MockSummaryController@getData');

Route::any('/admin/get-vocabulary', 'VocabularyController@getByIdentifier');

Route::any('/translate','SpeechTextController@index');

Route::any('/admin/lesson-quiz', 'LessonQuizController@getData');
Route::any('/admin/lesson-quiz-store', 'LessonQuizController@store');
