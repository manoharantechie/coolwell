import 'dart:convert';

import 'package:coolwell/common/data/model/login_model.dart';
import 'package:coolwell/common/data/model/common_model.dart';
import 'package:coolwell/common/data/model/tech_list_model.dart';
import 'package:coolwell/common/data/model/user_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIUtils {
  final appName = 'Coolwell';

  static const baseURL = "http://139.59.30.46";
  static const String logInURL = '/login';
  static const String techListURL = '/admin/TechnicianList';
  static const String userListURL = '/users/list';
  static const String addtechURL = '/admin/addTechnician';

  Future<LoginModel> doLoginEmail(
    String email,
    String password,
  ) async {
    var emailbodyData = {'email': email, 'password': password};
    final response =
        await http.post(Uri.parse(baseURL + logInURL), body: emailbodyData);
    return LoginModel.fromJson(json.decode(response.body));
  }

  Future<TechListModel> getTechList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer " + preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    final response = await http.get(Uri.parse(baseURL + techListURL),
        headers: requestHeaders);
    return TechListModel.fromJson(json.decode(response.body));
  }

  Future<Userlistmodel> getUserList(String limit, String page) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer " + preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    final response = await http.get(
        Uri.parse(baseURL + userListURL + "?limit=$limit&page=$page"),
        headers: requestHeaders);
    return Userlistmodel.fromJson(json.decode(response.body));
  }

  Future<CommonModel> addTechnician(
    String name,
    String city,
    String Area,
    String pincode,
    String email,
    String password,
    String phone,
  ) async {
    var emailbodyData = {
      'name': name,
      'role': "technician",
      'city': city,
      'Area': Area,
      'pincode': pincode,
      'longitude': "0.00000",
      'latitude': "0.00000",
      'email': email,
      'password': password,
      'phone': phone,
    };

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var auth = "Bearer " + preferences.getString("token").toString();
    Map<String, String> requestHeaders = {
      'authorization': auth.toString(),
    };
    final response =
        await http.post(Uri.parse(baseURL + addtechURL), body: emailbodyData,headers: requestHeaders);
    print(response.body);
    return CommonModel.fromJson(json.decode(response.body));
  }
}
