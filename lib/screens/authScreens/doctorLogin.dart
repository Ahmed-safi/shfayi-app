import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shifayiy/StateManagment/AuthCubit/AuthStates.dart';
import 'package:shifayiy/screens/authScreens/userRegister.dart';
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
        title: Text("Doctor login"),
        // automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
        if (state is LoginSuccessState) {
          // print("doneeeeeeeeeee");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeMain()),
            (route) => false,
          );
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
                                fontFamily: "tajawal",
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "قم بتسجيل الدخول",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: "tajawal",
                                color: Colors.grey,
                                fontSize: 14),
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
                    style: const TextStyle(
                        fontFamily: "tajawal", color: Colors.black),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                      if (value.length < 8) {
                        return "لابد ان يكون اكبر من 8 احرف";
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
                        hintStyle: TextStyle(
                            fontFamily: "tajawal", color: Colors.grey),
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
                    style: const TextStyle(
                        fontFamily: "tajawal", color: Colors.black),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                      if (value.length < 8) {
                        return "كلمة المرور اقل من 8 احرف";
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
                        hintStyle: const TextStyle(
                            fontFamily: "tajawal", color: Colors.grey),
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
                            child: Center(
                                child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  fontFamily: "tajawal",
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
                              fontFamily: "tajawal",
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "ليس لديك حساب؟",
                        style: TextStyle(
                            fontFamily: "tajawal", color: Colors.black),
                      ),
                    ],
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
