part of statsfm;

class Private extends EndpointBase {
  @override
  String get _path => 'v1/private';

  Private(StatsfmApiBase api) : super(api);

  /// [legal]
  /// Get current legal document versions
  Future<LegalItems> legal() async {
    final Map map = (await dio.get('$_path/legal')).data;

    return LegalItems.fromJson(map as Map<String, dynamic>);
  }
}
