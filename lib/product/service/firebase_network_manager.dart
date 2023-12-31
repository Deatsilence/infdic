import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infdic/product/navigation/app_router.dart';
import 'package:infdic/product/utility/extension/custom_string_extension.dart';

/// [FirebaseNetworkManager] is the network manager of firebase
final class FirebaseNetworkManager {
  FirebaseNetworkManager._init();

  static FirebaseNetworkManager? _instance;

  /// [instance] is the instance of [FirebaseNetworkManager]
  static FirebaseNetworkManager get instance =>
      _instance ??= FirebaseNetworkManager._init();

  final _authInstance = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;

  /// [signUpWithEmailAndPassword] is the sign in with email and password
  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userResponse = await _authInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userResponse;
  }

  /// [sendOTPCodeToPhoneNumber] is the verify phone number
  /// for signUp or forget password
  Future<void> sendOTPCodeToPhoneNumber({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    await _authInstance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {
        context.router.push(const SignUpRoute());
      },
      verificationFailed: print,
      codeSent: (verificationId, code) =>
          context.router.push(OTPRoute(verificationId: verificationId)),
      codeAutoRetrievalTimeout: print,
    );
  }

  /// [verifyCode] is the verify code
  Future<void> verifyCode({
    required String verificationId,
    required String smsCode,
    required void Function(bool isSuccess) onSuccess,
  }) async {
    final cred = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    onSuccess(cred.smsCode.hasValue);
    debugPrint(cred.toString());
  }

  /// [checkExistingUser] is the check existing user
  Future<bool> checkExistingUser() async {
    final snapshot = await _firebaseFirestore
        .collection('users')
        .doc(_authInstance.currentUser!.uid)
        .get();

    return snapshot.exists;
  }
}
