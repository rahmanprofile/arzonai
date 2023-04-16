import 'package:bwi_shopify/view/registration/code_verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/constant.dart';
import '../components/round_button.dart';
import '../screen/home.dart';

class PhoneAuthentication extends StatefulWidget {
  //bool isLogin;
  const PhoneAuthentication({Key? key,
    //required this.isLogin,
  }) : super(key: key);

  @override
  State<PhoneAuthentication> createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {
  final auth = FirebaseAuth.instance;
  // void userDetails() async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(auth.currentUser!.uid)
  //         .set({
  //       "name": nameController.text.trim(),
  //       "email": emailController.text.trim(),
  //       "phone": phoneController.text.trim(),
  //       "time": DateTime.now(),
  //       "terms": "${nameController.text} is agree with our terms & policy",
  //       "conditions": "${nameController.text} is agree with our conditions",
  //       "uid": auth.currentUser!.uid,
  //     });
  //   } on FirebaseAuthException catch (exp) {
  //     Inject.message(exp.message.toString());
  //   }
  // }

  bool isLoading = false;
  final phoneController = TextEditingController();
  // final nameController = TextEditingController();
  // final emailController = TextEditingController();
  String code = "+91";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                  (route) => false);
            },
            child: Text(
              "SKIP",
              style: styleBlack15,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Image.asset("assets/imp/next_logo.png", height: 180, width: 180),
                const SizedBox(height: 60.0),
                Text(
                  'Welcome',
                  style: styleBlack35,
                ),
                Text("Phone Registration", style: styleBlack20),
                const SizedBox(height: 20),
                Text("Add a phone number we'll send a verification code",
                    style: styleBlackNormal14),
                Text("so we know you are real", style: styleBlackNormal14),
                const SizedBox(height: 20),
                Container(
                  //height: 140,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
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
                        // if (!widget.isLogin)
                        //   Container(
                        //     height: 48,
                        //     width: double.infinity,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(5.0),
                        //         color: Colors.grey[200]),
                        //     child: TextFormField(
                        //       controller: nameController,
                        //       decoration: const InputDecoration(
                        //         hintText: "Enter name",
                        //         border: InputBorder.none,
                        //         prefixIcon: Icon(CupertinoIcons.person),
                        //       ),
                        //     ),
                        //   ),
                        // if (!widget.isLogin) const SizedBox(height: 8.0),
                        // if (!widget.isLogin)
                        //   Container(
                        //     height: 48,
                        //     width: double.infinity,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(5.0),
                        //         color: Colors.grey[200]),
                        //     child: TextFormField(
                        //       controller: emailController,
                        //       decoration: const InputDecoration(
                        //         hintText: "Enter email",
                        //         border: InputBorder.none,
                        //         prefixIcon: Icon(CupertinoIcons.mail),
                        //       ),
                        //     ),
                        //   ),
                        // if (!widget.isLogin) const SizedBox(height: 8.0),
                        Container(
                          height: 48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.grey[200],
                          ),
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: "Enter mobile number",
                              border: InputBorder.none,
                              prefixIcon: Icon(CupertinoIcons.phone),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        isLoading
                            ? const Center(
                                child:
                                    CircularProgressIndicator(color: logoColor),
                              )
                            : RoundButton(
                                text: "Register",
                                color: logoColor,
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                    FirebaseAuth.instance.verifyPhoneNumber(
                                      phoneNumber:
                                          "$code${phoneController.text}",
                                      verificationCompleted:
                                          (PhoneAuthCredential credential) {
                                        setState(() {
                                          isLoading = false;
                                          debugPrint("completed...");
                                        });
                                      },
                                      verificationFailed:
                                          (FirebaseAuthException exp) {
                                        setState(() {
                                          isLoading = false;
                                          debugPrint("failed...");
                                        });
                                      },
                                      codeSent:
                                          (String verificationId, int? token) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CodeVerification(
                                              verificationId: verificationId,
                                              mobileNumber:
                                                  phoneController.text,
                                            ),
                                          ),
                                        );
                                      },
                                      codeAutoRetrievalTimeout:
                                          (String verificationId) {
                                        setState(() {
                                          isLoading = false;
                                          debugPrint("retrieval...");
                                        });
                                      },
                                    );
                                  });
                                },
                                textColor: whiteColor,
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
