import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';
import 'package:shifayiy/cache_helper.dart';

import '../utils/colors.dart';

class DiseaseDetailes extends StatefulWidget {
  final model;
  DiseaseDetailes({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<DiseaseDetailes> createState() => _DiseaseDetailesState();
}

class _DiseaseDetailesState extends State<DiseaseDetailes> {
  // double pos = 0;
  bool isSubs = true;
  void isSub() {
    print("=================");
    HomeCubit.get(context).subscripes.forEach((element) {
      print(element.data()["desease"]);
      print(widget.model.data()["e_name"]);

      if (element.data()["desease"] == widget.model.data()["e_name"]) {
        isSubs = false;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    isSub();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.model.data()["name"],
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJoOzhvi9mdSU4S4eQDwjcuwGfUIafma3Q5q25Df4&s"))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${HomeCubit.get(context).posts.where((e) {
                                  return e.data()["desease"] ==
                                      widget.model.data()["e_name"];
                                }).toList().length} عدد المقالات",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: HexColor("#2A2525")),
                          ),
                          Text(
                            widget.model.data()["e_name"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: HexColor("#2EAFBE"),
                                fontSize: 26),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        widget.model.data()["about"],
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (CacheHelper.getData(
                              key: widget.model.data()["e_name"]) ==
                          null)
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    side:
                                        BorderSide(color: ColorManager.primary),
                                    backgroundColor: ColorManager.primary),
                                onPressed: () async {
                                  CacheHelper.saveData(
                                      key: widget.model.data()["e_name"],
                                      value: widget.model.data()["e_name"]);
                                  HomeCubit.get(context).subscripe(
                                      desease: widget.model.data()["e_name"]);

                                  await FirebaseMessaging.instance
                                      .subscribeToTopic(
                                          "${widget.model.data()["e_name"]}");
                                },
                                child: const Text(
                                  "اشترك الان",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
