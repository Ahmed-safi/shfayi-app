import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';
import 'package:shifayiy/screens/articale.dart';
import 'package:shifayiy/screens/disease_detailes.dart';
import 'package:shifayiy/widgets/Post.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DiseaseDetailes()));
                          },
                          child: const DesesWidget()),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DiseaseDetailes()));
                          },
                          child: const DesesWidget()),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  const Text(
                    "مقالات",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        children: HomeCubit.get(context)
                            .posts
                            .map((model) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Articale(
                                            model: model,
                                          ),
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: DoctorArticalWidget(model: model),
                                  ),
                                ))
                            .toList()),
                  ),
                ],
              ),
            ),
          );
        });
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
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
  final model;
  const DoctorArticalWidget({
    super.key,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
                        children: [
                          Text(model["doctor_name"]),
                          Text("ahmedalkhairy@"),
                          Text(
                            model["title"],
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
