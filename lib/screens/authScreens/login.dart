import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifayiy/StateManagment/AuthCubit/AuthStates.dart';
import 'package:shifayiy/cache_helper.dart';
import 'package:shifayiy/screens/authScreens/forgetPass.dart';
import 'package:shifayiy/screens/authScreens/userRegister.dart';
import 'package:shifayiy/screens/doctor_screens/home_doctor.dart';
import 'package:shifayiy/screens/doctor_screens/main_doctor.dart';
import 'package:shifayiy/utils/colors.dart';

import '../../StateManagment/AuthCubit/AuthCubit.dart';
import '../home_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          ),
      body: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
        if (state is LoginSuccessState) {
          AuthCubit.get(context).getUserData();

          if (state.isDoctor == false) {
            CacheHelper.saveData(key: "isDoctor", value: false);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeMain()),
              (route) => false,
            );
          } else {
            CacheHelper.saveData(key: "isDoctor", value: true);

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainDoctor()),
              (route) => false,
            );
          }
        }

        if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                state.error!,
              )));
        }
      }, builder: (context, state) {
        return SingleChildScrollView(
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
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "تسجيل الدخول",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 26),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "قم بتسجيل الدخول",
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    textAlign: TextAlign.end,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                      if (value.length < 7) {
                        return "لابد ان يكون اكبر من 7 احرف";
                      }
                    },
                    controller: emailController,
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
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    textAlign: TextAlign.end,
                    obscureText:
                        AuthCubit.get(context).isVisible ? true : false,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                      if (value.length < 7) {
                        return "كلمة المرور اقل من 7 احرف";
                      }
                    },
                    controller: passwordController,
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
                        hintText: "كلمة المرور",
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: const Icon(Icons.lock),
                        prefixIcon: IconButton(
                          onPressed: () {
                            AuthCubit.get(context).Visible();
                          },
                          icon: Icon(AuthCubit.get(context).isVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  state is LoginLoadingState
                      ? CircularProgressIndicator()
                      : InkWell(
                          onTap: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              AuthCubit.get(context).login(
                                  email: emailController.text,
                                  password: passwordController.text);
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
                              "تسجيل الدخول",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => UserRegister())));
                        },
                        child: Text(
                          "انشى حساب",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "ليس لديك حساب؟",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),

                  Divider(endIndent: 10, indent: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => ForgetPass())));
                    },
                    child: Text(
                      "هل نسيت كلمة المرور ؟",
                      style: TextStyle(
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
