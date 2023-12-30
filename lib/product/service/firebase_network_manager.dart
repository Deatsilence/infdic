import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infdic/product/navigation/app_router.dart';

/// [FirebaseNetworkManager] is the network manager of firebase
final class FirebaseNetworkManager {
  FirebaseNetworkManager._init();

  static FirebaseNetworkManager? _instance;

  /// [instance] is the instance of [FirebaseNetworkManager]
  static FirebaseNetworkManager get instance =>
      _instance ??= FirebaseNetworkManager._init();

  final _authInstance = FirebaseAuth.instance;

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

  /// [verifyPhoneNumber] is the verify phone number
  /// for signUp or forget password
  Future<void> verifyPhoneNumber({
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
}
