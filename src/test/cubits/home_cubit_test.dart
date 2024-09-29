
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_flutter_app/cubits/home_cubit.dart';

class MockHomeCubit extends MockCubit<void> implements HomeCubit {}

void main() {
	group('HomeCubit', () {
		late HomeCubit homeCubit;

		setUp(() {
			homeCubit = HomeCubit();
		});

		tearDown(() {
			homeCubit.close();
		});

		test('initial state is correct', () {
			expect(homeCubit.state, equals(null));
		});

		blocTest<HomeCubit, void>(
			'emits nothing when logout is called',
			build: () => homeCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [],
		);
	});
}
