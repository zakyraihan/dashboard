import 'package:dashboard/features/homepage/home_page.dart';
import 'package:dashboard/features/onboarding/onboarding.dart';
import 'package:dashboard/features/user_auth/login.dart';
import 'package:dashboard/features/user_auth/signup.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteName {
  static const onBoarding = '/onboarding-screen';
  static const signUpScreen = '/sign-up-screen';
  static const signInScreen = '/sign-in-screen';
  static const homeScreen = '/home-screen';
}

class RoutePages {
  List<GetPage<dynamic>> routes = [
     GetPage(
      name: RouteName.onBoarding,
      page: () => const OnBoarding(),
    ),
    GetPage(
      name: RouteName.signUpScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: RouteName.signInScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: RouteName.homeScreen,
      page: () => const HomePage(),
    ),
  ];
}
