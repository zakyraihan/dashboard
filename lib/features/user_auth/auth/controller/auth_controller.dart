// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/features/firebase/firebase.dart';
import 'package:dashboard/features/user_auth/auth/model/user_model.dart';
import 'package:dashboard/route/route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  CollectionReference userCollection =
      FirebaseCollectionConstant.getUserCollection();

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  Future<bool> _isDuplicateEmail() async {
    final users = await userCollection.get();
    return users.docs
        .any((element) => element['email'] == emailController.text);
  }

  Future<void> signUp() async {
    try {
      _isLoading.value = true;

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final userModel = UserModel(
        accesToken: credential.credential?.accessToken ?? '',
        token: credential.credential?.token.toString() ?? '0',
        createdAt: credential.user?.metadata.creationTime ?? DateTime.now(),
        photoUrl: credential.user?.photoURL ?? '',
        uid: credential.user?.uid ?? '',
        email: emailController.text,
        id: '1',
        password: passwordController.text,
        userName: userNameController.text,
      );
      final user = await userCollection.add(userModel.toJson());

      await userCollection.doc(user.id).update({'id': user.id});

      Get.showSnackbar(const GetSnackBar(
        backgroundColor: Colors.blue,
        title: 'Berhasil Register',
        message: 'Register Berhasil Ke Esa Unggul',
        duration: Duration(seconds: 3),
      )).future.then((value) => Get.offAllNamed(RouteName.dashBoard));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: Colors.blue,
          title: 'Something Went Wrong',
          message: 'Maaf, Password Kurang',
          duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'email-already-in-use') {
        Get.showSnackbar(const GetSnackBar(
          backgroundColor: Colors.blue,
          title: 'Something Went Wrong',
          message: 'Maaf, Email Sudah Terdaftar',
          duration: Duration(seconds: 3),
        ));
      }
    } catch (e, st) {
      print('Error from $e, stack trace $st');
      Get.showSnackbar(GetSnackBar(
        title: 'Something Went Wrong',
        message: 'Sorry, $e',
        duration: const Duration(seconds: 3),
      ));
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> signIn() async {
    _isLoading.value = true;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAllNamed(RouteName.dashBoard);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.showSnackbar(const GetSnackBar(
          title: 'Something Went Wrong',
          message: 'Email Dan User Tidak Ada',
          duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'wrong-password') {
        Get.showSnackbar(const GetSnackBar(
          title: 'Something Went Wrong',
          message: 'Password Salah',
          duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'invalid-email') {
        Get.showSnackbar(const GetSnackBar(
          title: 'Something Went Wrong',
          message: 'Email invalid!',
          duration: Duration(seconds: 3),
        ));
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: 'Something Went Wrong',
          message: 'Invalid Credentials',
          duration: Duration(seconds: 3),
        ));
      }
    } catch (e, st) {
      print('Error from $e, stack trace $st');
      Get.showSnackbar(GetSnackBar(
        title: 'Something Went Wrong',
        message: 'Sorry, $e',
        duration: const Duration(seconds: 3),
      ));
    } finally {
      _isLoading.value = false;
    }
  }
}
