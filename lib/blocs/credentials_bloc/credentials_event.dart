part of "credentials_bloc.dart";

/// Events for the [CredentialsBloc] bloc
abstract class CredentialsEvent extends Equatable {
  final String username;
  final String password;
  const CredentialsEvent(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}

/// Event fired when the login button is tapped
class LoginButtonPressed extends CredentialsEvent {
  const LoginButtonPressed({required String username, required String password})
      : super(username, password);
}

/// Event fired when the register button is tapped
class RegisterButtonPressed extends CredentialsEvent {
  const RegisterButtonPressed(
      {required String username, required String password})
      : super(username, password);
}
