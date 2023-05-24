// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shifayiy/utils/colors.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("آحر الأحداث",style: TextStyle(fontWeight: FontWeight.bold),),
              Expanded(
                child: ListView.separated(
                    itemCount: 10,
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
                                        backgroundColor: Colors.white),
                                    onPressed: () {},
                                    child: Text("استفسار")),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            color: ColorManager.primary),
                                        backgroundColor: ColorManager.primary),
                                    onPressed: () {},
                                    child: Text(
                                      "رسالة",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                children: const [
                                  SizedBox(
                                      width: 100,
                                      child: FittedBox(
                                          child: Text("د. أحمد الخيري"))),
                                  Text("ahmedalkhairy@"),
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
  }
}
