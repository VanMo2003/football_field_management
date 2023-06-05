class FootballField {
  String username;
  bool? permission;
  String nameFootballField;
  String nameManage;
  int totalYards;

  FootballField({
    required this.username,
    this.permission,
    required this.nameFootballField,
    required this.nameManage,
    required this.totalYards,
  });

  factory FootballField.fromJson(Map<String, dynamic> json) {
    return FootballField(
      username: json['username'],
      permission: json['permission'],
      nameFootballField: json['nameFootballField'],
      nameManage: json['nameManage'],
      totalYards: json['totalYards'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['nameFootballField'] = nameFootballField;
    data['nameManage'] = nameManage;
    data['totalYards'] = totalYards;
    return data;
  }
}
