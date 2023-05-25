import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';
import 'package:shifayiy/screens/navScreens/home.dart';

class Post extends StatefulWidget {
  final bool editble;
  final String title;
  final String text;
  final String image;
  final String doctor_name;
  final String date;
  final String postId;
  const Post(
      {super.key,
      required this.title,
      required this.text,
      required this.image,
      required this.doctor_name,
      required this.date,
      required this.editble,
      required this.postId});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  var cont = TextEditingController();
  void initState() {
    HomeCubit.get(context).getCommentsCount(post_id: widget.postId);
    HomeCubit.get(context).getComments(widget.postId);

    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        Text(
                          widget.date,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          widget.doctor_name ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 15,
                          child: Image.network(
                              "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    child: const Divider(),
                    height: 20,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.text,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    child: Divider(),
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showBottomSheet(
                              context: context,
                              builder: (context) => Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Container(
                                      width: double.infinity,
                                      child: HomeCubit.get(context)
                                              .comments
                                              .isEmpty
                                          ? const Center(
                                              child: Text("لا يوجد تعليقات"),
                                            )
                                          : ListView.separated(
                                              itemCount: HomeCubit.get(context)
                                                  .comments
                                                  .length,
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                              itemBuilder: (context, index) =>
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    width: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const Icon(
                                                              Icons.comment,
                                                              size: 35,
                                                            ),
                                                            Column(
                                                              children: [
                                                                Text(HomeCubit.get(
                                                                        context)
                                                                    .comments[
                                                                        index]
                                                                    .data()["user_name"]),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 50),
                                                          child: Text(
                                                            HomeCubit.get(
                                                                    context)
                                                                .comments[index]
                                                                .data()["comment"],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                    ),
                                  ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.comment),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("${HomeCubit.get(context).comments.length}"),
                          ],
                        ),
                      ),
                      if (widget.editble)
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit_note_outlined),
                        ),
                      Row(
                        children: const [
                          Icon(Icons.favorite_border),
                          SizedBox(
                            width: 5,
                          ),
                          Text("20"),
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(),
                  ),
                  state is AddCommentLoadingState
                      ? const CircularProgressIndicator()
                      : TextField(
                          controller: cont,
                          onSubmitted: (String value) {
                            HomeCubit.get(context).addComment(
                              post_id: widget.postId,
                              comment: value,
                              comment_date: DateTime.now(),
                            );
                            cont.clear();
                            HomeCubit.get(context).getComments(widget.postId);
                          },
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                          textAlign: TextAlign.end,
                          decoration: const InputDecoration(
                            hintText: "......اكتب تعليق ",
                            border: OutlineInputBorder(),
                          ),
                        ),
                ],
              ),
            ),
          );
        });
  }
}
