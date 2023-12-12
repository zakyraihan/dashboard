import 'dart:developer';

import 'package:dashboard/route/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final RxBool _isLoading = false.obs;

  Future<bool> isLoggedIn() async {
    _isLoading.value = true;
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('Error From is Loggedd In $e');
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  void handleRoute() async {
    if (await isLoggedIn()) {
      Get.offAllNamed(RouteName.dashBoard);
    } else {
      Get.offAllNamed(RouteName.onBoarding);
    }
  }

  @override
  void onInit() {
    handleRoute();
    super.onInit();
  }
}
