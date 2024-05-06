part of statsfm;

class StatsfmApi extends StatsfmApiBase {
  StatsfmApi.fromAccessToken(
    String accessToken, {
    String baseUrl = "https://beta.stats.fm/api",
    Talker? talker = null,
  }) : super.fromAccessToken(accessToken, baseUrl: baseUrl, talker: talker);
}
