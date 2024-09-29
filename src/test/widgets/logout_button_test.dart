
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_flutter_app/widgets/logout_button.dart';

class MockHomeCubit extends MockCubit<void> implements HomeCubit {}

void main() {
	group('LogoutButton Widget Tests', () {
		testWidgets('should display a button with text "Logout"', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: LogoutButton(),
					),
				),
			);

			expect(find.text('Logout'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);
		});

		testWidgets('should call logout on HomeCubit when pressed', (WidgetTester tester) async {
			final mockHomeCubit = MockHomeCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<HomeCubit>(
							create: (_) => mockHomeCubit,
							child: LogoutButton(),
						),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => mockHomeCubit.logout()).called(1);
		});
	});
}
