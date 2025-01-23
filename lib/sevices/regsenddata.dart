import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/regformdata.dart';
import 'package:http/http.dart' as http;

Future<void> registerUser(Quotes user, BuildContext context) async {
  const String apiUrl =
      'http://192.168.33.42:3000/register'; // Change to your API URL

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      // Show success message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration successful!")));
    } else {
      // Show failure message
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to register")));
    }
  } catch (e) {
    // Show error message
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Error: $e")));
  }
}