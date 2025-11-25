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
        Schema::create('series', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('slug')->unique();
            $table->text('synopsis')->nullable();
            $table->integer('duration')->nullable();
            $table->text('current_episode')->nullable();
            $table->text('total_episodes')->nullable();
            $table->string('thumbnail')->nullable();
            $table->string('studios')->nullable();
            $table->string('release_date')->nullable();
            $table->float('rating')->default(4);
            $table->integer('views')->default(0);
            $table->enum('type', ['movie', 'episodes'])->default('episodes');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('series');
    }
};
