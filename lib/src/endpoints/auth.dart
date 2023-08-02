part of statsfm;

class Auth extends EndpointBase {
  @override
  String get _path => 'v1/auth';

  Auth(StatsfmApiBase api) : super(api);

  ///Get the connected streaming services to the current stats.fm account
  Future<AuthConnections> connections() async {
    final Map map = (await dio.get(
      '$_path/connections',
    ))
        .data;

    return AuthConnections.fromJson(map as Map<String, dynamic>);
  }

  ///Removes the service from the account, an account must have at least one account connected.
  Future<bool> disconnectService(String service) async {
    final Response response = await dio.delete(
      '$_path/$service',
    );
    return response.statusCode == 200;
  }
}
