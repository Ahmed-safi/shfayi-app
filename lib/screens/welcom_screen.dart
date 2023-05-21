import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shifayiy/screens/authScreens/doctorRegister.dart';
import 'package:shifayiy/screens/authScreens/login.dart';
import 'package:shifayiy/screens/authScreens/userRegister.dart';

import '../../utils/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: SvgPicture.asset(
                    'assets/icon.svg',
                    height: 120,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: const Text(
                      'الهدف الرئيسي للرعاية التلطيفية هو تحسين جودة الحياة وتلبية الاحتياجات الشخصية والثقافية للمرضى وعائلاتهم',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "tajawal",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        color: Color(0xff7e7e7e),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: ColorManager.primary,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginPage();
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                          fontFamily: "tajawal",
                          fontSize: 18,
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorManager.primary,
                    elevation: 2,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const UserRegister();
                        },
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 103, left: 103),
                    child: Text(
                      'مستخدم جديد',
                      style: TextStyle(
                          fontFamily: "tajawal",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorManager.primary,
                    elevation: 2,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const DoctorRegister();
                        },
                      ),
                    );
                  },
                  child: const Padding(
                    padding: const EdgeInsets.only(right: 117, left: 117),
                    child: Text(
                      'دكتور جديد',
                      style: TextStyle(
                          fontFamily: "tajawal",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
