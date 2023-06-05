class User {
  String? username;
  String? nameUser;
  String? phoneNumber;

  User({this.username, this.nameUser, this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    nameUser = json['nameUser'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['nameUser'] = this.nameUser;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
