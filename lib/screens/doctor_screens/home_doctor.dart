import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';

import '../../widgets/Post.dart';

class HomeDoctor extends StatelessWidget {
  const HomeDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            itemCount: HomeCubit.get(context).posts.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) => Post(
              postId: HomeCubit.get(context).posts[index].id,
              editble: true,
              date: HomeCubit.get(context).posts[index].data()["dateTime"],
              doctor_name:
                  HomeCubit.get(context).posts[index].data()["doctor_name"],
              text: HomeCubit.get(context).posts[index].data()["text"],
              image: HomeCubit.get(context).posts[index].data()["image"],
              title: HomeCubit.get(context).posts[index].data()["title"],
            ),
          ),
        );
      },
    );
  }
}
