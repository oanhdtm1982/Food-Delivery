part of 'auth_bloc.dart';

/// States emitted by [AuthenticationBloc]
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

/// App just opened, login or register actions required
class AuthenticationInit extends AuthenticationState {
  const AuthenticationInit();
}

/// Login made with success
class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess();
}

/// Logout
class AuthenticationRevoked extends AuthenticationState {
  const AuthenticationRevoked();
}

/// Loading (awaiting for registration or authentication)
class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}