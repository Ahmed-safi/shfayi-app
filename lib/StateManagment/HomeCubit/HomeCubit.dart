import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';
import 'package:shifayiy/screens/doctor_screens/home_doctor.dart';
import 'package:shifayiy/screens/navScreens/doctors.dart';
import 'package:shifayiy/screens/navScreens/home.dart';
import 'package:shifayiy/screens/navScreens/notification.dart';
import 'package:shifayiy/screens/navScreens/profile.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List pages = [
    {"page": const Home(), "name": "Home"},
    {"page": const Notifications(), "name": "Notifications"},
    {"page": const Doctors(), "name": "Doctors"},
    {"page": const Profile(), "name": "Profile"},
  ];
  List pages_doctors = [
    {"page": const HomeDoctor(), "name": "Home"},
    {"page": const Notifications(), "name": "Notifications"},
    {"page": const Profile(), "name": "Profile"},
  ];
  void changeNavBar(int index) {
    currentIndex = index;
    emit(HomeNavigationState());
  }
}
