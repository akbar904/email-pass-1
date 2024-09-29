
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_flutter_app/cubits/login_cubit.dart';
import 'package:com.example.simple_flutter_app/models/user.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
	group('LoginCubit', () {
		late LoginCubit loginCubit;

		setUp(() {
			loginCubit = LoginCubit();
		});

		tearDown(() {
			loginCubit.close();
		});

		test('initial state is LoginInitial', () {
			expect(loginCubit.state, equals(LoginInitial()));
		});

		blocTest<LoginCubit, LoginState>(
			'login emits [LoginLoading, LoginSuccess] when credentials are correct',
			build: () => loginCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [LoginLoading(), LoginSuccess(User(email: 'test@example.com', password: 'password123'))],
		);

		blocTest<LoginCubit, LoginState>(
			'login emits [LoginLoading, LoginFailure] when credentials are incorrect',
			build: () => loginCubit,
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [LoginLoading(), LoginFailure('Invalid credentials')],
		);

		blocTest<LoginCubit, LoginState>(
			'logout emits LoginInitial',
			build: () => loginCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [LoginInitial()],
		);
	});
}
