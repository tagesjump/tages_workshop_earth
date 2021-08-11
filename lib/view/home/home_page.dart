import 'package:flutter/material.dart';
import 'package:tages_workshop_earth/cubit/splash/splash_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TAGES Workshop!'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Coming soon...'),
            const Flexible(child: FractionallySizedBox(heightFactor: 0.1)),
            ElevatedButton.icon(
              onPressed: () {
                context.splashCubit.restarted();
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('С начала...'),
            ),
          ],
        ),
      ),
    );
  }
}
