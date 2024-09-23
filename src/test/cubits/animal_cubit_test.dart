
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.walturn/cubits/animal_cubit.dart';
import 'package:com.walturn/cubits/animal_state.dart';

// Mock dependencies if there are any (although not expected based on the public interface)
class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState.cat()] when toggleAnimal is called initially',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [AnimalState.dog()],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState.dog(), AnimalState.cat()] when toggleAnimal is called twice',
			build: () => animalCubit,
			act: (cubit) {
				cubit.toggleAnimal();
				cubit.toggleAnimal();
			},
			expect: () => [AnimalState.dog(), AnimalState.cat()],
		);
	});
}
