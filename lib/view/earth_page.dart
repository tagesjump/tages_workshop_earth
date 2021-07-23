import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:tages_workshop_earth/cubit/earth_cubit.dart';
import 'package:tages_workshop_earth/models/config.dart';
import 'package:tages_workshop_earth/services/rive_service.dart';

class EarthPage extends StatelessWidget {
  const EarthPage(this._config);

  final EarthConfig _config;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EarthCubit>(
      create: (context) => EarthCubit(RiveService(_config)),
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
            placeHolder: const Center(child: Text('Загрузка...')),
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
            icon: const Icon(Icons.shuffle),
            label: const Text('Мне повезет!'),
          ),
        ),
      ],
    );
  }
}
