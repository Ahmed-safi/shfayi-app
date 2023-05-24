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
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'teb',
      'label': 'الطب',
      'icon': Icon(Icons.medical_services),
    },
    {
      'value': 'tamrid',
      'label': 'التمريض',
      'icon': Icon(Icons.medication_outlined),
    },
    {
      'value': 'It',
      'label': 'تكنولوجيا المعلومات',
      'icon': Icon(Icons.computer_rounded),
    },
    {
      'value': 'tarbia',
      'label': 'التربية',
      'icon': Icon(Icons.cabin),
    },
    {
      'value': 'kanonandsharia',
      'label': 'الشريعة والقانون',
      'icon': Icon(Icons.brightness_low_sharp),
    },
    {
      'value': 'asolaldin',
      'label': 'اصول الدين',
      'icon': Icon(Icons.grade),
    },
    {
      'value': 'sahafa',
      'label': 'الصحافة والاعلام',
      'icon': Icon(Icons.camera_alt),
    },
  ];
  String faculity = 'all';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
                appBar: AppBar(
                    title: Text(
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
                                dateTime: DateTime.now().toString(),
                              );
                              HomeCubit.get(context).send(
                                to: faculity,
                                text: textCon.text,
                                title: "مجلس الطلاب",
                              );
                            } else {
                              HomeCubit.get(context).send(
                                to: faculity,
                                text: textCon.text,
                                title: "مجلس الطلاب",
                              );
                              HomeCubit.get(context).uploadpostImage(
                                  dateTime: DateTime.now().toString(),
                                  text: textCon.text);
                            }
                          }
                        },
                      )
                    ]),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      if (state is PostAddLoadingState)
                        LinearProgressIndicator(
                          color: ColorManager.textColor,
                          backgroundColor: ColorManager.primary,
                        ),
                      if (state is PostAddLoadingState)
                        SizedBox(
                          height: 5,
                        ),
                      Row(children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-photo/mand-holding-cup_1258-340.jpg?size=338&ext=jpg"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(
                            "انت",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        )
                      ]),
                      Expanded(
                        child: TextFormField(
                          controller: textCon,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "لايمكن ان يكون فارغ";
                            }
                          },
                          style:
                              TextStyle(color: Theme.of(context).canvasColor),
                          decoration: InputDecoration(
                              hintText: "ماذا يجول في بالك ... ",
                              hintStyle: Theme.of(context).textTheme.caption,
                              border: InputBorder.none),
                        ),
                      ),
                      SelectFormField(
                        type: SelectFormFieldType.dialog, // or can be dialog
                        icon: Icon(Icons.format_shapes),

                        decoration: InputDecoration(
                            fillColor: ColorManager.textColor,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    color: ColorManager.textColor)),
                            prefixIcon: Icon(Icons.arrow_drop_down),
                            labelStyle:
                                TextStyle(color: ColorManager.textColor),
                            labelText: "اختر الكلية",
                            hintText: "الكلية",
                            hintStyle:
                                TextStyle(color: ColorManager.textColor)),

                        items: _items,
                        onChanged: (val) async {
                          faculity = val;
                        },

                        onSaved: (val) => faculity = val!,
                      ),
                      SizedBox(
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
                                    icon: Icon(Icons.close)),
                              ),
                            )
                          ],
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                                onPressed: () {
                                  // CubitHome.get(context).getPostImage();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.image,
                                        color: ColorManager.primary),
                                    SizedBox(
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
                )),
          );
        });
  }
}
