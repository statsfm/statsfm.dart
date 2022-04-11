part of statsfm;

class StatsfmApi extends StatsfmApiBase {
  StatsfmApi.fromAccessToken(
    String accessToken, {
    String baseUrl = "https://beta.stats.fm/api",
  }) : super.fromAccessToken(accessToken, baseUrl: baseUrl);
}
