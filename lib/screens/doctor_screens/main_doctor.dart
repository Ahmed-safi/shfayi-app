import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';
import 'package:shifayiy/screens/doctor_screens/create_post.dart';

import '../../utils/colors.dart';

class MainDoctor extends StatelessWidget {
  const MainDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Builder(builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (Context) => PostScreen()));
                },
                child: const Icon(Icons.add),
              ),
              appBar: AppBar(
                centerTitle: true,
                title: Text(HomeCubit.get(context)
                    .pages[HomeCubit.get(context).currentIndex]["name"]),
              ),
              body: HomeCubit.get(context).userData!["isDoctor"] == true
                  ? HomeCubit.get(context)
                          .pages_doctors[HomeCubit.get(context).currentIndex]
                      ["page"]
                  : HomeCubit.get(context)
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
                      icon: Icon(Icons.home), label: "الصفحة الرئيسية"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "المستخدمين"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: "الملف الشخصي"),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
