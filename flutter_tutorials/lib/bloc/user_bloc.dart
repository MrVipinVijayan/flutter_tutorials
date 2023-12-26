import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorials/bloc/user_event.dart';
import 'package:flutter_tutorials/bloc/user_state.dart';
import 'package:flutter_tutorials/repo/user_repo.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>(loadUsers);
  }

  FutureOr<void> loadUsers(event, emit) async {
    emit(UserLoadingState());
    try {
      final users = await _userRepository.getUsers();
      emit(UserLoadedState(users));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
