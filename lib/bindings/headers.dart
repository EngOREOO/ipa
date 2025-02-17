import 'dart:convert';
import 'package:elmahdy/core/services/services.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

MyServices myServices = Get.find();

Map<String, String> myheaders = {
  'Accept': 'application/json',
};

Map<String, String> myheaderswithtoken = {
  'Accept': 'application/json',
  'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
};
