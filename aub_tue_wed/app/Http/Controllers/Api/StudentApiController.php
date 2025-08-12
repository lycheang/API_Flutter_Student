<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Student;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

class StudentApiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Fetch the latest students and paginate
        $students = Student::orderBy('id', 'asc')->paginate(20);
        return $students;
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'khmer_name' => 'required|string|max:255',
            'latin_name' => 'nullable|string|max:255',
            'gender' => 'nullable|string|max:255',
            'dob' => 'nullable|date',
            'address' => 'nullable|string',
            'tel' => 'nullable|string|max:20',
        ]);
        
        $student = Student::create($validated);
        return response()->json($student, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $student = Student::find($id);
        if (!$student) 
            return response()->json(['message' => 'Student not found'], 404);
        return $student;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $student = Student::find($id);
        if (!$student) 
            return response()->json(['message' => 'Student not found'], 404);

        $validated = $request->validate([
            'khmer_name' => 'sometimes|required|string|max:255',
            'latin_name' => 'sometimes|nullable|string|max:255',
            'gender' => 'sometimes|nullable|string|max:255',
            'dob' => 'sometimes|nullable|date',
            'address' => 'sometimes|nullable|string',
            'tel' => 'sometimes|nullable|string|max:20',
        ]);

        $student->update($validated);
        return response()->json($student, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $student = Student::find($id);
        if (!$student) 
            return response()->json(['message' => 'Student not found'], 404);

        $student->delete();
        return response()->json(['message' => 'Student deleted successfully'], 200);
    }
}