import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/values/colors.dart';
import '../../../core/values/images.dart';
import '../../widgets/signin_google_button.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SvgPicture.asset(
              ImagesAssets.imageIllustrationLoginSvg,
              height: 255,
            ),
            const SizedBox(height: 40),
            const Text(
              'Selamat Datang',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
              style: TextStyle(
                color: AppColors.grey6A,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const Expanded(child: SizedBox.shrink()),
            SocialLoginButton(
              text: 'Masuk dengan Google',
              iconAsset: ImagesAssets.iconGooglePng,
              outlineBorderColor: AppColors.mint,
              onPressed: () async {
                await Get.find<LoginController>().onGoogleSignIn();
              },
            ),
            const SizedBox(height: 25),
            SocialLoginButton(
              text: 'Masuk dengan Apple ID',
              iconAsset: ImagesAssets.iconApplePng,
              backgroundColor: AppColors.black,
              textColor: Colors.white,
              onPressed: () {},
            ),
            const SizedBox(height: 32),
            SizedBox(height: 8.0),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/ic_google.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 15.0),
                    Text('Sign Up'),
                  ],
                ),
                onPressed: () {
                  // Get.to(RegisterPage());
                  Get.offAllNamed('/dashboard');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side:
                        BorderSide(width: 1, color: AppColors.primaryBlueLight),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
