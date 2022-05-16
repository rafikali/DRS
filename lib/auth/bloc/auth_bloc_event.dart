part of 'auth_bloc_bloc.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthBlocEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthBlocEvent {
  final String? accessToken;
  const LoggedIn({@required this.accessToken}) : super();

  @override
  String toString() => 'LoggedIn { token: $accessToken }';
}

class LoggedOut extends AuthBlocEvent {
  @override
  String toString() => 'LoggedOut';
}
