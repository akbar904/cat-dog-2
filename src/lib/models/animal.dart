
import 'package:flutter/material.dart';

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
