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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("آحر الأحداث"),
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: const [
                                    Text("د. أحمد الخيري"),
                                    Text("ahmedalkhairy@"),
                                  ],
                                ),
                                Icon(
                                  Icons.notification_important,
                                  size: 40,
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
                                textAlign: TextAlign.end,
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
