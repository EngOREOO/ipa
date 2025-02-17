import 'dart:convert';

import 'package:elmahdy/bindings/headers.dart';
import 'package:elmahdy/core/class/statusrequest.dart';
import 'package:elmahdy/core/constant/routes.dart';
import 'package:elmahdy/core/functions/checkinternet.dart';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

// MyServices myServices = Get.find();

// Map<String, String> myheaders = {
//   'Accept': 'application/json',
// };
// Map<String, String> myheaderswithtoken = {
//   'Accept': 'application/json',
//   'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
// };

class Crud {
  Future<Either<StatusRequest, Map>> PostData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(linkurl), body: data, headers: myheaders);
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 404 ||
            response.statusCode == 401 ||
            response.statusCode == 422 ||
            response.statusCode == 400 ||
            response.statusCode == 500) {
          print(data);
          Map responsebody = jsonDecode(response.body);

          return Right(responsebody);
        }
        // else if (response.statusCode == 401) {
        //   Get.offAllNamed(AppRoutes.login);
        //   return const Left(StatusRequest.none);
        // }
        else {
          print(64466644);

          print(response.body);

          return const Left(StatusRequest.serverfailure);
        }
      } else {
        print(656565444);

        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      print(_);
      print(6444);

      return const Left(StatusRequest.serverexption);
    }
  }
}

class Crudtoken {
  Future<Either<StatusRequest, Map>> PostData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(linkurl), body: data, headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${myServices.sharedPreferences.getString("token")}',
        });
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 404 ||
            response.statusCode == 401 ||
            response.statusCode == 422 ||
            response.statusCode == 400 ||
            response.statusCode == 500) {
          Map responsebody = jsonDecode(response.body);
          if (responsebody["message"] == "Unauthenticated.") {
            Get.offAllNamed(AppRoutes.login);
          }

          return Right(responsebody);
        }
        // else if (response.statusCode == 401) {
        //   Get.offAllNamed(AppRoutes.login);
        //   return const Left(StatusRequest.none);
        // }
        else {
          print(64466644);

          print(response.body);

          return const Left(StatusRequest.serverfailure);
        }
      } else {
        print(656565444);

        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      print(_);

      return const Left(StatusRequest.serverexption);
    }
  }
}

class Crudg {
  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl), headers: myheaders);

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 404 ||
            response.statusCode == 401 ||
            response.statusCode == 422 ||
            response.statusCode == 400 ||
            response.statusCode == 500) {
          Map responsebody = jsonDecode(response.body);

          return Right(responsebody);
        }
        // else if (response.statusCode == 401) {
        //   Get.offAllNamed(AppRoutes.login);
        //   return const Left(StatusRequest.none);
        // }
        else {
          print(response.body);
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverexption);
    }
  }
}

class Crudtokenraw {
  Future<Either<StatusRequest, dynamic>> PostData(
      String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        String jsonData = jsonEncode(data);

        var response = await http.post(
          Uri.parse(linkurl),
          body: jsonData,
          headers: {
            ...{
              'Accept': 'application/json',
              'Authorization':
                  'Bearer ${myServices.sharedPreferences.getString("token")}',
            },
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 404 ||
            response.statusCode == 401 ||
            response.statusCode == 422 ||
            response.statusCode == 400 ||
            response.statusCode == 500) {
          print(jsonData);

          dynamic responseBody = jsonDecode(response.body);

          return Right(responseBody);
        }
        // else if (response.statusCode == 401) {
        //   Get.offAllNamed(AppRoutes.login);
        //   return const Left(StatusRequest.none);
        // }
        else {
          print(response.statusCode);
          print(response.body);

          return const Left(StatusRequest.serverfailure);
        }
      } else {
        print('لا يوجد اتصال بالإنترنت.');

        return const Left(StatusRequest.offlinefailure);
      }
    } catch (error) {
      print(error);

      return const Left(StatusRequest.serverexption);
    }
  }
}

class Crudgtoken {
  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl), headers: {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${myServices.sharedPreferences.getString("token")}',
        });

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 404 ||
            response.statusCode == 401 ||
            response.statusCode == 422 ||
            response.statusCode == 400 ||
            response.statusCode == 500) {
          Map responsebody = jsonDecode(response.body);
          if (responsebody["message"] == "Unauthenticated.") {
            Get.offAllNamed(AppRoutes.login);
          }
          return Right(responsebody);
        }
        // else if (response.statusCode == 401) {
        //   Get.offAllNamed(AppRoutes.login);
        //   return const Left(StatusRequest.none);
        // }
        else {
          print(response.body);
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverexption);
    }
  }
}

class Crudwithfiles {
  Future<Either<StatusRequest, Map>> PostDataWithFiles(
      String linkurl, Map data, File? file) async {
    // تم جعل المتغير file اختيارياً
    try {
      if (await checkInternet()) {
        var request = http.MultipartRequest("POST", Uri.parse(linkurl));

        // Add headers
        Map<String, String> myheaderswithtoken = {
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${myServices.sharedPreferences.getString("token")}',
        };
        request.headers.addAll(myheaderswithtoken);

        // Add text fields
        data.forEach((key, value) {
          request.fields[key] = value.toString();
        });

        // Add file if it's not null
        if (file != null) {
          var length = await file.length();
          var stream = http.ByteStream(file.openRead());
          var multipartFile = http.MultipartFile("image", stream, length,
              filename: basename(file.path));
          request.files.add(multipartFile);
        }

        var response = await request.send();
        var responseString = await response.stream.bytesToString();

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(responseString);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      print(_);
      return const Left(StatusRequest.serverexption);
    }
  }
}
