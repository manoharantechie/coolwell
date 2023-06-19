import 'dart:convert';

TechListModel techListModelFromJson(String str) => TechListModel.fromJson(json.decode(str));

String techListModelToJson(TechListModel data) => json.encode(data.toJson());

class TechListModel {
  bool success;
  List<TechList> result;
  String message;

  TechListModel({
    required this.success,
    required this.result,
    required this.message,
  });

  factory TechListModel.fromJson(Map<String, dynamic> json) => TechListModel(
    success: json["success"],
    result: List<TechList>.from(json["result"].map((x) => TechList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
    "message": message,
  };
}

class TechList {
  dynamic techId;
  String? profilePic;
  dynamic twofa;
  String? role;
  bool? verified;
  bool? google;
  bool? facebook;
  String? phone;
  dynamic status;
  bool? gmailVerified;
  bool? phoneVerified;

  String? id;
  String? name;
  String? city;
  String? area;
  String? pincode;
  String? longitude;
  String? latitude;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  TechList({
    required this.techId,
    required this.profilePic,
    this.twofa,
    required this.role,
    required this.verified,
    required this.google,
    required this.facebook,
    required this.phone,
    required this.status,
    required this.gmailVerified,
    required this.phoneVerified,

    required this.id,
    required this.name,
    required this.city,
    required this.area,
    required this.pincode,
    required this.longitude,
    required this.latitude,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TechList.fromJson(Map<String, dynamic> json) => TechList(
    techId: json["Tech_id"],
    profilePic: json["profile_pic"],
    twofa: json["twofa"],
    role: json["role"],
    verified: json["verified"],
    google: json["google"],
    facebook: json["facebook"],
    phone: json["phone"],
    status: json["status"],
    gmailVerified: json["gmail_verified"],
    phoneVerified: json["phone_verified"],
    id: json["_id"],
    name: json["name"],
    city: json["city"],
    area: json["Area"],
    pincode: json["pincode"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    email: json["email"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Tech_id": techId,
    "profile_pic": profilePic,
    "twofa": twofa,
    "role": role,
    "verified": verified,
    "google": google,
    "facebook": facebook,
    "phone": phone,
    "status": status,
    "gmail_verified": gmailVerified,
    "phone_verified": phoneVerified,
    "_id": id,
    "name": name,
    "city": city,
    "Area": area,
    "pincode": pincode,
    "longitude": longitude,
    "latitude": latitude,
    "email": email,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
