import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';

import '../utils/colors.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getUserData()
        ..getCategories()
        ..getPosts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                  title: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: <Widget>[
                    // chat messages here

                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Expanded(
                        child: TextFormField(
                          //   controller: messageController,
                          style: const TextStyle(color: Colors.black),

                          decoration: const InputDecoration(
                            constraints: BoxConstraints(maxHeight: 50),
                            fillColor: Colors.white,
                            filled: true,
                            enabled: true,
                            contentPadding: EdgeInsets.only(top: 22, right: 20),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                            hintText: "ابحث",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.sort),
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    CircleAvatar(
                      radius: 15,
                      child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                    )
                  ],
                ),
              )
                  /*  Text(HomeCubit.get(context)
                        .pages[HomeCubit.get(context).currentIndex]["name"]),*/
                  ),
              body: HomeCubit.get(context)
                  .pages[HomeCubit.get(context).currentIndex]["page"],
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: ColorManager.primary,
                onTap: (index) {
                  HomeCubit.get(context).changeNavBar(index);
                },
                currentIndex: HomeCubit.get(context).currentIndex,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "الصفحة الرئسية"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications), label: "الاشعارات"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.medical_services), label: "الدكاترة"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "الملف الشخصي"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
