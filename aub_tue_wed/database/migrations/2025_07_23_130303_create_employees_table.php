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
        Schema::create('employees', function (Blueprint $table) {
            $table->id();
        $table->string('name');
        $table->date('dob');               // Date of birth
        $table->enum('gender', ['male', 'female', 'other']);
        $table->string('address');
        $table->string('tel');             // Telephone number
        $table->string('email')->unique();
        $table->string('position');
        $table->decimal('salary', 10, 2);  // 10 digits total, 2 decimal places
        $table->timestamps();              // created_at and updated_at
    });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees');
    }
};
