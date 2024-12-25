import 'package:flutter/material.dart';
import 'package:flutter_experiment/main.dart';
import 'package:flutter_experiment/models/user.dart';

class HiveScreen extends StatelessWidget {
  const HiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = box!.get('user');
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.name ?? ''),
            Text(user.age.toString()),
            Text(user.address ?? ''),
            Image.network(user.image ?? ''),
          ],
        ),
      ),
    );
  }
}
