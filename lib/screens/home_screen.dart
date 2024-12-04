import 'package:flutter/material.dart';
import 'package:flutter_experiment/screens/local_notif_screen.dart';
import 'package:flutter_experiment/screens/news_details_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List menus = [
      {
        'title': 'Local Notif',
        'page': const LocalNotifScreen(),
      },
      {
        'title': 'Push Notif',
        'page': const LocalNotifScreen(),
      },
      {
        'title': 'News',
        'page': const NewsDetailsPage(),
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Silakan Pilih menu'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: menus
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ListTile(
                    title: Text(e['title']),
                    shape: Border.all(color: Colors.grey, width: 1),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      print('object');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => e['page'],
                          ));
                    },
                  ),
                ))
            .toList(),
      ),
    );
  }
}
