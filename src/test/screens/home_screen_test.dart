
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/screens/home_screen.dart';
import 'package:simple_cubit_app/cubits/animal_cubit.dart';
import 'package:simple_cubit_app/cubits/animal_state.dart';
import 'package:simple_cubit_app/widgets/animal_text.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('HomeScreen widget tests', () {
		testWidgets('should display Cat with clock icon initially', (WidgetTester tester) async {
			final mockAnimalCubit = MockAnimalCubit();
			when(() => mockAnimalCubit.state).thenReturn(AnimalState.cat());

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockAnimalCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('should display Dog with person icon after tapping text', (WidgetTester tester) async {
			final mockAnimalCubit = MockAnimalCubit();
			when(() => mockAnimalCubit.state).thenReturn(AnimalState.cat());

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockAnimalCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byType(AnimalText));
			await tester.pumpAndSettle();

			when(() => mockAnimalCubit.state).thenReturn(AnimalState.dog());

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
