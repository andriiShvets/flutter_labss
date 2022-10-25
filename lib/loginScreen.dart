import 'package:flutter/material.dart';
import './welcomePage.dart';
import 'dart:ui';
import 'schedule_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String name = ' ';
  late List<String> groups;
  String? selected;

  _LoginScreenState() {
    Data scheduleD = Data();
    groups = scheduleD.getClassName();
  }

  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
/*
    setState(() {
     // firstName = arguments['firstName'];
      lastName = arguments['lastName'];
    },
    );*/

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            const Text(
              "Schedule app",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Enter email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              onChanged: (value) {
                name = value;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: false,
              decoration: const InputDecoration(
                labelText: "Enter name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                value: selected,
                style: const TextStyle(fontSize: 14, color: Color(0xff000000)),
                decoration: const InputDecoration(
                    labelText: 'Choose a group',
                    contentPadding: EdgeInsets.all(5)),
                icon: const Icon(Icons.keyboard_arrow_down),
                items: groups
                    .map((group) => DropdownMenuItem(
                          value: group,
                          child: Text(group),
                        ))
                    .toList(),
                onChanged: (String? newGroup) {
                  setState(() {
                    selected = newGroup;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient:
                      const LinearGradient(colors: [Colors.blue, Colors.cyan]),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/wellcome',
                      arguments: {'firstName': name, 'selectedGroup': selected},
                    );
                  },
                  child: const Text(
                    "ENTER",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
