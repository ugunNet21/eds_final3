
// import 'package:eds_final/features/register/register_page.dart';
import 'package:edsp_final3/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller2.dart';

class LoginPage extends GetView<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/img_login.png'),
              SizedBox(height: 10.0),
              Text(
                "Selamat Datang",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: AppColors.accentBlackApple),
              ),
              SizedBox(height: 10),
              Text(
                "Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ic_google.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8.0),
                    Text('Login with Google'),
                  ],
                ),
                onPressed: _authController.signInWithGoogle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.whitePutih1,
                  foregroundColor: AppColors.accentBlack,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side:
                        BorderSide(width: 1, color: AppColors.primaryBluecerah),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ic_apple.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8.0),
                    Text('Login with Apple ID'),
                  ],
                ),
                onPressed: () {
                  // login dengan Apple ID
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentBlackApple,
                  foregroundColor: AppColors.whitePutih,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              // email gmail
              SizedBox(height: 8.0),
              ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/ic_gmail.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8.0),
                    Text('Sign Up'),
                  ],
                ),
                onPressed: () {
                  // Get.to(RegisterPage());
                  Get.offAllNamed('/hometab');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBluemuda,
                  foregroundColor: AppColors.whitePutih,
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
      ),
      backgroundColor: AppColors.whitePutih1,
    );
  }
}
