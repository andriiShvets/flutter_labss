import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'welcomePage.dart';
import 'schedule_data.dart';

void main() => runApp(LoginUI());

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Login UI",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("hello"),
        ),
        body: LoginScreen(),
      ),
      routes: {
        '/wellcome': (context) => const WellcomeScreen(),
      },
    );
  }
}
