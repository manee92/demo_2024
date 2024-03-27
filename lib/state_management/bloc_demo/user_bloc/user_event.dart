import 'package:flutter/material.dart';

@immutable
abstract class UserListEvent {
  const UserListEvent();
}

class LoadUserList extends UserListEvent {
  const LoadUserList();
}
