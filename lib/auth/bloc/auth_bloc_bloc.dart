import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:login_page/core/helpers/failure.dart';
import 'package:login_page/repo/growteamly_repository.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final GtRepository gtRepository;
  AuthBlocBloc({required this.gtRepository}) : super(gtRepository) {
    on<AuthBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
