import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifayiy/screens/authScreens/login.dart';
import 'package:shifayiy/utils/colors.dart';

import '../../StateManagment/AuthCubit/AuthCubit.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController forgetController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // if(state is LoginLoadingState) LinearProgressIndicator(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        child: SvgPicture.asset("assets/Logo.svg"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "استرجاع كلمة المرور",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    textAlign: TextAlign.end,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                      if (value.length < 8) {
                        return "لابد ان يكون اكبر من 8 احرف";
                      }
                    },
                    controller: forgetController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          // Sets border corner radius
                          borderSide: BorderSide(
                              color: ColorManager.primary,
                              width: 2.0), // Sets border color and width
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: ColorManager.primary),
                        ),
                        filled: false,
                        hintText: "البريد الالكتروني",
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                  ),


                  const SizedBox(
                    height: 20,
                  ),

              InkWell(
                    onTap: () async {
                      var forgetEmail = forgetController.text.trim();

                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(email: forgetEmail).then((value) => {
                          print("Email Sent!"),
                          (()=>const LoginPage()),
                        });

                      } on FirebaseAuthException catch(e){
                        print("Errer $e");
                      }

                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: const BorderRadius.all(
                              Radius.circular(50))),
                      child: const Center(
                          child: Text(
                            "استرجع كلمة المرور",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
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
