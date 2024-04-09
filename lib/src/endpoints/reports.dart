part of statsfm;

class Reports extends EndpointBase {
  @override
  String get _path => 'v1/reports';

  Reports(StatsfmApiBase api) : super(api);

  /// [submitCatalogReport]
  /// Submits a catalog report to stats.fm to be reviewed for incorrect metadata
  Future<void> submitCatalogReport({
    required int typeId,
    required CatalogType type,
    required CatalogReportReason reason,
    required String? description,
  }) async {
    final Response response = await await dio.post(
      '$_path/catalog',
      data: {
        "type": enumToString(type),
        "typeId": typeId,
        "reason": enumToString(reason),
        "description": description,
      },
    );

    if (response.statusCode != 201) {
      throw StatsfmException(response.statusCode ?? 400,
          response.statusMessage ?? 'No status message');
    }

    return;
  }
}
