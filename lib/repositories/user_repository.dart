abstract class UserRepository {
  const UserRepository();

  /// Email of the signed user
  String get signedEmail;

  /// Login with usernamne and password
  Future<bool> authenticate(String username, String password);

  /// Register with username and password
  Future<bool> register(String username, String password);

  /// Logout
  Future<void> logOut();
}