// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "آحر الأحداث",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.notifications_active,
                                  size: 35,
                                ),
                                Column(
                                  children: const [
                                    Text("د. أحمد الخيري"),
                                    Text("   ahmedalkhairy@"),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Text(
                                "قام بقبول طلب المراسلة الذي أرسلته, يمكنك الأن إرسال الرسائل ل د.أحمد الخيري بكل سهولة. ",
                              ),
                            )
                          ],
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
