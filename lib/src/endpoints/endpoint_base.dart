part of statsfm;

abstract class EndpointBase {
  // ignore: unused_element
  String get _path;

  final StatsfmApiBase _api;

  EndpointBase(this._api);

  Dio get dio => _api.dio;
}
