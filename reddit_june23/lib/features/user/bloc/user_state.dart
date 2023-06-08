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
