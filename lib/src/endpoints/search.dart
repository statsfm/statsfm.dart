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
    var jsonString = await _api._get(
        '$_path?query=$query&type=$typesString&limit=$limit&offset=$offset');
    var map = json.decode(jsonString);

    return SearchResults.fromJson(map['items']);
  }
}
