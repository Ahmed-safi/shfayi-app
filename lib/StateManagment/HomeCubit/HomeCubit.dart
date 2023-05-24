import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';
import 'package:shifayiy/screens/doctor_screens/home_doctor.dart';
import 'package:shifayiy/screens/navScreens/doctors.dart';
import 'package:shifayiy/screens/navScreens/home.dart';
import 'package:shifayiy/screens/navScreens/notification.dart';
import 'package:shifayiy/screens/navScreens/profile.dart';
import 'package:http/http.dart' as http;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  void init() {
    currentIndex = 0;
  }

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

  Map<String, dynamic>? userData = {};
  void getUserData() async {
    emit(GetUserDataLoadingState());
    print("===========55555");
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

  File? postImage;
  var picker = ImagePicker();

  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postImage = File(pickedFile.path);

      emit(PostImagePickedSuccessState());
    } else {
      emit(PostImagePickedErrorState());
    }
  }

  void uploadpostImage({required String text, required String dateTime}) {
    emit(PostAddLoadingState());
    FirebaseStorage.instance
        .ref()
        .child("posts/${Uri.file(postImage!.path).pathSegments.last}")
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadProfileImageSuccessState());
        addPost(text: text, dateTime: dateTime, Image: value);
      }).catchError((error) {
        emit(PostAddErrorsState());
      });
    }).catchError((error) {
      emit(PostAddErrorsState());
    });
  }

  void addPost(
      {required String text, required String dateTime, String? Image}) async {
    emit(PostAddLoadingState());
    FirebaseFirestore.instance
        .collection("posts")
        .add({"text": text, "dateTime": dateTime, "image": Image ?? ''}).then(
            (value) {
      // ShowToast(msg: "تم اضافة البوست", color: Colors.green);
      getPosts();

      emit(PostAddSuccessState());
    });
  }

  void removeImagePost() {
    postImage = null;
    emit(RemovePostImage());
  }

  List<Map> posts = [];

  Future getPosts() {
    emit(GetPostsLoadingState());
    posts = [];
    return FirebaseFirestore.instance
        .collection("posts")
        .orderBy("dateTime")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        posts.add(element.data());
      });
      emit(GetPostsSuccessState());
    }).catchError((onError) {
      emit(GetPostsErrorState());
    });
  }

  send({String to = "all", String? title, String? text}) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAX3xyBcE:APA91bEvEozUyCVYW2mLkB7FkC6l-VfHXCJcTcpDdl7Aiyly1_3b8tmrLqc_yLA2eVzRk8_jQfAIY-qd2P3In62Tqu6KsS12nbgq1J8gkUbzRu48jaPnSNCZIoijOQbZJAWYjYVhjOBm',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{'body': text, 'title': title},
          'priority': 'high',
          'to': "/topics/$to",
        },
      ),
    );
  }
}
