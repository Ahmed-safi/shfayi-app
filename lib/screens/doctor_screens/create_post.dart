import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:select_form_field/select_form_field.dart';

import 'package:shifayiy/utils/colors.dart';

import '../../StateManagment/HomeCubit/HomeCubit.dart';
import '../../StateManagment/HomeCubit/HomeStates.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  var textCon = TextEditingController();
  var titleCon =TextEditingController();

  String desease = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
                appBar: AppBar(
                    title: const Text(
                      "انشاء مقالة",
                      style: TextStyle(
                        fontFamily: "Tajawal",
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          "نشر",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.deepOrange),
                        ),
                        onPressed: () {
                          if (textCon.text != "" ||
                              HomeCubit.get(context).postImage != null) {
                            if (HomeCubit.get(context).postImage == null) {
                              HomeCubit.get(context).addPost(
                                text: textCon.text,
                                title: titleCon.text,
                                desease: desease,
                                dateTime: DateTime.now().toString(),
                              );
                              HomeCubit.get(context).send(
                                to: desease,
                                text: textCon.text,
                                title: "مقال جديد",
                              );
                            } else {
                              HomeCubit.get(context).send(
                                to: desease,
                                text: textCon.text,
                                title: "مقال جديد",
                              );
                              HomeCubit.get(context).uploadpostImage(
                                title: titleCon.text,
                                  desease: desease,
                                  dateTime: DateTime.now().toString(),
                                  text: textCon.text);
                            }
                          }
                        },
                      )
                    ]),
                body:  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        if (state is PostAddLoadingState)
                          LinearProgressIndicator(
                            color: ColorManager.textColor,
                            backgroundColor: ColorManager.primary,
                          ),
                        if (state is PostAddLoadingState)
                          const SizedBox(
                            height: 5,
                          ),
                        Row(children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "https://img.freepik.com/free-photo/mand-holding-cup_1258-340.jpg?size=338&ext=jpg"),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              "انت",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ]),
          SizedBox(height: 10,),

          TextFormField(

          controller: titleCon,
          validator: (value) {
          if (value!.isEmpty) {
          return "لايمكن ان يكون فارغ";
          }
          },
          style:
          TextStyle(color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(

            ),
          hintText: "ادخل العنوان هنا ...",
          hintStyle: Theme.of(context).textTheme.caption,
          ),
          ),

                        Expanded(
                          child: TextFormField(
                            maxLines: 10,
                            controller: textCon,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "لايمكن ان يكون فارغ";
                              }
                            },
                            style:
                                TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hintText: "ماذا يجول في بالك ... ",
                                hintStyle: Theme.of(context).textTheme.caption,
                                border: InputBorder.none),
                          ),
                        ),
                        SelectFormField(
                          type: SelectFormFieldType.dialog, // or can be dialog
                          icon: const Icon(Icons.format_shapes),

                          decoration: InputDecoration(
                              fillColor: ColorManager.textColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: ColorManager.textColor)),
                              prefixIcon: const Icon(Icons.arrow_drop_down),
                              labelStyle:
                                  TextStyle(color: ColorManager.textColor),
                              labelText: "اختر الكلية",
                              hintText: "الكلية",
                              hintStyle:
                                  TextStyle(color: ColorManager.textColor)),

                          items: HomeCubit.get(context).categories,
                          onChanged: (val) async {
                            desease = val;
                          },

                          onSaved: (val) => desease = val!,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (HomeCubit.get(context).postImage != null)
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  image: DecorationImage(
                                    image: FileImage(
                                        HomeCubit.get(context).postImage!),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  child: IconButton(
                                      onPressed: () {
                                        // CubitHome.get(context).removeImagePost();
                                      },
                                      icon: const Icon(Icons.close)),
                                ),
                              )
                            ],
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    HomeCubit.get(context).getPostImage();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.image,
                                          color: ColorManager.primary),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "اضف صورة او فيديو",
                                        style: TextStyle(
                                            color: ColorManager.textColor),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
          );
        });
  }
}
