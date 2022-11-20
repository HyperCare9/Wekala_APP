import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreenWekala extends StatefulWidget {
  const LoginScreenWekala({super.key});

  @override
  State<LoginScreenWekala> createState() => _LoginScreenWekalaState();
}

class _LoginScreenWekalaState extends State<LoginScreenWekala> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.03),
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: size.height * 0.05,
                ),
                const Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
            const Text(
              'كل مايحتاجه البيت وأكثر',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            Image.asset(
              'assets/images/banner.png',
              height: size.height * 0.21,
              width: size.width * 0.6,
            )
          ],
        ),
      ),
    ));
  }
}
