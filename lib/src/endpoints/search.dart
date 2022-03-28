part of statsfm;

class Search extends EndpointBase {
  @override
  String get _path => 'v1/search';

  Search(StatsfmApiBase api) : super(api);

  Future<SearchResults> search(
    String query,
    List<SearchType> type, {
    int limit = 50,
    int offset = 0,
  }) async {
    String typesString = type
        .map((e) =>
            e.toString().substring(e.toString().indexOf('.') + 1).toLowerCase())
        .join(',');
    final Map map = (await dio.get('$_path', queryParameters: {
      'query': query,
      'type': typesString,
      'limit': limit,
      'offset': offset,
    }))
        .data;

    return SearchResults.fromJson(map['items']);
  }
}
