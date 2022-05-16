import 'dart:convert';

import 'package:http/http.dart';

import 'failure.dart';

Either<Map<String, dynamic>, Failure> getResponseData(Response? response) {
  List<int> successStatusCode = [200, 201, 202];
  //if no response
  if (response == null) {
    return Right(Failure(message: "Network"));
  } else {
    //if success status code
    if (successStatusCode.contains(response.statusCode)) {
      final jsonResponse = decodeJson(response);
      return jsonResponse.fold((l) => Left(l), (r) => Right(Failure(message: r.message)));
    } else {
      //if failure statuscode, implementing try catch to check if json is obtained as response
      final jsonResponse = decodeJson(response);
      return jsonResponse.fold(l) => Right(Failure(message: "fetch Failed ")),

    }
  }
}

//json decoding
Either<Map<String, dynamic>, Failure> decodeJson(Response response) {
  try {
    return Left(jsonDecode(response.body));
  } catch (e) {
    return Right(Failure(message: "Parsing Error"));
  }
}
