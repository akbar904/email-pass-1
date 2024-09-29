
import 'dart:convert';

class User {
	final String email;
	final String password;

	User({required this.email, required this.password});

	// Factory constructor to create a User from JSON
	factory User.fromJson(Map<String, dynamic> json) {
		return User(
			email: json['email'],
			password: json['password'],
		);
	}

	// Method to convert User instance to JSON
	Map<String, dynamic> toJson() {
		return {
			'email': email,
			'password': password,
		};
	}

	// Method to validate email format
	bool isValidEmail() {
		final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
		return emailRegex.hasMatch(email);
	}
}
