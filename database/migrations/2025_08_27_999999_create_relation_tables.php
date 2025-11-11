<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('genre_series', function (Blueprint $table) {
            $table->foreign('series_id')->references('id')->on('series')->onDelete('cascade');
            $table->foreign('genre_id')->references('id')->on('genres')->onDelete('cascade');
        });

        Schema::table('episodes', function (Blueprint $table) {
            $table->foreign('series_id')->references('id')->on('series')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('SET NULL');
        });

        Schema::table('links', function (Blueprint $table) {
            $table->foreign('episode_id')->references('id')->on('episodes')->onDelete('cascade');
            $table->foreign('server_id')->references('id')->on('servers')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('genre_series', function (Blueprint $table) {
            $table->dropForeign(['series_id']);
            $table->dropForeign(['genre_id']);
        });
    }
};
