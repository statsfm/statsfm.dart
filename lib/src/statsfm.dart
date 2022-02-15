part of statsfm;

class StatsfmApi extends StatsfmApiBase {
  StatsfmApi.fromClient(FutureOr<oauth2.Client> client)
      : super.fromClient(client);

  StatsfmApi.fromAccessToken(String accessToken)
      : super.fromAccessToken(accessToken);
}
