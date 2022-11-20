import 'package:flutter/material.dart';

customAppBar({Function()? onTap}) {
  return AppBar(
    backgroundColor: Colors.white,
    // elevation: 0.0,
    title: Image.asset(
      'assets/images/logo.png',
      height: 40,
      width: 100,
    ),
    centerTitle: true,
    leading: InkWell(
      onTap: onTap,
      child: const Icon(
        Icons.menu,
        color: Color(0xFF485297),
      ),
    ),
  );
}
