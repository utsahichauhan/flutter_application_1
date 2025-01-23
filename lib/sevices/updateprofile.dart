import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/updaterequest.dart';
import 'package:http/http.dart' as http;

Future<void> updateUser(Profile user, BuildContext context) async {
  const String apiUrl = 'http://192.168.33.42:3000/update-user'; // API endpoint for updating profile

  try {
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(user.toJson()), // Send user data as JSON
    );

    if (response.statusCode == 200) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile updated successfully!")),
      );
    } else {
      // Show failure message with status code
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update profile: ${response.body}")),
      );
    }
  } catch (e) {
    // Show error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error: $e")),
    );
  }
}
