part of statsfm;

class Me extends EndpointBase {
  @override
  String get _path => 'v1/me';

  Me(StatsfmApiBase api) : super(api);

  Future<UserPublic> get() async {
    var jsonString = await _api._get(_path);
    var map = json.decode(jsonString);

    return UserPublic.fromJson(map['item']);
  }
}
