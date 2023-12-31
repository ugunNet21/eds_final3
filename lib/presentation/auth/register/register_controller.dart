import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/register_user_request.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/services/firebase_auth_services.dart';

class RegistFormController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final AuthRepository authRepository;

  RegistFormController(
      {required this.authRepository, required this.firebaseAuthService});

  late TextEditingController emailTextController;

  @override
  void onInit() {
    super.onInit();

    String email = firebaseAuthService.getCurrentSignedInUserEmail() ?? '';
    emailTextController = TextEditingController(text: email);
  }

  Future<void> registerUser({required UserBody user}) async {
    // TODO: Call AuthRepository.registerUser()
  }
}
