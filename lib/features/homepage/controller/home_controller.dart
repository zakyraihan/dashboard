import 'package:dashboard/route/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future<void> signOut() async {
    print('signout called');
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(RouteName.onBoarding);
    } catch (e) {
      print('error from signOut $e');
    }
  }
}
