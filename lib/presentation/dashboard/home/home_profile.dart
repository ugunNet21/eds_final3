import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeProfileWidget extends StatelessWidget {
  const HomeProfileWidget({super.key});

  @override
Widget build(BuildContext context) {
  return Container(
    height: 80,
    color: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start, // Tambahkan ini untuk rata kiri
              children: [
                const Text(
                  'Hallo, User',
                  style: TextStyle(fontWeight: FontWeight.bold), // Tambahkan style untuk tebalkan
                ),
                const Text('Selamat Datang'),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: IconButton(
            icon: Image.asset('assets/icons/ic_edo.png'),
            onPressed: () {
              Get.toNamed('/profile');
            },
          ),
        ),
      ],
    ),
  );
}
}