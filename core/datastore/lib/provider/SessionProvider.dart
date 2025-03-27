abstract class SessionProvider{
  String getClientId();
  String getUserId();
  String getAccessToken();
  String getRefreshToken();
}