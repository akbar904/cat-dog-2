
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/cubits/animal_cubit.dart';
import 'package:simple_cubit_app/widgets/animal_text.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Animal Cubit App'),
			),
			body: Center(
				child: BlocBuilder<AnimalCubit, AnimalState>(
					builder: (context, state) {
						if (state is CatState) {
							return GestureDetector(
								onTap: () {
									context.read<AnimalCubit>().toggleAnimal();
								},
								child: AnimalText(
									name: 'Cat',
									icon: Icons.access_time,
								),
							);
						} else if (state is DogState) {
							return GestureDetector(
								onTap: () {
									context.read<AnimalCubit>().toggleAnimal();
								},
								child: AnimalText(
									name: 'Dog',
									icon: Icons.person,
								),
							);
						}
						return Container();
					},
				),
			),
		);
	}
}
