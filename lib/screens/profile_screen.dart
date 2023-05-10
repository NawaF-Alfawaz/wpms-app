import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/Rounded_Button_New.dart';
import '../components/app_drawer.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  BuildContext? lastContext;
  FirebaseFirestore? instance;
  User user = FirebaseAuth.instance.currentUser!;

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _userAddressController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

// this is how to get the current user
  void getCurrentUser() async {
    instance = await FirebaseFirestore.instance;
    final customerData = await instance?.collection('Customer').doc(user.uid);
    //customerData!.get().then((value) => null)

    await customerData!.get().then((snapshot) {
      _usernameController.text = snapshot.get("CustomerName");
      _userAddressController.text = snapshot.get("Address");
      _phoneController.text = snapshot.get("Phone");
    });
  }

  void _submiteForm(String userName, String userAddress, String phone) async {
    User user = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance
        .collection('Customer')
        .doc(user.uid)
        .update({
      'CustomerName': userName,
      'Address': userAddress,
      'Phone': phone,
    });
    await FirebaseFirestore.instance
        .collection('Customer')
        .doc(user.uid)
        .collection('Logs')
        .add({
      'Type': 'Account modification',
      'CustomerName': userName,
      'Address': userAddress,
      'Phone': phone,
      'Date': DateTime.now().toIso8601String(),
    });
    ScaffoldMessenger.of(lastContext!).showSnackBar(
        const SnackBar(content: Text("Your infromation has been updated")));
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
      _submiteForm(
        _usernameController.text.trim(),
        _userAddressController.text.trim(),
        _phoneController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    lastContext = context;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Update Information"),
        backgroundColor: const Color.fromRGBO(5, 132, 54, 1),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.white,
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 110,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _usernameController,
                        key: const ValueKey('CustomerName'),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid username.';
                          }
                          return null;
                        },
                        onSaved: (username) {
                          _usernameController.text = username!;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _phoneController,
                        key: const ValueKey('phone'),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            return 'Phone number must be equal 10 characters long.';
                          }
                          return null;
                        },
                        onSaved: (user_phone) {
                          _phoneController.text = user_phone!;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: _userAddressController,
                        key: const ValueKey('address'),
                        keyboardType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid address.';
                          }
                          return null;
                        },
                        onSaved: (address) {
                          _userAddressController.text = address!;
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    RoundedButtonNew(
                      text: 'Save',
                      color: const Color.fromRGBO(5, 132, 54, 1),
                      press: _submit,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
