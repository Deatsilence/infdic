import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

/// [FirebaseNetworkManager] is the network manager of firebase
final class FirebaseNetworkManager {
  FirebaseNetworkManager._init();

  static FirebaseNetworkManager? _instance;

  /// [instance] is the instance of [FirebaseNetworkManager]
  static FirebaseNetworkManager get instance =>
      _instance ??= FirebaseNetworkManager._init();

  final _authInstance = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;

  /// [sendOTPCodeToPhoneNumber] is the verify phone number
  /// for signUp or forget password
  Future<void> sendOTPCodeToPhoneNumber({
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
    required String phoneNumber,
  }) async {
    await _authInstance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  /// [verifyCode] is the verify code
  Future<void> verifyCode({
    required String verificationId,
    required String smsCode,
    required void Function(bool? isSuccess, User? user) onSuccess,
  }) async {
    final cred = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    final user = (await _authInstance.signInWithCredential(cred)).user;

    onSuccess(user != null, user);
    // onSuccess(cred.smsCode.hasValue);
    debugPrint('credSmsCode: ${cred.smsCode}');
  }

  /// [checkExistingUser] is the check existing user
  Future<bool> checkExistingUser({required String id}) async {
    final snapshot = await _firebaseFirestore.collection('user').doc(id).get();

    return snapshot.exists;
  }

  /// [saveUserDataToFirebase] is the save user data to firebase
  Future<void> saveUserDataToFirebase({
    required InfDicUser infDicUser,
    required Map<String, dynamic> data,
  }) async {
    await _firebaseFirestore.collection('user').doc(infDicUser.uId).set(data);
  }

  /// [signOut] is the sign out of [FirebaseAuth
  Future<void> signOut() async {
    await _authInstance.signOut();
  }

  ///  [getCurrentUser] is the get current user
  User? getCurrentUser() => _authInstance.currentUser;

  /// [getDataFromFirestore] is the get data from firestore
  Future<DocumentSnapshot<Map<String, dynamic>>> getDataFromFirestore({
    required String id,
  }) async =>
      _firebaseFirestore.collection('user').doc(id).get();
}
