import 'package:dashboard/color/constant_color.dart';
import 'package:dashboard/features/user_auth/auth/controller/auth_controller.dart';
import 'package:dashboard/features/user_auth/signup.dart';
import 'package:dashboard/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsecure = true;

  void setObsecure() {
    setState(() {
      isObsecure = !isObsecure;
    });
  }

  final AuthController authC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Image.asset(
              'images/auth/Group 27567.png',
              height: 230,
            ),
            const Gap(38),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: authC.emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Gap(25),
                  TextFormField(
                    controller: authC.passwordController,
                    obscureText: isObsecure,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: setObsecure,
                          icon: isObsecure
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF635C5C),
                  ),
                ),
              ),
            ),
            const Gap(39),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Obx(() => CustomButtonWidget(
                  label: authC.isLoading.isTrue ? 'Loading...' : 'Sign In',
                  isFullButton: true,
                  onPressed: authC.isLoading.isTrue
                      ? null
                      : () async => await authC.signIn())),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Dont have An Account?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF635C5C),
                  ),
                ),
                const Gap(5),
                InkWell(
                  onTap: () => Get.to(const SignUpScreen()),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: blue,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
