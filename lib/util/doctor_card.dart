import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String doctorImagePath;
  final String rating;
  final String doctorName;
  final String doctorProfession;

  const DoctorCard({
    super.key,
    required this.doctorImagePath,
    required this.rating,
    required this.doctorName,
    required this.doctorProfession,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              //picture
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  doctorImagePath,
                  height: 100,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //rating
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                  ),
                  const Text(
                    '4.9',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              //doctor name
              Text(
                doctorName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              //doctor title
              Text(doctorProfession),
            ],
          ),
        ),
      ),
    );
  }
}
