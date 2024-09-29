
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_app/screens/login_screen.dart'; // Assuming the package name is simple_flutter_app

class MockLoginCubit extends Mock implements LoginCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email and password fields', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<LoginCubit>(
						create: (_) => MockLoginCubit(),
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(TextFormField), findsNWidgets(2));
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
		});

		testWidgets('should display login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<LoginCubit>(
						create: (_) => MockLoginCubit(),
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Login'), findsOneWidget);
		});
	});

	group('LoginCubit State Tests', () {
		late MockLoginCubit loginCubit;

		setUp(() {
			loginCubit = MockLoginCubit();
		});

		blocTest<MockLoginCubit, LoginState>(
			'emit [LoginLoading, LoginSuccess] when login is successful',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [
				LoginLoading(),
				LoginSuccess(),
			],
		);

		blocTest<MockLoginCubit, LoginState>(
			'emit [LoginLoading, LoginFailure] when login fails',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'wrongpassword'),
			expect: () => [
				LoginLoading(),
				LoginFailure(),
			],
		);
	});
}
