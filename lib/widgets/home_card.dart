import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String imageUrl;
  const HomeCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3,
              spreadRadius: 2,
              offset: const Offset(0, 4))
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bhugatti',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Color',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'WheelType',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Manufacture year',
                    style: TextStyle(
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
                        image: NetworkImage(imageUrl), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
