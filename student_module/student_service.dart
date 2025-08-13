import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/student_module/logged_user_model.dart';
import 'package:http/http.dart' as http;

import 'student_model.dart';

class StudentService {
  static String? _authToken;

  // Set the authentication token after successful login
  static void setAuthToken(String token) {
    _authToken = token;
  }

  // Clear the authentication token on logout
  static void clearAuthToken() {
    _authToken = null;
  }

  // Helper method to add auth headers
  static Map<String, String> _getHeaders() {
    final headers = {'Content-Type': 'application/json'};
    if (_authToken != null) {
      headers['Authorization'] = 'Bearer $_authToken';
    }
    return headers;
  }

  static Future<StudentModel> read() async {
    final String url = "http://10.0.2.2:8000/api/students?page=1";
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: _getHeaders(),
      );
      if (response.statusCode == 200) {
        return compute(studentModelFromJson, response.body);
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized - Please login again");
      } else {
        throw Exception("Error status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: ${e.toString()}");
    }
  }

  static Future<bool> insert(Datum item) async {
    final String url = "http://10.0.2.2:8000/api/students";
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _getHeaders(),
        body: jsonEncode(item.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized - Please login again");
      } else {
        throw Exception("Error status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: ${e.toString()}");
    }
  }

  static Future<bool> update(Datum item) async {
    final String url = "http://10.0.2.2:8000/api/students/${item.id}";
    try {
      http.Response response = await http.put(
        Uri.parse(url),
        headers: _getHeaders(),
        body: jsonEncode(item.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized - Please login again");
      } else {
        throw Exception("Error status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: ${e.toString()}");
    }
  }

  static Future<bool> delete(int id) async {
    final String url = "http://10.0.2.2:8000/api/students/$id";
    try {
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: _getHeaders(),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized - Please login again");
      } else {
        throw Exception("Error status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: ${e.toString()}");
    }
  }

  static Future<LoggedUserModel> login(String email, String password) async {
    final String url = "http://10.0.2.2:8000/api/login";
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final loggedUser = loggedUserModelFromJson(response.body);
        // Store the token if available in the response
        if (loggedUser.token != null) {
          setAuthToken(loggedUser.token!);
        }
        return loggedUser;
      } else {
        throw Exception("Error status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network error: ${e.toString()}");
    }
  }

  static Future<void> logout() async {
    final String url = "http://10.0.2.2:8000/api/logout";
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: _getHeaders(),
      );
      if (response.statusCode == 200 || response.statusCode == 204) {
        clearAuthToken();
      } else if (response.statusCode == 401) {
        clearAuthToken();
        throw Exception("Session expired");
      } else {
        throw Exception("Error status code: ${response.statusCode}");
      }
    } catch (e) {
      clearAuthToken();
      throw Exception("Network error: ${e.toString()}");
    }
  }
  static Future<void> register({
  required String name,
  required String email,
  required String password,
  required String passwordConfirmation,
}) async {
  final String url = "http://10.0.2.2:8000/api/register";
  try {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      }),
    );

    final responseBody = jsonDecode(response.body);
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return; // Registration successful
    } else if (response.statusCode == 422) {
      // Handle validation errors
      final errors = responseBody['errors'] ?? {};
      final errorMessage = errors.isNotEmpty 
          ? errors.values.first.join('\n')
          : 'Validation failed';
      throw Exception(errorMessage);
    } else {
      throw Exception(responseBody['message'] ?? 'Registration failed');
    }
  } on http.ClientException catch (e) {
    throw Exception("Network error: ${e.message}");
  } catch (e) {
    throw Exception("Registration error: ${e.toString()}");
  }
}
}