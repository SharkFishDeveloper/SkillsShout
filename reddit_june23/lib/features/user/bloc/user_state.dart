// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserState {}

@immutable
class UserStateData extends UserState {
  final UserModal userModal;

  UserStateData(this.userModal);
}

class UserErrorState extends UserState {
  String errorMessage;
  UserErrorState({
    required this.errorMessage,
  });
}

class UserSearchDataState extends UserState {
  final List<UserModal> listOfUsersAfterSearch;
  UserSearchDataState({
    required this.listOfUsersAfterSearch,
  });
}

class NoUserAfterSearchState extends UserState {}
