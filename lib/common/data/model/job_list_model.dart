import 'dart:convert';

JobListModel jobListModelFromJson(String str) => JobListModel.fromJson(json.decode(str));

String jobListModelToJson(JobListModel data) => json.encode(data.toJson());

class JobListModel {
  bool? success;
  List<Result>? result;
  String? message;

  JobListModel({
    this.success,
    this.result,
    this.message,
  });

  factory JobListModel.fromJson(Map<String, dynamic> json) => JobListModel(
    success: json["success"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
  };
}

class Result {
  List<String>? checklist;
  List<String>? attachment;
  List<String>? notes;
  int? serviceStatus;
  String? id;
  String? complaintId;
  TechnicianId? technicianId;
  dynamic taskTitle;
  dynamic category;
  dynamic startTime;
  dynamic endTime;
  dynamic location;
  dynamic latitude;
  dynamic longitude;
  dynamic userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Result({
    this.checklist,
    this.attachment,
    this.notes,
    this.serviceStatus,
    this.id,
    this.complaintId,
    this.technicianId,
    this.taskTitle,
    this.category,
    this.startTime,
    this.endTime,
    this.location,
    this.latitude,
    this.longitude,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    checklist: json["Checklist"],
    attachment: json["Attachment"],
    notes: json["Notes"],
    serviceStatus: json["service_status"],
    id: json["_id"],
    complaintId: json["Complaint_id"],
    technicianId: TechnicianId.fromJson(json["Technician_id"]),
    taskTitle: json["Task_Title"],
    category: json["Category"],
    startTime: json["Start_Time"].toDouble(),
    endTime: json["End_Time"].toDouble(),
    location: json["Location"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    userId:json["User_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "Checklist": List<dynamic>.from(checklist!.map((x) => [x])),
    "Attachment": List<dynamic>.from(attachment!.map((x) =>[x])),
    "Notes": List<dynamic>.from(notes!.map((x) => [x])),
    "service_status": serviceStatus,
    "_id": id,
    "Complaint_id": complaintId,
    "Technician_id": technicianId!.toJson(),
    "Task_Title": taskTitle,
    "Category": category,
    "Start_Time": startTime,
    "End_Time": endTime,
    "Location": location,
    "latitude": latitude,
    "longitude": longitude,
    "User_id": userId,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}



class TechnicianId {
  String? techId;
  dynamic profilePic;
  dynamic twofa;
  dynamic role;
  bool? verified;
  bool? google;
  bool? facebook;
  String? phone;
  int? status;
  bool? gmailVerified;
  bool? phoneVerified;
  AddressOther? addressDefault;
  AddressOther? addressHome;
  List<AddressOther>? addressOther;
  dynamic id;
  dynamic name;
  dynamic city;
  dynamic area;
  String? pincode;
  String? longitude;
  String? latitude;
  dynamic email;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? gmailOtp;

  TechnicianId({
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
    this.id,
    this.name,
    this.city,
    this.area,
    this.pincode,
    this.longitude,
    this.latitude,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.gmailOtp,
  });

  factory TechnicianId.fromJson(Map<String, dynamic> json) => TechnicianId(
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
    addressDefault: json["addressDefault"],
    addressHome: json["addressHome"],
    addressOther: List<AddressOther>.from(json["addressOther"].map((x) => AddressOther.fromJson(x))),
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
    gmailOtp: json["gmail_otp"],
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
    "addressDefault": addressDefault,
    "addressHome": addressHome,
    "addressOther": List<dynamic>.from(addressOther!.map((x) => x.toJson())),
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
    "gmail_otp": gmailOtp,
  };
}

class AddressOther {
  dynamic address;
  dynamic city;
  String? zip;
  String? longitude;
  String? latitude;

  AddressOther({
    this.address,
    this.city,
    this.zip,
    this.longitude,
    this.latitude,
  });

  factory AddressOther.fromJson(Map<String, dynamic> json) => AddressOther(
    address: json["Address"],
    city: json["city"],
    zip: json["zip"],
    longitude: json["longitude"],
    latitude: json["latitude"],
  );

  Map<String, dynamic> toJson() => {
    "Address": address,
    "city":city,
    "zip": zip,
    "longitude": longitude,
    "latitude": latitude,
  };
}


