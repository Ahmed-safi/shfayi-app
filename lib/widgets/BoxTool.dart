import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BoxTools extends StatelessWidget {
  final first_name;
  final mid_name;
  final last_name;
  final location;
  final email;
  final position;
  final phone;

  const BoxTools({
    Key? key,
    this.first_name,
    this.mid_name,
    this.last_name,
    this.location,
    this.email,
    this.position,
    this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                        color: HexColor("#717171"),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("${first_name ?? ""} ${mid_name} ${last_name}"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey,
              ),
              if (position != null)
                const SizedBox(
                  height: 20,
                ),
              if (position != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "position",
                      style: TextStyle(
                          color: HexColor("#717171"),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(position ?? ""),
                  ],
                ),
              if (position != null)
                const SizedBox(
                  height: 20,
                ),
              if (position != null)
                const Divider(
                  color: Colors.grey,
                ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email Address",
                    style: TextStyle(
                        color: HexColor("#717171"),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(email,
                      style: const TextStyle(
                        fontSize: 14,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone",
                    style: TextStyle(
                        color: HexColor("#717171"),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(phone,
                      style: const TextStyle(
                        fontSize: 14,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "location",
                    style: TextStyle(
                        color: HexColor("#717171"),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(location,
                      style: const TextStyle(
                        fontSize: 14,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
