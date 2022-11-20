import 'package:flutter/material.dart';

proRow({IconData? icon, dynamic size, String? content, String? data}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 20,
          ),
          SizedBox(width: size.width * 0.01),
          Text(
            content!,
            // style: MyTheme.lightTheme.textTheme.subtitle1!.copyWith(
            //     fontWeight: FontWeight.bold, color: Colors.grey[600]),
            softWrap: true,
            overflow: TextOverflow.visible,
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      Divider(
        color: Colors.black,
      ),
      Text(
        data!,
        // style: MyTheme.lightTheme.textTheme.subtitle1!
        //     .copyWith(fontWeight: FontWeight.bold),
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
      SizedBox(
        height: size.height * 0.02,
      )
    ],
  );
}
