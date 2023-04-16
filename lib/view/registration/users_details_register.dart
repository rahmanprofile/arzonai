import 'package:bwi_shopify/view/registration/code_verification.dart';
import 'package:bwi_shopify/view/screen/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../controller/constant.dart';

class UserDetailsRegister extends StatefulWidget {
  const UserDetailsRegister({Key? key}) : super(key: key);

  @override
  State<UserDetailsRegister> createState() => _UserDetailsRegisterState();
}

class _UserDetailsRegisterState extends State<UserDetailsRegister> {
  bool isLoading = false;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Arzonai", style: styleBlack28),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: firstNameController,
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return "Enter your first name";
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter first name",
                  hintStyle: styleBlack15,
                  labelText: "First name",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: lastNameController,
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return "Enter your last name";
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter last name",
                  hintStyle: styleBlack15,
                  labelText: "Last name",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return "Enter your email";
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: styleBlack15,
                  labelText: "Enter email",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: phoneNumberController,
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return "Enter your phone number";
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter phone number",
                  hintStyle: styleBlack15,
                  labelText: "Phone number",
                ),
              ),
              const SizedBox(height: 35.0),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: logoColor),
                    )
                  : InkWell(
                      onTap: () async {
                        const code = '+91';
                        setState(() {
                          isLoading = true;
                        });
                        if (_formKey.currentState!.validate()) {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(auth.currentUser!.uid)
                              .set({
                            "firstName": firstNameController.text.trim(),
                            "lastName": lastNameController.text.trim(),
                            "email": emailController.text.trim(),
                            "phone": "$code${phoneNumberController.text}",
                            "time": DateTime.now(),
                            "uid": auth.currentUser!.uid,
                            "terms":
                                "${firstNameController.text} ${lastNameController.text} are agree with our terms & policy",
                            "conditions":
                                "${firstNameController.text} ${lastNameController.text} are agree with our conditions",
                          }).then(
                            (value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            ),
                          );
                          setState(() {
                            isLoading = false;
                          });
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: Container(
                        height: 45.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: logoColor,
                        ),
                        child: Center(
                          child: Text("Submit", style: styleWhite14),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
