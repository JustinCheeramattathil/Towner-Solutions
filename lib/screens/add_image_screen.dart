import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:towner/controller/service_controller.dart';
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
    final serviceController = Provider.of<ServiceController>(context);
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
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 4),
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: serviceController.image != null
                      ? FileImage(serviceController.image!)
                      : const AssetImage('assets/images/dummy.jpg')
                          as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () async{
                await serviceController.pickImage();
              },
              color: Colors.purple,
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
              controller: TextEditingController(
                text: serviceController.getFormattedDate(),
              ),
              hintText: 'Manufacture date',
              obscureText: false,
              onPressed: () {
                serviceController.selectDate(context, serviceController);
              },
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
