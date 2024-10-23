import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:mechanice/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;
import 'package:mechanice/core/functions/checkinternet.dart';

class BotCrud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkurl),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(data),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}

class BotData {
  BotCrud crud;

  BotData(this.crud);

  postData(String question) async {
    var response = await crud.postData("http://192.168.209.14:5000/api", {
      "message": question.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
