// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:platform_device_id/platform_device_id.dart';

import 'package:wekala_sales/Controller/links_services.dart';
import 'package:wekala_sales/Models/user_data.dart';

import '../widgets/pro_row.dart';

class ProfileScreen extends StatefulWidget {
  String? deviceID;
  ProfileScreen({
    Key? key,
    this.deviceID,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text('الصفحة الشخصية'),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFEDA94E),
            ),
          ),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: LinkServices().userData(token: widget.deviceID),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapShot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: size.height * 0.02),
                        Text(
                          'البيانات الشخصية',
                          style: TextStyle(
                              color: Color(0xFFEDA94E),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.03),
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.01,
                              horizontal: size.width * 0.02),
                          decoration: BoxDecoration(
                              color: Color(0xFFEDA94E),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              proRow(
                                  size: size,
                                  icon: Icons.edit_location_rounded,
                                  content: 'Name',
                                  data:
                                      '${snapShot.data![index].firstname} ${snapShot.data![index].lastname}'),
                              proRow(
                                  size: size,
                                  icon: Icons.phone,
                                  content: 'Phone',
                                  data: snapShot.data![index].telephone),
                              proRow(
                                  size: size,
                                  icon: Icons.email,
                                  content: 'Email',
                                  data: snapShot.data![index].email),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
