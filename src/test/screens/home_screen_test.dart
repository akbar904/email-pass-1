
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_flutter_app/screens/home_screen.dart';

class MockHomeCubit extends MockCubit<void> implements HomeCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays a logout button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: HomeScreen()));

			expect(find.byType(LogoutButton), findsOneWidget);
		});
	});

	group('HomeCubit Tests', () {
		late HomeCubit homeCubit;

		setUp(() {
			homeCubit = MockHomeCubit();
		});

		blocTest<HomeCubit, void>(
			'HomeCubit emits nothing on instantiation',
			build: () => homeCubit,
			expect: () => [],
		);

		blocTest<HomeCubit, void>(
			'HomeCubit emits nothing when logout is called',
			build: () => homeCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [],
		);
	});
}
