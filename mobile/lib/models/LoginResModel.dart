class LoginResModel {
  String? message;
  String? enseignantId;

  LoginResModel({this.message, this.enseignantId});

  LoginResModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    enseignantId = json['enseignantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['enseignantId'] = this.enseignantId;
    return data;
  }
}
