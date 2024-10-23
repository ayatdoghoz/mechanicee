class requestModel {
  int? requestId;
  int? mId;
  int? dId;

  int? paymentmethod;
  String? price;
  int? status;
  String? time;
  String? dlong;
  String? dlat;

  requestModel(
      {this.requestId,
      this.mId,
      this.dId,
      this.dlong,
      this.dlat,
      this.paymentmethod,
      this.price,
      this.status,
      this.time});

  requestModel.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    mId = json['m_id'];
    dId = json['d_id'];
    dlat = json['d_lat'];
    dlong = json['d_long'];
    paymentmethod = json['paymentmethod'];
    price = json['price'];
    status = json['status'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.requestId;
    data['m_id'] = this.mId;
    data['d_id'] = this.dId;
    data['d_lat'] = this.dlat;
    data['d_long'] = this.dlong;
    data['paymentmethod'] = this.paymentmethod;
    data['price'] = this.price;
    data['status'] = this.status;
    data['time'] = this.time;
    return data;
  }
}
