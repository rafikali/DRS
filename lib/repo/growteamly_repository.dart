import 'package:login_page/core/helpers/failure.dart';
import 'package:login_page/core/network/base_client.dart';
import 'package:login_page/repo/models/login_response.dart';

class GtRepository {
  final GtBaseClient? client;
  GtRepository({this.client});

  Future<Either<LoginResponse, Failure>> fetchLogin() async {
    final response = await client.getRequest(shouldCache: true);
    return getResponseData(response);
  }
}
