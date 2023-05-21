import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeCubit.dart';
import 'package:shifayiy/StateManagment/HomeCubit/HomeStates.dart';

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
            itemCount: 20,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) => const Post(),
          ),
        );
      },
    );
  }
}

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                "1/2/2020",
                style: TextStyle(color: Colors.grey),
              ),
              const Spacer(),
              const Text(
                "Doctor Name",
                style: TextStyle(fontWeight: FontWeight.bold),
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
          const SizedBox(
            child: Divider(),
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            child: Image.network(
              "https://cdn-icons-png.flaticon.com/512/149/149071.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "اللّغة العربيّة من اللّغات العالميّة الأكثر انتشاراً في العالم، وتعتبرُ من إحدى اللّغات المُعتمدة في الأمم المُتّحدة، كما إنها تشكّلُ اللّغة الأولى في مناطق بلاد الشّام، وشبه الجزيرة العربيّة، وشمال أفريقيا، وساهم هذا الانتشار الواسعُ للّغة العربيّة في تصنيفها كواحدةٍ من اللّغاتِ التي يسعى العديدُ من الطُلّاب إلى دراستها، وخصوصاً غير الناطقيّن بها؛ من أجل التعرّفِ على جمال كلماتها. كما أنّها من اللّغات التي ظلّت مُحافظةً على قواعدها اللغويّة حتّى هذا الوقت؛ لأنّها لغة الإسلام والمسلميّن والقرآنِ الكريم، كما أنّ الثّقافة العربيّة غنيّةٌ جدّاً بالعديد من المُؤلّفات، سواءً الأدبيّة، أو العلميّة، أو غيرها، والتي كُتِبتْ بِلُغَةٍ عربيّة فصيحة، ويصلُ العدد الإجماليُّ لحُروفِ اللّغة العربيّة إلى ثمانيّة وعشرين حرفاً]",
            style: TextStyle(fontWeight: FontWeight.w600),
            textAlign: TextAlign.end,
          ),
          const SizedBox(
            child: Divider(),
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  print("object");
                },
                child: Container(
                  child: Row(
                    children: const [
                      Icon(Icons.comment),
                      SizedBox(
                        width: 5,
                      ),
                      Text("20"),
                    ],
                  ),
                ),
              ),
              const Spacer(),
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
          )
        ],
      ),
    );
  }
}
