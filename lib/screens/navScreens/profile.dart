import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:hexa2/views/Settings.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';

import '../../StateManagment/AuthCubit/AuthCubit.dart';
import '../../widgets/BoxTool.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var doctor = HomeCubit.get(context).userData;

        return SingleChildScrollView(
          child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "تعديل".toUpperCase(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#4A3336")),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BoxTools(
                    email: doctor!["email"],
                    first_name: doctor["f_name"],
                    last_name: doctor["l_name"],
                    mid_name: doctor["m_name"],
                    location: doctor["location"],
                    phone: doctor["phone"],
                    position: doctor["position"],
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          AuthCubit.get(context).logout(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        child: const Text(
                          "تسجيل الخروج",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        );
      },
    );
  }
}
