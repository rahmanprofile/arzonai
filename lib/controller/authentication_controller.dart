import 'package:bwi_shopify/view/registration/code_verification.dart';
import 'package:bwi_shopify/view/screen/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'inject.dart';

class AuthController {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;
  get auth => _auth;
  get store => _store;
  get user => _user;

  Future register(context, String phone,phoneNumber) async {
    try {
      final _user = _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException exp) {},
        codeAutoRetrievalTimeout: (String verificationId) {},
        codeSent: (String verificationId, int? token) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CodeVerification(
                verificationId: verificationId,
                mobileNumber: phone,
              ),
            ),
          );
        },
      );
      return _user;
    } on FirebaseAuthException catch (exp) {
      return Inject.message(exp.message.toString());
    }
  }

  Future verifyNumber(context, String verificationId, String codeController) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: codeController,
      );
      await _auth.signInWithCredential(credential).then((value) =>
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
              (route) => false),
      );
    } on FirebaseAuthException catch (exp) {
      Inject.message(exp.message.toString());
    }
  }
}
