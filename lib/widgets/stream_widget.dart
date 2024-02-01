import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:towner/controller/firebase_controller.dart';
import 'package:towner/models/vechile_model.dart';
import 'package:towner/screens/details_screen.dart';

class StreamWidget extends StatelessWidget {
  const StreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseController = Provider.of<FirebaseController>(context);
    return StreamBuilder(
      stream: Provider.of<FirebaseController>(context).getVechilesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 150,
                  width: 150,
                  child: Lottie.asset('assets/images/empty.json')),
              const SizedBox(
                height: 10,
              ),
              const Text('No vechiles available.'),
            ],
          ));
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
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Model:${vechile.model}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 20, 0, 2),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Color:${vechile.color}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 20, 0, 2),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'WheelType:${vechile.wheelType}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 20, 0, 2),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Manufacture year:${vechile.manufactureYear}',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 20, 0, 2),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  image: vechile.image,
                                  model: vechile.model,
                                  color: vechile.color,
                                  wheelType: vechile.wheelType,
                                  year: vechile.manufactureYear,
                                ),
                              ));
                        },
                        
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(vechile.image),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
