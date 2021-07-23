import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class EarthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: RiveAnimation.asset(
                'assets/animations/half_earth.riv',
                placeHolder: Center(child: Text('Загрузка...')),
                fit: BoxFit.cover,
              ),
            ),
            Slider(
              value: 0,
              divisions: 6,
              onChanged: (value) {},
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.shuffle),
                label: Text('Мне повезет!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
