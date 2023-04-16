import 'package:bwi_shopify/controller/inject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../controller/constant.dart';
import '../components/round_button.dart';

class PaymentsDetails extends StatefulWidget {
  const PaymentsDetails({Key? key}) : super(key: key);

  @override
  State<PaymentsDetails> createState() => _PaymentsDetailsState();
}

class _PaymentsDetailsState extends State<PaymentsDetails> {
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final holderNameController = TextEditingController();
  final cvvCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final store = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payments Details", style: styleBlack20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Your \nCredit/Debit card details?",
                    style: styleBlack30),
                Text(
                    "Please provides your correct payments information \nfor your delivery.",
                    style: styleBlackNormal15),
                const SizedBox(height: 20),
                TextFormField(
                  controller: cardNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter correct card number';
                    } else if (value.length != 16) {
                      return 'Please enter 16 digit number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your card number",
                    labelText: "Card Number",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: expiryDateController,
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "Enter your expiry date";
                    } else if (value.length != 5) {
                      return "Enter your 4 digit expiry date";
                    }
                  },
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    hintText: "Enter your expire date",
                    labelText: "Expiry Date",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: holderNameController,
                  validator: (value) {
                    if (value == "" || value!.isEmpty) {
                      return "Enter card holder name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Card holder name",
                    labelText: "Holder",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: cvvCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter cvv code';
                    } else if (value.length != 3) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your cvv code",
                    labelText: "CVV",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30.0),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(color: logoColor),
                      )
                    : RoundButton(
                        text: 'Confirm',
                        color: Colors.blue[600]!,
                        onTap: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(auth.currentUser!.uid)
                                .collection("payments")
                                .add({
                              "card_number": cardNumberController.text,
                              "expiry_date": expiryDateController.text,
                              "holder_name": holderNameController.text,
                              "cvv": cvvCodeController.text,
                              "security_agree":
                                  "User agree with our data security services",
                              "uid": auth.currentUser!.uid,
                              "time": DateTime.now(),
                            }).then((value) => Navigator.pop(context));
                          } else {
                            setState(() {
                              _isLoading = false;
                              Inject.message("Payment details added");
                            });
                            debugPrint("object");
                          }
                        },
                        textColor: Colors.white,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
