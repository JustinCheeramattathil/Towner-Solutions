import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:towner/controller/service_controller.dart';
import 'package:towner/models/vechile_model.dart';
import 'package:towner/widgets/home_card.dart';

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
      body: StreamBuilder(
          stream: Provider.of<ServiceController>(context).getVechilesStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No vechiles available.'));
            } else {
              List<VechileModel> vechiles = snapshot.data!;
              return ListView.builder(
                itemCount: vechiles.length,
                itemBuilder: (context, index) {
                  VechileModel vechile = vechiles[index];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 3,
                                spreadRadius: 2,
                                offset: const Offset(0, 4))
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Model;${vechile.model}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Color:${vechile.color}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'WheelType:${vechile.wheelType}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Manufacture year:${vechile.manufactureYear}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(vechile.image),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[400],
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
