import 'package:bwi_shopify/view/registration/users_details_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../controller/constant.dart';
import '../screen/home.dart';

class CodeVerification extends StatefulWidget {
  String verificationId;
  String mobileNumber;
  CodeVerification({
    Key? key,
    required this.verificationId,
    required this.mobileNumber,
  }) : super(key: key);

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  bool isLoading = false;
  final phoneCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/imp/next_logo.png", height: 180, width: 180),
            const SizedBox(height: 60.0),
            Text("Verification", style: styleBlack25),
            const SizedBox(height: 4.0),
            Text("Enter your valid otp code number", style: styleBlackNormal15),
            Text("If it is your number is not correct go back",
                style: styleBlackNormal15),
            Text("+91${widget.mobileNumber}", style: styleBlackNormal15),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15.0),
                    Pinput(
                      length: 6,
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(30, 60, 87, 1),
                            fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(234, 239, 243, 1)),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                      ),
                      controller: phoneCodeController,
                    ),
                    const SizedBox(height: 20),
                    isLoading
                        ? Center(
                            child: CircularProgressIndicator(color: logoColor),
                          )
                        : InkWell(
                            onTap: () async {
                              setState(() async {
                                isLoading = true;
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                  verificationId: widget.verificationId,
                                  smsCode: phoneCodeController.text,
                                );
                                setState(() {
                                  isLoading = true;
                                });
                                await FirebaseAuth.instance
                                    .signInWithCredential(credential)
                                    .then((value) =>
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Home()),
                                            (route) => false),
                                );
                                setState(() {
                                  isLoading = false;
                                });
                              });
                            },
                            child: Container(
                              height: 48,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: logoColor,
                              ),
                              child: Center(
                                child: Text("Confirm", style: styleWhite14),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
                "After confirmation you will agree our all types of terms and policy.",
                style: styleGrey12),
            Text("Didn't receive any code", style: styleGrey14),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Text("Resend Code?", style: styleBlack16),
            ),
          ],
        ),
      ),
    );
  }
}
