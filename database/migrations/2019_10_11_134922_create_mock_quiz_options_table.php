<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMockQuizOptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mock_quiz_options', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('mock_quiz_id')->unsigned();
            $table->string('answer');
            $table->boolean('is_correct')->default(1);
            $table->boolean('is_active')->default(1);
            $table->timestamps();
            $table->softDeletes();

            //indexes
            $table->foreign('mock_quiz_id')->references('id')->on('mock_quizzes');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('mock_quiz_options');
    }
}
