import 'dart:convert';

CategoryListModel categoryListModelFromJson(String str) => CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) => json.encode(data.toJson());

class CategoryListModel {
  bool? success;
  List<CategoryList>? result;
  String? message;

  CategoryListModel({
    this.success,
    this.result,
    this.message,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
    success: json["success"],
    result: List<CategoryList>.from(json["result"].map((x) => CategoryList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "message": message,
  };
}

class CategoryList {
  String? offer;
  bool? status;
  String? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryList({
    this.offer,
    this.status,
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    offer: json["offer"],
    status: json["status"],
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "offer": offer,
    "status": status,
    "_id": id,
    "name": name,
    "image": image,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
