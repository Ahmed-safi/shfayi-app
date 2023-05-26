// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';
import 'package:shifayiy/screens/chat.dart';
import 'package:shifayiy/utils/colors.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "آحر الأحداث",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemCount: HomeCubit.get(context).users.length,
                          separatorBuilder: (context, index) => SizedBox(
                                height: 15,
                              ),
                          itemBuilder: (context, index) => Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              side: BorderSide(
                                                  color: ColorManager.primary),
                                              backgroundColor:
                                                  ColorManager.primary),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Chat(
                                                          userData:
                                                              HomeCubit.get(
                                                                      context)
                                                                  .users[index]
                                                                  .data(),
                                                        )));
                                          },
                                          child: Text(
                                            "رسالة",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                            width: 100,
                                            child: FittedBox(
                                                child: Text(
                                              "${HomeCubit.get(context).users[index].data()["f_name"]} ${HomeCubit.get(context).users[index].data()["m_name"]} ${HomeCubit.get(context).users[index].data()["l_name"]}",
                                              style: TextStyle(fontSize: 20),
                                            ))),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                      radius: 15,
                                      child: Image.network(
                                          "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                                    )
                                  ],
                                ),
                              )),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
