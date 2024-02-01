// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final image;
  final model;
  final color;
  final wheelType;
  final year;
  final controller;

  const DetailScreen(
      {super.key,
      this.image,
      this.model,
      this.color,
      this.wheelType,
      this.year,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 4),
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Text(
                'Model:  ${model}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 20, 0, 2),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Color:  ${color}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 20, 0, 2),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'WheelType:  ${wheelType}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 20, 0, 2),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Manufacture year:  ${year}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 20, 0, 2),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
