
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/home_cubit.dart';

class LogoutButton extends StatelessWidget {
	const LogoutButton({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final homeCubit = context.read<HomeCubit>();

		return ElevatedButton(
			onPressed: () {
				homeCubit.logout();
			},
			child: const Text('Logout'),
		);
	}
}
