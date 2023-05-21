import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shifayiy/StateManagment/AuthCubit/AuthStates.dart';
import 'package:shifayiy/screens/authScreens/doctorRegister.dart';
import 'package:shifayiy/screens/authScreens/login.dart';
import 'package:shifayiy/screens/home_main.dart';
import 'package:shifayiy/screens/navScreens/home.dart';
import 'package:shifayiy/utils/colors.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../StateManagment/AuthCubit/AuthCubit.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Future getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    await Geolocator.getCurrentPosition().then((value) async {
      print("======");

      List<Placemark> placemarks =
          await placemarkFromCoordinates(value.latitude, value.longitude);

      print(placemarks[0].locality);
      locationController.text = placemarks[0].locality.toString();
      print("======");
    });
  }

  void initState() {
    // here get location
    getLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController fNameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // automaticallyImplyLeading: false,
          ),
      body: BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
        if (state is CreateUserSuccessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeMain()),
            (route) => false,
          );
        }
      }, builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (state is RegisterLoadingState)
                    const LinearProgressIndicator(),
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
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "تسجيل مستخدم جديد",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily: "tajawal",
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => DoctorRegister())));
                        },
                        child: Text(
                          "من هنا",
                          style: TextStyle(
                              fontFamily: "tajawal",
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "تسجيل دكتور جديد ؟",
                        style: TextStyle(
                            fontFamily: "tajawal", color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontFamily: "tajawal", color: Colors.black),
                    keyboardType: TextInputType.name,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                    },
                    controller: fNameController,
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
                        hintText: "الاسم الأول",
                        hintStyle: const TextStyle(
                            fontFamily: "tajawal", color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontFamily: "tajawal", color: Colors.black),
                    keyboardType: TextInputType.name,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                    },
                    controller: mNameController,
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
                        hintText: "اسم الأب",
                        hintStyle: const TextStyle(
                            fontFamily: "tajawal", color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontFamily: "tajawal", color: Colors.black),
                    keyboardType: TextInputType.name,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                    },
                    controller: lNameController,
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
                        hintText: "اسم العائلة",
                        hintStyle: const TextStyle(
                            fontFamily: "tajawal", color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ),
                  //----------
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime(1900),
                        maxTime: DateTime.now(),
                        onChanged: (date) {},
                        onConfirm: (date) {
                          setState(() {
                            dateController.text =
                                '${date.year}-${date.month}-${date.day}';
                          });
                        },
                        currentTime: DateTime.now(),
                      );
                    },
                    readOnly: true,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontFamily: "tajawal", color: Colors.black),
                    keyboardType: TextInputType.datetime,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                    },
                    controller: dateController,
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
                        hintText: "تاريخ الميلاد",
                        hintStyle: const TextStyle(
                            fontFamily: "tajawal", color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_month_rounded),
                          color: Colors.black,
                          onPressed: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(1900),
                              maxTime: DateTime.now(),
                              onChanged: (date) {},
                              onConfirm: (date) {
                                setState(() {
                                  dateController.text =
                                      '${date.year}-${date.month}-${date.day}';
                                });
                              },
                              currentTime: DateTime.now(),
                            );
                          },
                        )),
                  ),
                  //----------
                  const SizedBox(
                    height: 25,
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
                        hintStyle: const TextStyle(
                            fontFamily: "tajawal", color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                  ),
                  //----------
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontFamily: "tajawal", color: Colors.black),
                    keyboardType: TextInputType.phone,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                      if (value.length < 8) {
                        return "لابد ان يكون اكبر من 8 احرف";
                      }
                    },
                    controller: phoneController,
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
                        hintText: "رقم الموبايل",
                        hintStyle: const TextStyle(
                            fontFamily: "tajawal", color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.phone,
                          color: Colors.black,
                        )),
                  ),
                  //----------
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontFamily: "tajawal", color: Colors.black),
                    keyboardType: TextInputType.streetAddress,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "حقل مطلوب";
                      }
                    },
                    controller: locationController,
                    decoration: InputDecoration(
                        enabled: false,
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          // Sets border corner radius
                          borderSide: BorderSide(
                              color: ColorManager.lightGrey,
                              width: 2.0), // Sets border color and width
                        ),
                        hintText: "العنوان",
                        hintStyle: const TextStyle(
                            fontFamily: "tajawal", color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.location_on,
                          color: Colors.black,
                        )),
                  ),
                  //---------
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
                    controller: cpasswordController,
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
                        hintText: "تأكيد كلمة المرور",
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
                    height: 25,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  InkWell(
                    onTap: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState!.validate()) {
                        AuthCubit.get(context).userRegister(
                            f_name: fNameController.text,
                            m_name: mNameController.text,
                            l_name: lNameController.text,
                            dob: dateController.text,
                            phone: phoneController.text,
                            location: locationController.text,
                            email: emailController.text,
                            position: null,
                            isDoctor: false,
                            password: passwordController.text);
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      child: const Center(
                          child: Text(
                        "التسجيل",
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
                                  builder: ((context) => const LoginPage())));
                        },
                        child: Text(
                          "سجل الدخول",
                          style: TextStyle(
                              fontFamily: "tajawal",
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text(
                        "لديك حساب بالفعل؟",
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