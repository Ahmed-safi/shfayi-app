import 'dart:ffi';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/firebase_options.dart';
import 'package:shifayiy/screens/doctor_screens/main_doctor.dart';

import 'package:shifayiy/screens/home_main.dart';
import 'package:shifayiy/screens/welcom_screen.dart';
import 'package:shifayiy/utils/colors.dart';

import 'StateManagment/AuthCubit/AuthCubit.dart';
import 'cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool isDoctor = CacheHelper.getData(key: "isDoctor") ?? false;
  print(isDoctor);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'شفائي',
        theme: ThemeData(
            fontFamily: "Tajawal",
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: ColorManager.primary),
            useMaterial3: true,
            appBarTheme: AppBarTheme(
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarColor: HexColor("#EAE9E5")),
                titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                iconTheme: const IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: HexColor("#EAE9E5")),
            scaffoldBackgroundColor: HexColor("#EAE9E5")),
        home: FirebaseAuth.instance.currentUser != null
            ? const Welcome()
            : AnimatedSplashScreen(
                splash: SvgPicture.asset("assets/LogoW.svg"),
                duration: 2000,
                nextScreen: const Welcome(),
                splashTransition: SplashTransition.scaleTransition,
                backgroundColor: ColorManager.primary),
      ),
    );
  }
}
