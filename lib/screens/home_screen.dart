import 'package:flutter/material.dart';

import 'package:towner/widgets/stream_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rentals',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: const StreamWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 20, 0, 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        onPressed: () {
          Navigator.pushNamed(context, '/addscreen');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
