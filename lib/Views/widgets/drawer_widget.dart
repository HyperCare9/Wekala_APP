import 'package:flutter/material.dart';

import 'package:wekala_sales/Controller/links_services.dart';
import 'package:wekala_sales/Views/Screens/profile_screen.dart';

class DrawerWidget extends StatelessWidget {
  String? deviceID;
  void Function()? closeDrawwer;
  DrawerWidget({
    Key? key,
    this.deviceID,
    this.closeDrawwer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        extendBody: true,
        body: Column(
          children: [
            const SizedBox(height: 10.0),
            customListTile(
              title: 'الصفحة الشخصية',
              leadIcon: Icons.person,
              onTap: () {
                // menuData.goCar(closeDrawer: widget.closeDrawer);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ProfileScreen(
                          deviceID: deviceID,
                        )));
                closeDrawwer!();
              },
            ),
            const SizedBox(height: 10.0),
            customListTile(
              title: 'تسجيل الخروج',
              leadIcon: Icons.logout,
              onTap: () {
                LinkServices().logOut(token: deviceID);
                closeDrawwer!();
              },
            )
          ],
        ));
  }
}

customListTile({String? title, IconData? leadIcon, Function()? onTap}) {
  return ListTile(
    minLeadingWidth: 20.0,
    selectedTileColor: Colors.black12,
    title: Text(
      title!,
      style: const TextStyle(
        color: Color(0xFF485297),
        fontSize: 15,
      ),
    ),
    leading: Icon(
      leadIcon!,
      color: const Color(0xFF485297),
      size: 20,
    ),
    onTap: onTap,
  );
}
