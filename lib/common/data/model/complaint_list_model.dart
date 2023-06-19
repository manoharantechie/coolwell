import 'dart:convert';

ComplaintListModel complaintListModelFromJson(String str) => ComplaintListModel.fromJson(json.decode(str));

String complaintListModelToJson(ComplaintListModel data) => json.encode(data.toJson());

class ComplaintListModel {
  bool? success;
  List<ComplaintList>? result;
  String? message;

  ComplaintListModel({
    this.success,
    this.result,
    this.message,
  });

  factory ComplaintListModel.fromJson(Map<String, dynamic> json) => ComplaintListModel(
    success: json["success"],
    result: List<ComplaintList>.from(json["result"].map((x) => ComplaintList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
  };
}

class ComplaintList {
  int? serviceStatus;
  String? id;
  ServiceId? serviceId;
  int? date;
  String? address;
  String? city;
  String? zip;
  String? latitude;
  String? longitude;
  dynamic amount;
  UserId? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ComplaintList({
    this.serviceStatus,
    this.id,
    this.serviceId,
    this.date,
    this.address,
    this.city,
    this.zip,
    this.latitude,
    this.longitude,
    this.amount,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory ComplaintList.fromJson(Map<String, dynamic> json) => ComplaintList(
    serviceStatus: json["service_status"],
    id: json["_id"],
    serviceId: ServiceId.fromJson(json["Service_id"]),
    date: json["Date"],
    address: json["Address"],
    city: json["city"],
    zip: json["zip"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    amount: json["Amount"],
    userId: UserId.fromJson(json["user_id"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "service_status": serviceStatus,
    "_id": id,
    "Service_id": serviceId!.toJson(),
    "Date": date,
    "Address": address,
    "city": city,
    "zip": zip,
    "latitude": latitude,
    "longitude": longitude,
    "Amount": amount,
    "user_id": userId!.toJson(),
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}

class ServiceId {
  String? id;
  String? serviceName;

  ServiceId({
    this.id,
    this.serviceName,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    id: json["_id"],
    serviceName: json["Service_Name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "Service_Name": serviceName,
  };
}

class UserId {
  String? id;
  String? name;

  UserId({
    this.id,
    this.name,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
