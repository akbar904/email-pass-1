
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_flutter_app/main.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}
class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
	group('Main App Initialization Tests', () {
		testWidgets('App initializes with LoginScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});

	group('Cubit Tests', () {
		blocTest<MockLoginCubit, LoginState>(
			'LoginCubit emits LoginSuccess when login is successful',
			build: () => MockLoginCubit(),
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [LoginSuccess()],
		);

		blocTest<MockHomeCubit, HomeState>(
			'HomeCubit emits LoggedOut when logout is called',
			build: () => MockHomeCubit(),
			act: (cubit) => cubit.logout(),
			expect: () => [LoggedOut()],
		);
	});

	group('Widget Tests', () {
		testWidgets('LoginScreen contains email and password fields', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: LoginScreen()));
			expect(find.byType(TextField), findsNWidgets(2));
		});

		testWidgets('HomeScreen contains logout button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: HomeScreen()));
			expect(find.byType(LogoutButton), findsOneWidget);
		});
	});
}
