import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wekala_sales/Controller/links_services.dart';
import 'package:wekala_sales/Models/link_model.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String deviceID = '';

  @override
  void initState() {
    super.initState();
    getID();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(onTap: () => scaffoldKey.currentState!.openDrawer()),
      drawer: SizedBox(
        width: size.width * 0.60,
        child: DrawerWidget(
          deviceID: deviceID,
          closeDrawwer: () => scaffoldKey.currentState!.closeDrawer(),
        ),
      ),
      body: FutureBuilder<LinkModel>(
          future: LinkServices().getUrlLink(token: deviceID),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return WebView(
                initialUrl: snapShot.data!.loginUrl,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    ));
  }

  getID() async {
    deviceID = (await PlatformDeviceId.getDeviceId)!;
    setState(() {});
    print(deviceID);
  }
}
