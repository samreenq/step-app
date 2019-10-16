<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReviewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('reviews', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('review_by')->unsigned();
            $table->integer('lesson_id')->unsigned();
            $table->integer('rating');
            $table->string('review');
            $table->boolean('is_active')->default(1);
            $table->timestamps();
            $table->softDeletes();

            //indexes
            $table->foreign('review_by')->references('id')->on('cms_users');
            $table->foreign('lesson_id')->references('id')->on('lessons');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('reviews');
    }
}
