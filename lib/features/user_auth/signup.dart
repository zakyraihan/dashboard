import 'package:dashboard/features/user_auth/auth/controller/auth_controller.dart';
import 'package:dashboard/features/user_auth/login.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObsecure = true;

  void setObsecure() {
    setState(() {
      isObsecure = !isObsecure;
    });
  }

  final authC = Get.put(AuthController());
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
                    controller: authC.userNameController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const Gap(25),
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
            const Gap(25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Obx(
                () => TextButton(
                  onPressed: () async => await authC.signUp(),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        authC.isLoading.isTrue ? 'loading...' : 'Sign Up',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have An Account?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF635C5C),
                  ),
                ),
                const Gap(5),
                InkWell(
                  onTap: () => Get.to(const LoginScreen()),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent,
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
