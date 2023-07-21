import 'package:flutter/material.dart';
import '../../../core/values/colors.dart';

class HomeTopBannerWidget extends StatelessWidget {
  const HomeTopBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(21),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mau kerjain soal apa sekarang?",
                        style: TextStyle(fontSize: 20, color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: Image.asset('assets/images/img_dashboard.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
