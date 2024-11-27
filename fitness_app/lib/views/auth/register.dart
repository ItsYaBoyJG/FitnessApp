import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // global key
  final formKey = GlobalKey<FormState>();
  //text fields
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  // focus nodes
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // error message
  late String errorMessage = '';

  verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  processError(FirebaseAuthException error) {
    //   if (error.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
    //    return Text("The email already has an account linked to it.");
    //   }
  }

  Future<bool> userEmailCheck() async {
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: emailTextController.text)
        .get();
    return result.docs.isEmpty;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.70,
      width: double.infinity,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              padding:
                  const EdgeInsets.only(top: 20.0, left: 24.0, right: 24.0),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 36.0,
                        color: AppTheme.appTheme.colorScheme.primary),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorMessage,
                    style: const TextStyle(fontSize: 14.0, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a valid email.';
                      }
                      return null;
                    },
                    controller: emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    focusNode: emailFocus,
                    onFieldSubmitted: (term) {
                      FocusScope.of(context).requestFocus(passwordFocus);
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'Password must be longer than 8 characters.';
                      }
                      return null;
                    },
                    autofocus: false,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    controller: passwordTextController,
                    textInputAction: TextInputAction.next,
                    focusNode: passwordFocus,
                    onFieldSubmitted: (term) {
                      FocusScope.of(context).requestFocus(confirmPasswordFocus);
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () async {
                  /*   final valid = await userEmailCheck();
                      if (!valid) {
                        return Future.error(
                            'A user with that email already exists');
                      } else if (formKey.currentState!.validate()) { */
                  try {
                    firebaseAuth.createUserWithEmailAndPassword(
                        email: emailTextController.text,
                        password: passwordTextController.text);
                  } on FirebaseAuthException catch (error) {
                    errorMessage = error.code;
                  }
                  //   }
                  //verifyEmail();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 210, 217, 131),
                  fixedSize: const Size(250, 15),
                ),
                child: const Text('Sign Up',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppTheme.appTheme.colorScheme.primaryContainer,
                  fixedSize: const Size(250, 15),
                ),
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
