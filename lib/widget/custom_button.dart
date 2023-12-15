import 'package:dashboard/color/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.label,
    this.isFullButton = false,
    this.width = 200,
    this.height = 60,
    this.onPressed,
    this.loading,
  });

  final String label;
  final bool isFullButton;
  final double width;
  final double height;
  final Function()? onPressed;
  final CircularProgressIndicator? loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(
            vertical: 9,
            horizontal: 18,
          )),
          backgroundColor: const MaterialStatePropertyAll(blue),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          minimumSize: MaterialStatePropertyAll(
            Size(isFullButton ? Get.size.width : width, height),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
