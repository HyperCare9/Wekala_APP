// ignore_for_file: public_member_api_docs, sort_constructors_first
class LinkModel {
  bool? status;
  String? errNum;
  String? msg;
  String? loginUrl;

  LinkModel({
    this.status,
    this.errNum,
    this.msg,
    this.loginUrl,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    LinkModel linkModel = LinkModel();
    linkModel.status = json['status'];
    linkModel.errNum = json['errNum'];
    linkModel.msg = json['msg'];
    linkModel.loginUrl = json['Login Url'];
    return linkModel;
  }
}
