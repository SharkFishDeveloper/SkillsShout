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
