import 'package:dashboard/features/dashboard/dashboard.dart';
import 'package:dashboard/features/homepage/home_page.dart';
import 'package:dashboard/features/onboarding/onboarding.dart';
import 'package:dashboard/features/pilihan/pilihan.dart';
import 'package:dashboard/features/splash/bindings/splash_bindings.dart';
import 'package:dashboard/features/splash/splash_screen.dart';
import 'package:dashboard/features/user_auth/signin.dart';
import 'package:dashboard/features/user_auth/signup.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteName {
  static const splashScreen = '/';
  static const onBoarding = '/onboarding-screen';
  static const signUpScreen = '/sign-up-screen';
  static const signInScreen = '/sign-in-screen';
  static const mainScreen = '/main-screen';
  static const homeScreen = '/home-screen';
  static const dashBoard = '/dashBoard-screen';
  static const pilihan = '/pilihan-screen';
}

class RoutePages {
  List<GetPage<dynamic>> routes = [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: RouteName.onBoarding,
      page: () => const OnBoarding(),
    ),
    GetPage(
      name: RouteName.dashBoard,
      page: () => const DashboardScreen(),
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
      name: RouteName.pilihan,
      page: () => const Pilihan(),
    ),
    GetPage(
      name: RouteName.homeScreen,
      page: () => const HomePage(),
    ),
  ];
}
