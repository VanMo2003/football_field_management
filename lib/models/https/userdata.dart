class UserInformation {
  String? nameUser;
  String? phoneNumber;
  String? timeSlot;
  String? dataToday;

  UserInformation(
      {this.nameUser, this.phoneNumber, this.timeSlot, this.dataToday});

  UserInformation.fromJson(Map<String, dynamic> json) {
    nameUser = json['nameUser'];
    phoneNumber = json['phoneNumber'];
    timeSlot = json['timeSlot'];
    dataToday = json['dataToday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameUser'] = this.nameUser;
    data['phoneNumber'] = this.phoneNumber;
    data['timeSlot'] = this.timeSlot;
    data['dataToday'] = this.dataToday;
    return data;
  }
}
