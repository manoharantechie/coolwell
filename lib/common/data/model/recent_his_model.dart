import 'dart:convert';

RecentHistoryModel recentHistoryModelFromJson(String str) => RecentHistoryModel.fromJson(json.decode(str));

String recentHistoryModelToJson(RecentHistoryModel data) => json.encode(data.toJson());

class RecentHistoryModel {
  bool? success;
  String? message;
  Result? result;

  RecentHistoryModel({
    this.success,
    this.message,
    this.result,
  });

  factory RecentHistoryModel.fromJson(Map<String, dynamic> json) => RecentHistoryModel(
    success: json["success"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "result": result!.toJson(),
  };
}

class Result {
  dynamic techcount;
  dynamic usercount;
  dynamic historycount;
  List<HistoryList>? history;

  Result({
    this.techcount,
    this.usercount,
    this.historycount,
    this.history,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    techcount: json["techcount"],
    usercount: json["usercount"],
    historycount: json["historycount"],
    history: List<HistoryList>.from(json["history"].map((x) => HistoryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "techcount": techcount,
    "usercount": usercount,
    "historycount": historycount,
    "history": List<dynamic>.from(history!.map((x) => x.toJson())),
  };
}

class HistoryList {
  String? id;
  int? serviceStatus;
  int? date;
  int? amount;
  User? user;
  Service? service;

  HistoryList({
    this.id,
    this.serviceStatus,
    this.date,
    this.amount,
    this.user,
    this.service,
  });

  factory HistoryList.fromJson(Map<String, dynamic> json) => HistoryList(
    id: json["_id"],
    serviceStatus: json["service_status"],
    date: json["Date"],
    amount: json["Amount"],
    user: User.fromJson(json["user"]),
    service: Service.fromJson(json["service"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "service_status": serviceStatus,
    "Date": date,
    "Amount": amount,
    "user": user!.toJson(),
    "service": service!.toJson(),
  };
}

class Service {
  String? serviceName;

  Service({
    this.serviceName,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    serviceName: json["Service_Name"],
  );

  Map<String, dynamic> toJson() => {
    "Service_Name": serviceName,
  };
}

class User {
  String? id;
  String? profilePic;
  String? name;

  User({
    this.id,
    this.profilePic,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    profilePic: json["profile_pic"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profile_pic": profilePic,
    "name": name,
  };
}
