import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shifayiy/screens/disease_detailes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "مستجدات قد تهمك",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://t3.ftcdn.net/jpg/01/35/03/62/360_F_135036205_PMNUP4K1lso6lD1o07v2qVxg6LY3Xqym.jpg",
                ),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "اصناف العناية",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiseaseDetailes()));
                    },
                    child: const DesesWidget()),
                SizedBox(height: 10,),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiseaseDetailes()));
                    },
                    child: const DesesWidget()),
                SizedBox(height: 10,),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiseaseDetailes()));
                    },
                    child: const DesesWidget()),
                SizedBox(height: 30,),
              ],
            ),
            const Text(
              "مقالات",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  DoctorArticalWidget(),
                  SizedBox(
                    height: 15,
                  ),
                  DoctorArticalWidget(),
                  SizedBox(
                    height: 15,
                  ),
                  DoctorArticalWidget(),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DesesWidget extends StatelessWidget {
  const DesesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width / 4,
          child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJoOzhvi9mdSU4S4eQDwjcuwGfUIafma3Q5q25Df4&s",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("مرض السكري "),
              Text("patient"),
              Text(
                "أمراض القلب مصطلح واسع يُستخدم لوصف مجموعة من الأمراض التي تؤثر في القلب، وتشمل الأمراض المختلفة التي تندرج تحت مظلة أمراض القلب",
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class DoctorArticalWidget extends StatelessWidget {
  const DoctorArticalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_outline_outlined,
                        color: Colors.grey,
                      ),
                      iconSize: 35,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text("د. أحمد الخيري"),
                          Text("ahmedalkhairy@"),
                          Text(
                            "لا تكتفي سند بدعم المريض ومرافقتهى آخر يوم في حياته بل تأخذ على عاتقهاالصحة النفسية للعائلة.",
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 25,
                child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
