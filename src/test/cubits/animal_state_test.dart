
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/cubits/animal_state.dart';

class MockAnimalState extends Mock implements AnimalState {}

void main() {
	group('AnimalState', () {
		test('should have initial state as Cat', () {
			final state = AnimalState.initial();
			expect(state.animal.name, equals('Cat'));
			expect(state.animal.icon, equals(Icons.access_time)); // assuming clock icon is Icons.access_time
		});

		test('should toggle state to Dog', () {
			final state = AnimalState.initial();
			final newState = state.toggleAnimal();
			expect(newState.animal.name, equals('Dog'));
			expect(newState.animal.icon, equals(Icons.person)); // assuming person icon is Icons.person
		});

		test('should toggle state back to Cat', () {
			final state = AnimalState.initial().toggleAnimal();
			final newState = state.toggleAnimal();
			expect(newState.animal.name, equals('Cat'));
			expect(newState.animal.icon, equals(Icons.access_time)); // assuming clock icon is Icons.access_time
		});
	});
}
