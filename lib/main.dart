import 'package:flutter/material.dart';
import 'package:flutter_experiment/models/user.dart';
import 'package:flutter_experiment/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

Box? box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  box = await Hive.openBox('dbBox');
  box!.put(
      'user',
      User(
        name: 'Bayu',
        age: 30,
        address: "Pandeglang",
        image: "https://dummyjson.com/icon/emilys/128",
      ));
  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}
