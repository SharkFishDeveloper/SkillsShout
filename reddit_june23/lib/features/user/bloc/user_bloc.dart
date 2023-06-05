import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../modals/user_modal.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // final userModal = const UserModal(username: "",bio: "",phoneNumber: "",idOfFollowers: [],uid: "",skill: [],city: "",rating: "",isAdmin: false, email: "");
  UserModal userModal = UserModal(
      uid: "",
      username: "",
      phoneNumber: "",
      isAdmin: false,
      bio: "",
      city: "",
      idOfFollowers: [],
      skill: [],
      email: "",
      rating: "");
  UserBloc()
      : super(UserState(UserModal(
            username: "",
            bio: "",
            phoneNumber: "",
            idOfFollowers: [],
            uid: "",
            skill: [],
            city: "",
            rating: "",
            isAdmin: false,
            email: ""))) {
    on<UserUpdateEvent>(userUpdate);
  }

  FutureOr<void> userUpdate(UserUpdateEvent event, Emitter<UserState> emit) {
    userModal = event.userModal;
    emit(UserState(userModal));
  }
}
