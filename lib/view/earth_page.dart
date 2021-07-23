import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:tages_workshop_earth/cubit/earth_cubit.dart';

class EarthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EarthCubit>(
      create: (context) => EarthCubit(),
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: BlocBuilder<EarthCubit, EarthState>(
            builder: _buildEarth,
          ),
        ),
      ),
    );
  }

  Widget _buildEarth(BuildContext context, EarthState state) {
    ValueChanged<double>? effectiveSliderChange;
    VoidCallback? effectiveRandomCallback;
    if (state is EarthSuccess) {
      effectiveSliderChange =
          (value) => context.read<EarthCubit>().changed(value.round());
      effectiveRandomCallback = () {
        context.read<EarthCubit>().imLucky();
      };
    }

    return Column(
      children: [
        Expanded(
          child: RiveAnimation.asset(
            'assets/animations/half_earth.riv',
            placeHolder: Center(child: Text('Загрузка...')),
            fit: BoxFit.cover,
            controllers: state.controllers,
            onInit: (_) => context.read<EarthCubit>().started(),
          ),
        ),
        Slider(
          value: state.effectiveIndex.toDouble(),
          divisions: state.animationCount - 1,
          max: (state.animationCount - 1).toDouble(),
          onChanged: effectiveSliderChange,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton.icon(
            onPressed: effectiveRandomCallback,
            icon: Icon(Icons.shuffle),
            label: Text('Мне повезет!'),
          ),
        ),
      ],
    );
  }
}
