
import 'package:flutter_bloc/flutter_bloc.dart';
import 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
	AnimalCubit() : super(AnimalState.cat());

	void toggleAnimal() {
		if (state == AnimalState.cat()) {
			emit(AnimalState.dog());
		} else {
			emit(AnimalState.cat());
		}
	}
}
