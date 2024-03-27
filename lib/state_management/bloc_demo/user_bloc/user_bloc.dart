import 'package:calendar_app/state_management/bloc_demo/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserRepository userRepository;

  UserListBloc({required this.userRepository}) : super(UserListInitial()) {

    on<LoadUserList>((event, emit) async {
      emit(UserListLoading());
      try {
        final userList = await userRepository.getUserList();
        emit(UserListSuccess(userList));
      } catch (e) {
        emit(UserListError(e.toString()));
      }
    });
  }
}