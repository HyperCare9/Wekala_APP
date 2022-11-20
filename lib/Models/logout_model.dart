// ignore_for_file: public_member_api_docs, sort_constructors_first
class LogOutModel {
  bool? status;
  String? errNum;
  String? msg;
  int? customerToken;

  LogOutModel({
    this.status,
    this.errNum,
    this.msg,
    this.customerToken,
  });

  factory LogOutModel.fromJson(Map<String, dynamic> json) {
    LogOutModel logOutModel = LogOutModel();
    logOutModel.status = json['status'];
    logOutModel.errNum = json['errNum'];
    logOutModel.msg = json['msg'];
    logOutModel.customerToken = json['Customer Token Data'];
    return logOutModel;
  }
}
