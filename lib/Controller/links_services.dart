import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wekala_sales/Models/logout_model.dart';
import 'package:wekala_sales/Models/user_data.dart';
import '../Models/link_model.dart';

class LinkServices {
  Future<LinkModel> getUrlLink({String? token}) async {
    String url =
        'https://test.alwekalaeg.com/elwekala-customers/api/apiLoginUser';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"token": token});
    LinkModel linkModel = LinkModel();
    try {
      var response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        linkModel = LinkModel.fromJson(data);
        return linkModel;
      }
    } catch (e) {
      print(e);
    }
    return linkModel;
  }

  Future<List<UserModel>> userData({String? token}) async {
    List<UserModel> userModel = [];
    String url =
        'https://test.alwekalaeg.com/elwekala-customers/api/apiUserData';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"token": token});

    try {
      var response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<Map<String, dynamic>> decoded =
            List<Map<String, dynamic>>.from(data['Customer Data']);
        userModel = decoded.map((e) => UserModel.fromJson(e)).toList();

        return userModel;
      }
    } catch (e) {
      print(e);
    }
    return userModel;
  }

  Future<LogOutModel> logOut({String? token}) async {
    String url =
        'https://test.alwekalaeg.com/elwekala-customers/api/apiUserTokenDelete';
    var headers = {"Content-Type": "application/json", "Accept": "*/*"};
    var body = jsonEncode({"token": token});
    LogOutModel logOutModel = LogOutModel();
    try {
      var response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        logOutModel = LogOutModel.fromJson(data);
        return logOutModel;
      }
    } catch (e) {
      print(e);
    }
    return logOutModel;
  }
}
