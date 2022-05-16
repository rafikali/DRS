part of 'auth_bloc_bloc.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

class AuthenticatonUninitialized extends AuthBlocState {}

class AuthenticatonAuthenticated extends AuthBlocState {}

class AuthenticatonUnauthenticated extends AuthBlocState {}

class AuthenticationLoading extends AuthBlocState {}

class AuthLoadError extends AuthBlocState {
  final Failure failure;
  const AuthLoadError({required this.failure});
}
