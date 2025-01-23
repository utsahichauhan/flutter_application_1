import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/modules/loginrequest.dart';
import 'package:http/http.dart' as http;

Future<void> logInUser(LoginRequest loginRequest, BuildContext context) async {
  const String apiUrl =
      'http://192.168.33.42:3000/login'; // Update to your API URL

  try {
    
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(loginRequest.toJson()),
    );

    if (response.statusCode == 200) {
      // Parse the user data from response
      final data = json.decode(response.body);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["message"])));
      // Navigate to the dashboard or other screen upon successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      // Show error message if login fails
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login failed")));
    }
  } catch (e) {
    // Show error message if there's an exception
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Error: $e")));
  }
}
