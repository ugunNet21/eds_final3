import 'package:get/get.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../data/model/user_response.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/services/firebase_auth_services.dart';
import '../../../routes/apps_route.dart';

class LoginController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxBool isLoading = false.obs; // New RxBool to indicate loading state
  final FirebaseAuthService firebaseAuthService;
  final AuthRepository authRepository;

  LoginController({
    required this.firebaseAuthService,
    required this.authRepository,
  });

  @override
  void onInit() {
    super.onInit();
    // Check if the user is already logged in during initialization
    checkLoggedInUser();
  }

  Future<void> checkLoggedInUser() async {
    User? user = await firebaseAuthService.signInWithGoogle();
    isLoggedIn.value = user != null;
  }

  Future<void> onGoogleSignIn() async {
    try {
      isLoading.value = true; // Show loading indicator
      User? user = await firebaseAuthService.signInWithGoogle();
      if (user != null) {
        await isUserRegistered();
      }
    } catch (e) {
      // Show snackbar if there's an error
      Get.snackbar("Error", "Failed to sign in with Google.",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    Get.offAllNamed(Routes.login);
  }

  Future<void> isUserRegistered() async {
    try {
      isLoading.value = true; // Show loading indicator
      String? email = FirebaseAuth.instance.currentUser?.email;
      if (email != null) {
        UserData? userData = await authRepository.getUserByEmail(email: email);
        if (userData != null) {
          // User is Registered
          Get.offAllNamed(Routes.dashboard);
        } else {
          // User is Signed In & Is not Registered
          Get.offAllNamed(Routes.registerForm);
        }
      } else {
        Get.offAllNamed(Routes.login);
      }
    } catch (e) {
      // Show snackbar if there's an error
      Get.snackbar("Error", "Failed to check user registration.",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false; // Hide loading indicator
    }
  }
}
