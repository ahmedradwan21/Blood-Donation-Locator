// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable, unused_local_variable, use_build_context_synchronously, avoid_print, body_might_complete_normally_nullable
import 'package:bldapp/Provider/notification_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:bldapp/generated/l10n.dart';

import '../Colors.dart';
import '../Widget/CustomButton.dart';
import '../Widget/CustomTextFormField.dart';
import 'RegisterView.dart';
import 'ServiceView.dart';

class LoginView extends StatefulWidget {
  static String id = '3';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email, password;
  bool isLoadibg = false;
  String? resetEmail;
  GlobalKey<FormState> key = GlobalKey();
  GlobalKey<FormState> alerDialogKey = GlobalKey();
  bool Visabilty = true;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    Navigator.pushReplacementNamed(context, ServiceView.id);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  IconData Icon = Icons.remove_red_eye;
  Future<void> _loginWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseAuth.instance.authStateChanges().listen((User? user) async {
        if (user != null && user.emailVerified) {
          await Future.delayed(Duration(seconds: 1));
          Navigator.pushReplacementNamed(context, ServiceView.id);
          Provider.of<UserLogin>(context, listen: false).toggleUSerState();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amber[400],
              dismissDirection: DismissDirection.up,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 150,
                left: 10,
                right: 10,
              ),
              content: Text(
                S.of(context).Login_Successful,
                style: TextStyle(color: background),
              ),
            ),
          );
        } else if (user != null) {
          await Future.delayed(Duration(seconds: 2));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amber[400],
              dismissDirection: DismissDirection.up,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
                top: 30,
                bottom: MediaQuery.of(context).size.height - 80,
                left: 10,
                right: 10,
              ),
              content: Text(
                S.of(context).Login_Failed_Email_not_verified,
                style:
                    TextStyle(color: background, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        await Future.delayed(Duration(seconds: 2));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.amber[400],
          dismissDirection: DismissDirection.up,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              top: 30,
              bottom: MediaQuery.of(context).size.height - 80,
              left: 10,
              right: 10),
          content: Text(S.of(context).Please_Enter_correct_email,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: background,
              )),
        ));
      } else if (e.code == 'wrong-password') {
        await Future.delayed(Duration(seconds: 2));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.amber[400],
          dismissDirection: DismissDirection.up,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              top: 30,
              bottom: MediaQuery.of(context).size.height - 80,
              left: 10,
              right: 10),
          content: Text(S.of(context).Please_Enter_correct_password,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: background,
              )),
        ));
      } else if (e.code == 'invalid-email') {
        await Future.delayed(Duration(seconds: 2));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.amber[400],
          dismissDirection: DismissDirection.up,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              top: 30,
              bottom: MediaQuery.of(context).size.height - 80,
              left: 10,
              right: 10),
          content: Text(S.of(context).This_email_is_not_vaild,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: background,
              )),
        ));
      } else {
        await Future.delayed(Duration(seconds: 2));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.amber[400],
          dismissDirection: DismissDirection.up,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              top: 30,
              bottom: MediaQuery.of(context).size.height - 80,
              left: 10,
              right: 10),
          content: Text(S.of(context).Please_check_your_email_or_password,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: background,
              )),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ModalProgressHUD(
      opacity: 0.3,
      progressIndicator: CircularProgressIndicator(color: Colors.amber),
      inAsyncCall: isLoadibg,
      child: SingleChildScrollView(
        child: Form(
          key: key,
          child: SafeArea(
            top: true,
            child: Column(
              children: [
                Container(
                    height: 260,
                    width: double.infinity,
                    child: Image.asset(
                      'Assets/Images/image4.jpeg',
                      fit: BoxFit.fill,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          S.of(context).Welcome_to_BLD,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        S.of(context).Login_to_dicover_more_services,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 8),
                            child: Text(
                              S.of(context).Email_address,
                            ),
                          )),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please type your Email Adress ';
                          } else if (FirebaseAuth
                              .instance.currentUser!.email!.isEmpty) {
                            return 'null';
                          }
                        },
                        onChanged: (value) {
                          email = value;
                        },
                        text: S.of(context).Enter_your_email,
                        suffixIcon: Icons.email,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 8),
                            child: Text(
                              S.of(context).password,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please type your password   ';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        text: S.of(context).Enter_you_password,
                        isVisable: Visabilty,
                        suffixIcon: Visabilty ? Icons.visibility_off : Icon,
                        onPressed: () {
                          setState(() {
                            Visabilty = !Visabilty;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AlertDialog(
                                          backgroundColor: background,
                                          title: Text(
                                            S.of(context).Rest_password,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.amber,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: Form(
                                            key: alerDialogKey,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  S
                                                      .of(context)
                                                      .Please_Enter_your_email_to_rest_password,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                CustomTextFormField(
                                                  onChanged: (value) {
                                                    resetEmail = value;
                                                  },
                                                  text: S
                                                      .of(context)
                                                      .Enter_your_email,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Please type your email';
                                                    } else if (FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .email ==
                                                        null) {
                                                      return 'User not found';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                MaterialButton(
                                                  onPressed: () async {
                                                    setState(() {
                                                      isLoadibg = true;
                                                    });
                                                    try {
                                                      if (alerDialogKey
                                                          .currentState!
                                                          .validate()) {
                                                        await FirebaseAuth
                                                            .instance
                                                            .sendPasswordResetEmail(
                                                                email:
                                                                    resetEmail!);
                                                        await Future.delayed(
                                                            Duration(
                                                                seconds: 2));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                          dismissDirection:
                                                              DismissDirection
                                                                  .up,
                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          margin: EdgeInsets.only(
                                                              top: 30,
                                                              bottom: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height -
                                                                  80,
                                                              left: 10,
                                                              right: 10),
                                                          content: Text(
                                                              S
                                                                  .of(context)
                                                                  .Please_check_your_email_or_password,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                              )),
                                                        ));
                                                      }
                                                    } catch (e) {
                                                      await Future.delayed(
                                                          Duration(seconds: 2));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        dismissDirection:
                                                            DismissDirection.up,
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        margin: EdgeInsets.only(
                                                            top: 30,
                                                            bottom: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height -
                                                                80,
                                                            left: 10,
                                                            right: 10),
                                                        content: Text(
                                                            S
                                                                .of(context)
                                                                .Sorry_this_email_not_found_try_again,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    background)),
                                                      ));
                                                    }
                                                    Navigator.pop(context);
                                                    await Future.delayed(
                                                        Duration(seconds: 2));
                                                    setState(() {
                                                      isLoadibg = false;
                                                    });
                                                  },
                                                  child: Text(
                                                    S.of(context).send,
                                                    style: TextStyle(
                                                        color: background),
                                                  ),
                                                  color: Colors.amber,
                                                )
                                              ],
                                            ),
                                          )));
                                });
                          },
                          child: Text(S.of(context).Forget_Password,
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          text: S.of(context).Sign_in,
                          onTap: () async {
                            setState(() {
                              isLoadibg = true;
                            });
                            if (key.currentState!.validate()) {
                              // await FirebaseMessaging.instance
                              //     .subscribeToTopic('bloodType');
                              await _loginWithEmailAndPassword(
                                  email!, password!);
                            }
                            await Future.delayed(Duration(seconds: 2));
                            setState(() {
                              isLoadibg = false;
                            });
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Text(
                            S.of(context).Or_Login_With,
                            style: TextStyle(fontSize: 17),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).You_dont_have_an_account,
                            style: TextStyle(fontSize: 17),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, RegisterView.id);
                              },
                              child: Text(
                                S.of(context).Register,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.amber),
                              ))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
