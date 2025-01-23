class Profile {
  final String username;
  final String email;
  final String password;
  final String mobileno;
  final String university;

  Profile({
    required this.username,
    required this.email,
    required this.password,
    required this.mobileno,
    required this.university,
  });

  // Convert Profile instance to JSON for API request
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
      'mobileno': mobileno,
      'university': university,
    };
  }
}
