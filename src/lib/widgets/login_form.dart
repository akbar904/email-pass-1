
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/login_cubit.dart';

class LoginForm extends StatelessWidget {
	const LoginForm({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final _emailController = TextEditingController();
		final _passwordController = TextEditingController();

		return Padding(
			padding: const EdgeInsets.all(16.0),
			child: Column(
				children: [
					TextFormField(
						key: Key('emailField'),
						controller: _emailController,
						decoration: InputDecoration(
							labelText: 'Email',
						),
					),
					TextFormField(
						key: Key('passwordField'),
						controller: _passwordController,
						decoration: InputDecoration(
							labelText: 'Password',
						),
						obscureText: true,
					),
					SizedBox(height: 20),
					ElevatedButton(
						onPressed: () {
							final email = _emailController.text;
							final password = _passwordController.text;
							context.read<LoginCubit>().login(email, password);
						},
						child: Text('Login'),
					),
				],
			),
		);
	}
}
