import 'package:flutter/material.dart';

class SearchbarScreen extends StatefulWidget {
  const SearchbarScreen({super.key});

  @override
  State<SearchbarScreen> createState() => _SearchbarScreenState();
}

class _SearchbarScreenState extends State<SearchbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bar'),
      ),
    );
  }
}
