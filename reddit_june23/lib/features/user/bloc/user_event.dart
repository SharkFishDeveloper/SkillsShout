// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserUpdateEvent extends UserEvent {
  final UserModal userModal;

  UserUpdateEvent(this.userModal); //* to be given by UI
}

class StoreUserDataEventInFirestore extends UserEvent {
  final UserModal userModal;
  StoreUserDataEventInFirestore(this.userModal);
}

class SearchUserEventInFirestore extends UserEvent {
  String searchString;
  SearchUserEventInFirestore({
    required this.searchString,
  });
}
