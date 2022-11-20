// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? customerID;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;

  UserModel({
    this.customerID,
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    UserModel userModel = UserModel();
    userModel.customerID = json['customer_id'];
    userModel.firstname = json['firstname'];
    userModel.lastname = json['lastname'];
    userModel.email = json['email'];
    userModel.telephone = json['telephone'];
    return userModel;
  }
}
