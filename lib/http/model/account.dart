class Account {
  String userName;
  String password;
  bool? permission;

  Account({required this.userName, required this.password, this.permission});

  bool? get getPermission {
    return permission;
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      userName: json['userName'],
      password: json['password'],
      permission: json['permission'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userName'] = userName;
    data['password'] = password;
    data['permission'] = permission;
    return data;
  }
}
