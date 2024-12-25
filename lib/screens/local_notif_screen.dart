import 'package:flutter/material.dart';

class LocalNotifScreen extends StatelessWidget {
  const LocalNotifScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notif'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print('object');
          },
          child: const Text('Push'),
        ),
      ),
    );
  }
}
