import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Future<void> getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    print('USER: $user');
  }

  @override
  void onInit() async {
    await getCurrentUser();
    super.onInit();
  }
}
