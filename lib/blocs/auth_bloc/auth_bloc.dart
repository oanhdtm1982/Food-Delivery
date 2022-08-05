import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  AuthenticationBloc(this.userRepository) : super(const AuthenticationInit());

  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is LoggedIn) {
      yield const AuthenticationSuccess();
    }

    if (event is LoggedOut) {
      yield const AuthenticationLoading();
      await userRepository.logOut();
      yield const AuthenticationRevoked();
    }
  }
}
