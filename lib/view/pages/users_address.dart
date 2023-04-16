import 'package:bwi_shopify/controller/inject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../controller/constant.dart';
import '../components/round_button.dart';

class UsersAddress extends StatefulWidget {
  const UsersAddress({Key? key}) : super(key: key);

  @override
  State<UsersAddress> createState() => _UsersAddressState();
}

class _UsersAddressState extends State<UsersAddress> {
  final areaAddressController = TextEditingController();
  final cityAddressController = TextEditingController();
  final districtAddressController = TextEditingController();
  final stateAddressController = TextEditingController();
  final countryAddressController = TextEditingController();
  final zipcodeAddressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final store = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  void getAddress() async {
    try{
      setState(() {
        _isLoading = true;
      });
      if (_formKey.currentState!.validate()) {
        await store.collection("users").doc(auth.currentUser!.uid)
            .collection("address")
            .add({
          "area" : areaAddressController.text,
          "city" : cityAddressController.text,
          "district" : districtAddressController.text,
          "state" : stateAddressController.text,
          "country" : countryAddressController.text,
          "zipcode" : zipcodeAddressController.text,
          "address_update" : DateTime.now(),
        });
        setState(() {
          _isLoading = false;
        });
      }
    }on FirebaseAuthException catch (exp) {
      Inject.message(exp.message.toString());
      setState(() {
        _isLoading = false;
      });
    }
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Details", style: styleBlack20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Register \nyour delivery address", style: styleBlack30),
                Text(
                    "Please provides your correct information address \nfor your delivery.",
                    style: styleBlackNormal15),
                const SizedBox(height: 20),
                TextFormField(
                  controller: areaAddressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter area name';
                    } else if (value.length < 3) {
                      return 'Please enter valid area name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Home or area details",
                    labelText: "Area",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: cityAddressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter city name';
                    } else if (value.length < 3) {
                      return 'Please enter valid city name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Your preferred city",
                    labelText: "City",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: districtAddressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter district name';
                    } else if (value.length < 3) {
                      return 'Please enter valid district name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Your area district",
                    labelText: "District",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: stateAddressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter state name';
                    } else if (value.length < 3) {
                      return 'Please enter valid state name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter area state",
                    labelText: "State",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: countryAddressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter country name';
                    } else if (value.length < 3) {
                      return 'Please enter valid country name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your country",
                    labelText: "Country",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: zipcodeAddressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter zipcode name';
                    } else if (value.length < 3) {
                      return 'Please enter valid zipcode';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter your zipcode",
                    labelText: "ZipCode",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25.0),
                _isLoading ? const Center(
                  child: CircularProgressIndicator(color: logoColor),
                ) : RoundButton(
                  text: 'Confirm',
                  color: Colors.blue[600]!,
                  onTap: () async {
                    try{
                      setState(() {
                        _isLoading = true;
                      });
                      if (_formKey.currentState!.validate()) {
                        await store.collection("users").doc(auth.currentUser!.uid)
                            .collection("address")
                            .add({
                          "area" : areaAddressController.text,
                          "city" : cityAddressController.text,
                          "district" : districtAddressController.text,
                          "state" : stateAddressController.text,
                          "country" : countryAddressController.text,
                          "zipcode" : zipcodeAddressController.text,
                          "address_update" : DateTime.now(),
                        }).then((value) => Navigator.pop(context));
                      } else {
                        setState(() {
                          _isLoading = false;
                          Inject.message("Address save successfully");
                        });
                      }
                    }on FirebaseAuthException catch (exp) {
                      Inject.message(exp.message.toString());
                      setState(() {
                        _isLoading = false;
                      });
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
