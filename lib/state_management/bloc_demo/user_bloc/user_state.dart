import 'package:calendar_app/state_management/bloc_demo/user_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserListState {}

class UserListLoading extends UserListState {
}

class UserListInitial extends UserListState {
}

class UserListSuccess extends UserListState {
  final List<User> userList;
  UserListSuccess(this.userList);
}

class UserListError extends UserListState {
  final String error;
  UserListError(this.error);
}