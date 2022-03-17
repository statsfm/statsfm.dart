part of statsfm;

class Search extends EndpointBase {
  @override
  String get _path => 'v1/search';

  Search(StatsfmApiBase api) : super(api);

  Future<SearchResults> search(
    String query,
    List<SearchType> types, {
    int limit = 50,
    int offset = 0,
  }) async {
    String typesString = types
        .map((e) =>
            e.toString().substring(e.toString().indexOf('.') + 1).toLowerCase())
        .join(',');
    final Map map = (await dio.get('$_path', queryParameters: {
      'query': query,
      'types': typesString,
      'limit': limit,
      'offset': offset,
    }))
        .data;

    return SearchResults.fromJson(map['items']);
  }
}
