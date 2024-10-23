class Categorymodel {
  int? categoryid;
  String? name;

  Categorymodel({this.categoryid, this.name});

  Categorymodel.fromJson(Map<String, dynamic> json) {
    categoryid = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.categoryid;
    data['name'] = this.name;
    return data;
  }
}
