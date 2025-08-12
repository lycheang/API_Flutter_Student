<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

use App\Models\Student;
class StudentController extends Controller
{
    public function index():Collection
    {
        return Student::all();
    }
}
