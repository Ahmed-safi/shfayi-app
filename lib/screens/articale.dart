import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';
import 'package:shifayiy/widgets/Post.dart';

import '../utils/colors.dart';

class Articale extends StatelessWidget {
  final model;
  Articale({
    Key? key,
    this.model,
  }) : super(key: key);

  // double pos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "تفاصيل المقال",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Tajawal"),
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) => SingleChildScrollView(
              child: Post(
            doctor_id: model.data()["doctorUID"],
            postId: model.id,
            editble: false,
            date: model.data()["dateTime"],
            doctor_name: model.data()["doctor_name"],
            image: model.data()["image"],
            text: model.data()["text"],
            title: model.data()["title"],
          )),
        ));
  }
}
