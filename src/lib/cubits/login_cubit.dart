
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
	final User user;

	LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
	final String message;

	LoginFailure(this.message);
}

class LoginCubit extends Cubit<LoginState> {
	LoginCubit() : super(LoginInitial());

	void login(String email, String password) {
		emit(LoginLoading());

		// Simulate a login process with hardcoded credentials
		if (email == 'test@example.com' && password == 'password123') {
			final user = User(email: email, password: password);
			emit(LoginSuccess(user));
		} else {
			emit(LoginFailure('Invalid credentials'));
		}
	}

	void logout() {
		emit(LoginInitial());
	}
}
