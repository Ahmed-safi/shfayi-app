import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifayiy/cache_helper.dart';
import 'package:shifayiy/screens/welcom_screen.dart';
import '../../screens/authScreens/login.dart';
import 'AuthStates.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthStatesInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  // bool isDark = false;
  // void Mode({bool? fromShared}) {
  //   if (fromShared != null) {
  //     isDark = fromShared;
  //     emit(StatesModeState());
  //   } else {
  //     isDark = !isDark;
  //     CacheHelper.putData(key: "isDark", value: isDark).then((value) {
  //       emit(StatesModeState());
  //     });
  //   }
  // }

  // int currentIndex = 0;
  // List<Widget> pages = [
  //   const Lands(),
  //   const MyLands(),
  //   const Profile(),
  // ];
  // void changeNavBar(int index) {
  //   currentIndex = index;
  //   emit(StatesNavigationState());
  // }
  // String uid = FirebaseAuth.instance.currentUser!.uid;
  /* QueryDocumentSnapshot<Map<String, dynamic>>? userData;
  void getUserData(uid) async {
    emit(GetUserDataLoadingState());
    await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: uid)
        .get()
        .then((value) {
      userData = value.docs[0];
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      emit(GetUserDataErrorState());
    });
  }

  */
  Map<String, dynamic>? userData = {};
  void getUserData() async {
    emit(GetUserDataLoadingState());
    var DocotrUID = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(DocotrUID)
        .get()
        .then((value) {
      userData = value.data();

      emit(GetUserDataSuccessState());

      print(userData);
      print("===========");
    }).catchError((error) {
      emit(GetUserDataErrorState());
    });
  }

  void userRegister(
      {required String email,
      required String password,
      required String f_name,
      required String m_name,
      required String l_name,
      required String location,
      required String dob,
      required String phone,
      String? position,
      required bool isDoctor}) async {
    emit(RegisterLoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        userCreate(
            email: email,
            m_name: m_name,
            l_name: l_name,
            f_name: f_name,
            location: location,
            dob: dob,
            phone: phone,
            uId: value.user!.uid,
            isDoctor: isDoctor,
            position: position);

        await FirebaseMessaging.instance.subscribeToTopic(value.user!.uid);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState("كلمة المرور هذه ضعيفة."));
        print('كلمة المرور هذه ضعيفة.');
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState("هناك حساب موجود بالفعل لهذا الايميل."));
        print('هناك حساب موجود بالفعل لهذا الايميل.');
      }
    }
  }

  void userCreate({
    required String email,
    required String f_name,
    required String m_name,
    required String l_name,
    required String location,
    required String dob,
    required String phone,
    required String uId,
    required bool isDoctor,
    String? position,
  }) async {
    await FirebaseFirestore.instance.collection("users").doc(uId).set({
      "email": email,
      "f_name": f_name,
      "m_name": m_name,
      "l_name": l_name,
      "location": location,
      "phone": phone,
      "uId": uId,
      "position": position,
      "isDoctor": isDoctor
    }).then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }

  void login({email, password, isDoctor}) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(value.user!.uid)
            .get()
            .then((value) {
          value.data()!["isDoctor"];

          emit(LoginSuccessState(value.data()!["isDoctor"]));
        }).catchError((error) {
          print("=============================");
          print(error.toString());
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState('لا يوجد مستخدم بهذا الايميل.'));
        print('لا يوجد مستخدم بهذا الايميل.');
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState('تم كتابة  كلمة مرور خاطئة لهذا المستخدم.'));
        print('تم كتابة  كلمة مرور خاطئة لهذا المستخدم.');
      }
    }
  }

  List<Map<String, dynamic>> categories = [];
  void getCategories() async {
    await FirebaseFirestore.instance
        .collection("categories")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        categories.add({
          'value': element.data()["e_name"],
          'label': element.data()["name"],
          'icon': const Icon(Icons.medical_services),
        });
      });
    });
  }

  void logout(context) async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Welcome()),
        (route) => false,
      );
    });
    emit(SignOutSuccess());
  }

  bool isChecked = false;
  void changeCheck() {
    isChecked = !isChecked;
    emit(IsCheckedState());
  }

  bool isVisible = false;
  void Visible() {
    isVisible = !isVisible;
    emit(IsVisibleState());
  }
}
