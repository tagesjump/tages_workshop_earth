import 'package:flutter/material.dart';
import 'package:tages_workshop_earth/models/config.dart';
import 'package:tages_workshop_earth/view/earth/earth_page.dart';

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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                      builder: (context) => EarthPage(EarthConfig.def())),
                );
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
