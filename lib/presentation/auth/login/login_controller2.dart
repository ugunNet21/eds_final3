import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  RxBool isLoggedIn = false.obs;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential? userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      if (userCredential != null) {
        // isLoggedIn.value;
        Get.offAllNamed('/dashboard');
      } else {
        Get.snackbar("Error", 'Gagal login');
      }
    } catch (e) {
      print(
        e.toString(),
      );
      Get.snackbar('Error', 'Terjadi kesalahan saat login');
    }
    Future<void> signOut() async {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      Get.offAllNamed('/login');
    }
  }
}
