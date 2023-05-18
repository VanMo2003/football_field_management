class ResultByNumberYard {
  String? status;
  String? message;
  List<UserInformation>? data;

  ResultByNumberYard({status, message, data});

  ResultByNumberYard.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UserInformation>[];
      json['data'].forEach((v) {
        data!.add(UserInformation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserInformation {
  String? timeSlot;
  String? dataToday;
  String? nameUser;
  String? phoneNumber;

  UserInformation({timeSlot, dataToday, nameUser, phoneNumber});

  UserInformation.fromJson(Map<String, dynamic> json) {
    timeSlot = json['timeSlot'];
    dataToday = json['dataToday'];
    nameUser = json['nameUser'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeSlot'] = timeSlot;
    data['dataToday'] = dataToday;
    data['nameUser'] = nameUser;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
