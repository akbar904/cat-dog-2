
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:com.walturn/models/animal.dart';

void main() {
	group('Animal Model Tests', () {
		test('Animal model should correctly serialize and deserialize', () {
			final animal = Animal(name: 'Cat', icon: Icons.access_time);

			final json = animal.toJson();
			expect(json['name'], 'Cat');
			expect(json['icon'], Icons.access_time.codePoint);

			final deserializedAnimal = Animal.fromJson(json);
			expect(deserializedAnimal.name, 'Cat');
			expect(deserializedAnimal.icon, Icons.access_time);
		});

		test('Animal model should have correct properties', () {
			final animal = Animal(name: 'Dog', icon: Icons.person);

			expect(animal.name, 'Dog');
			expect(animal.icon, Icons.person);
		});
	});
}

class Animal {
	final String name;
	final IconData icon;

	Animal({required this.name, required this.icon});

	Map<String, dynamic> toJson() => {
		'name': name,
		'icon': icon.codePoint,
	};

	static Animal fromJson(Map<String, dynamic> json) => Animal(
		name: json['name'],
		icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
	);
}
