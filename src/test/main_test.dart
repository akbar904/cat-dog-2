
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/main.dart';

void main() {
	group('MyApp', () {
		testWidgets('should show HomeScreen', (tester) async {
			// Build our app and trigger a frame.
			await tester.pumpWidget(MyApp());

			// Verify that HomeScreen is displayed.
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});
	});

	group('AnimalCubit', () {
		blocTest<AnimalCubit, AnimalState>(
			'should emit correct states when toggleAnimal is called',
			build: () => AnimalCubit(),
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [
				isA<AnimalState>().having((state) => state.animal.name, 'name', 'Dog').having((state) => state.animal.icon, 'icon', Icons.person),
			],
		);
	});
}
