import 'package:dashboard/color/constant_color.dart';
import 'package:dashboard/route/route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Pilihan extends StatefulWidget {
  const Pilihan({super.key});

  @override
  State<Pilihan> createState() => _PilihanState();
}

class _PilihanState extends State<Pilihan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/auth/Group 27567.png'),
          const Gap(20),
          Text(
            'Masuk Sebagai',
            style: style(Colors.grey.shade700, 18, FontWeight.normal),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Get.offAllNamed(RouteName.homeScreen),
                child: Text(
                  'Mahasiswa',
                  style: style(blue, 18, FontWeight.w500),
                ),
              ),
              const Text('OR'),
              TextButton(
                onPressed: () => Get.offAllNamed(RouteName.dashBoard),
                child: Text(
                  'Admin',
                  style: style(blue, 18, FontWeight.w500),
                ),
              ),
              const Gap(20),
            ],
          ),
        ],
      ),
    );
  }
}
