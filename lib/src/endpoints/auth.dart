part of statsfm;

class Auth extends EndpointBase {
  @override
  String get _path => 'v1/auth';

  Auth(StatsfmApiBase api) : super(api);

  ///Removes the service from the account, an account must have at least one account connected.
  Future<bool> disconnectService(String service) async {
    final Response response = await dio.delete(
      '$_path/$service',
    );
    return response.statusCode == 200;
  }
}
