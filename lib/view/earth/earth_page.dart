import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:tages_workshop_earth/cubit/earth/earth_cubit.dart';
import 'package:tages_workshop_earth/models/config.dart';
import 'package:tages_workshop_earth/services/rive_service.dart';
import 'package:tages_workshop_earth/view/home/home_page.dart';

class EarthPage extends StatelessWidget {
  const EarthPage(this._config);

  final EarthConfig _config;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EarthCubit>(
      create: (context) => EarthCubit(RiveService(_config))..started(),
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
    if (state.artboard == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx > 0) {
              context.read<EarthCubit>().debouncePrev();
            }

            if (details.delta.dx < 0) {
              context.read<EarthCubit>().debounceNext();
            }
          },
          child: Rive(
            artboard: state.artboard!,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                if (state.effectiveIndex > 0)
                  ElevatedButton.icon(
                    onPressed: () => context.read<EarthCubit>().prev(),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Назад'),
                  ),
                const Spacer(),
                if (state.effectiveIndex < state.animationCount - 1)
                  _buildNextButton(
                    context,
                    text: 'Далее',
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () => context.read<EarthCubit>().next(),
                  )
                else
                  _buildNextButton(
                    context,
                    text: 'Начать',
                    icon: const Icon(Icons.home),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                            builder: (context) => HomePage()),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNextButton(
    BuildContext context, {
    required String text,
    required Widget icon,
    required VoidCallback onPressed,
  }) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;

    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(text),
          SizedBox(width: gap),
          icon,
        ],
      ),
    );
  }
}
