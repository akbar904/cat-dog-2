
import 'package:flutter/material.dart';

class Animal {
	final String name;
	final IconData icon;

	Animal({required this.name, required this.icon});
}

class AnimalState {
	final Animal animal;

	AnimalState({required this.animal});

	factory AnimalState.initial() {
		return AnimalState(animal: Animal(name: 'Cat', icon: Icons.access_time));
	}

	AnimalState toggleAnimal() {
		if (animal.name == 'Cat') {
			return AnimalState(animal: Animal(name: 'Dog', icon: Icons.person));
		} else {
			return AnimalState(animal: Animal(name: 'Cat', icon: Icons.access_time));
		}
	}
}
