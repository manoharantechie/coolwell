import 'dart:convert';

Userlistmodel userlistmodelFromJson(String str) => Userlistmodel.fromJson(json.decode(str));

String userlistmodelToJson(Userlistmodel data) => json.encode(data.toJson());

class Userlistmodel {
  bool? success;
  Result? result;
  String? message;

  Userlistmodel({
    this.success,
    this.result,
    this.message,
  });

  factory Userlistmodel.fromJson(Map<String, dynamic> json) => Userlistmodel(
    success: json["success"],
    result: Result.fromJson(json["result"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result!.toJson(),
    "message": message,
  };
}

class Result {
  List<Userlist>? docs;
  int? totalDocs;
  int? limit;
  int? totalPages;
  int? page;
  int? pagingCounter;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prevPage;
  int? nextPage;

  Result({
    this.docs,
    this.totalDocs,
    this.limit,
    this.totalPages,
    this.page,
    this.pagingCounter,
    this.hasPrevPage,
    this.hasNextPage,
    this.prevPage,
    this.nextPage,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    docs: List<Userlist>.from(json["docs"].map((x) => Userlist.fromJson(x))),
    totalDocs: json["totalDocs"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    page: json["page"],
    pagingCounter: json["pagingCounter"],
    hasPrevPage: json["hasPrevPage"],
    hasNextPage: json["hasNextPage"],
    prevPage: json["prevPage"],
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "docs": List<dynamic>.from(docs!.map((x) => x.toJson())),
    "totalDocs": totalDocs,
    "limit": limit,
    "totalPages": totalPages,
    "page": page,
    "pagingCounter": pagingCounter,
    "hasPrevPage": hasPrevPage,
    "hasNextPage": hasNextPage,
    "prevPage": prevPage,
    "nextPage": nextPage,
  };
}

class Userlist {
  String? id;
  int? techId;
  String? profilePic;
  dynamic twofa;
  String? role;
  bool? verified;
  bool? google;
  bool? facebook;
  String? phone;
  int? status;
  bool? gmailVerified;
  bool? phoneVerified;
  AddressDefault? addressDefault;
  AddressDefault? addressHome;
  List<AddressDefault>? addressOther;
  String? name;
  String? email;
  dynamic createdAt;
  dynamic updatedAt;
  String? gmailOtp;
  String? verification;

  Userlist({
    this.id,
    this.techId,
    this.profilePic,
    this.twofa,
    this.role,
    this.verified,
    this.google,
    this.facebook,
    this.phone,
    this.status,
    this.gmailVerified,
    this.phoneVerified,
    this.addressDefault,
    this.addressHome,
    this.addressOther,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.gmailOtp,
    this.verification,
  });

  factory Userlist.fromJson(Map<String, dynamic> json) => Userlist(
    id: json["_id"],
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
    addressDefault: json["addressDefault"]==null || json["addressDefault"]=="null"?AddressDefault():AddressDefault.fromJson(json["addressDefault"]),
    addressHome:  json["addressHome"]==null || json["addressHome"]=="null"?AddressDefault():AddressDefault.fromJson(json["addressHome"]),
    addressOther:json["addressOther"]==null || json["addressOther"]=="null"?[]: List<AddressDefault>.from(json["addressOther"].map((x) => AddressDefault.fromJson(x))),
    name: json["name"],
    email: json["email"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    gmailOtp: json["gmail_otp"],
    verification: json["verification"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
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
    "addressDefault": addressDefault!.toJson(),
    "addressHome": addressHome!.toJson(),
    "addressOther": List<dynamic>.from(addressOther!.map((x) => x.toJson())),
    "name": name,
    "email": email,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "gmail_otp": gmailOtp,
    "verification": verification,
  };
}
class AddressDefault {
  String? address;
  String? city;
  String? zipcode;
  String? latitude;
  String? longitude;

  AddressDefault({
    this.address,
    this.city,
    this.zipcode,
    this.latitude,
    this.longitude,
  });

  factory AddressDefault.fromJson(Map<String, dynamic> json) => AddressDefault(
    address: json["address"],
    city: json["city"],
    zipcode: json["zipcode"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "city": city,
    "zipcode": zipcode,
    "latitude": latitude,
    "longitude": longitude,
  };
}




