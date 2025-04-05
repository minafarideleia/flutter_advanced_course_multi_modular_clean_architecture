abstract class SessionProvider {
  String getClientId();

  String getUserId();

  String getAccessToken();

  String getRefreshToken();

  void setUserId(String userId);

  void setAccessToken(String accessToken);

  void setRefreshToken(String refreshToken);
}
