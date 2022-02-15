part of statsfm;

class Users extends EndpointBase {
  @override
  String get _path => 'v1/users';

  Users(StatsfmApiBase api) : super(api);

  Future<UserPublic> get(String userId) async {
    var jsonString = await _api._get('$_path/$userId');
    var map = json.decode(jsonString);

    return UserPublic.fromJson(map['item']);
  }
}
