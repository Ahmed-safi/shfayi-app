import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BoxTools extends StatelessWidget {
  const BoxTools({
    Key? key,
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
                    "First Name",
                    style: TextStyle(
                        color: HexColor("#717171"),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text("Rachelle"),
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
                    "id Number",
                    style: TextStyle(
                        color: HexColor("#717171"),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text("1234567890"),
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
                    "Email Address",
                    style: TextStyle(
                        color: HexColor("#717171"),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text("rachelle.d@gmail.com",
                      style: TextStyle(
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
                  const Text("416-875-7523",
                      style: TextStyle(
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
                    "City",
                    style: TextStyle(
                        color: HexColor("#717171"),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text("Dubai",
                      style: TextStyle(
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
                    "Address",
                    style: TextStyle(
                        color: HexColor("#717171"),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text("30-34 81 B St",
                      style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}
