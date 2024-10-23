class StoreModel {
  int? storeId;
  String? ownerName;
  String? storename;
  String? storephone;
  String? disc;
  String? onway;
  String? address_lat;
  String? address_long;
  int? mId;
  int? cId;
  String? start;
  String? end;
  String? images;

  StoreModel(
      {this.storeId,
      this.ownerName,
      this.storename,
      this.storephone,
      this.disc,
      this.onway,
      this.address_lat,
      this.address_long,
      this.mId,
      this.cId,
      this.images,
      this.start,
      this.end});

  StoreModel.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    ownerName = json['owner_name'];
    storename = json['storename'];
    storephone = json['storephone'];
    disc = json['disc'];
    onway = json['onway'];
    address_lat = json['address_lat'];
    address_long = json['address_long'];
    mId = json['m_id'];
    cId = json['c_id'];
    start = json['start'];
    end = json['end'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['owner_name'] = this.ownerName;
    data['storename'] = this.storename;
    data['storephone'] = this.storephone;
    data['disc'] = this.disc;
    data['onway'] = this.onway;
    data['address_lat'] = this.address_lat;
    data['address_long'] = this.address_long;
    data['m_id'] = this.mId;
    data['c_id'] = this.cId;
    data['start'] = this.start;
    data['end'] = this.end;
    data['images'] = this.images;
    return data;
  }
}
