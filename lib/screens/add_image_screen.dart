import 'package:flutter/material.dart';
import 'package:towner/widgets/custom_button.dart';
import 'package:towner/widgets/custom_text_field.dart';
import 'package:towner/widgets/date_text_field.dart';

class AddScreen extends StatelessWidget {
  final modelController = TextEditingController();
  final colorController = TextEditingController();
  final wheelTypeController = TextEditingController();
  final dateController = TextEditingController();
  AddScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New vechile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.purple,
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                'Add Image',
                style: TextStyle(color: Colors.white),
              ),
            ),
            CustomTextField(
              controller: modelController,
              hintText: 'Model',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: colorController,
              hintText: 'Color',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: wheelTypeController,
              hintText: 'WheelType',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            DateTextfield(
              controller: dateController,
              hintText: 'Manufacture date',
              obscureText: false,
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(onPressed: () {})
          ],
        ),
      ),
    );
  }
}
