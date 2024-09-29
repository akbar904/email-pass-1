
import 'package:flutter_test/flutter_test.dart';
import 'package:lib/models/user.dart';

void main() {
	group('User Model', () {
		test('should correctly serialize and deserialize from JSON', () {
			final userJson = {
				'email': 'test@example.com',
				'password': 'securepassword'
			};

			final user = User.fromJson(userJson);
			expect(user.email, 'test@example.com');
			expect(user.password, 'securepassword');

			final serializedUser = user.toJson();
			expect(serializedUser['email'], 'test@example.com');
			expect(serializedUser['password'], 'securepassword');
		});

		test('should create User instance with the correct email and password', () {
			final user = User(email: 'test@example.com', password: 'securepassword');
			expect(user.email, 'test@example.com');
			expect(user.password, 'securepassword');
		});

		test('should return true for valid email format', () {
			final user = User(email: 'test@example.com', password: 'securepassword');
			expect(user.isValidEmail(), true);
		});

		test('should return false for invalid email format', () {
			final user = User(email: 'invalid-email', password: 'securepassword');
			expect(user.isValidEmail(), false);
		});
	});
}
