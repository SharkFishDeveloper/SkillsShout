import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../core/common/scaffold_messanger.dart';
import '../../../modals/user_modal.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // final userModal = const UserModal(username: "",bio: "",phoneNumber: "",idOfFollowers: [],uid: "",skill: [],city: "",rating: "",isAdmin: false, email: "");
  // UserModal userModal = UserModal(
  //     uid: "",
  //     username: "",
  //     phoneNumber: "",
  //     isAdmin: false,
  //     bio: "",
  //     city: "",
  //     idOfFollowers: [],
  //     skill: [],
  //     email: "",
  //     rating: "");

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
    on<StoreUserDataEventInFirestore>(storeUserDataEventInFirestore);
  }

  FutureOr<void> userUpdate(UserUpdateEvent event, Emitter<UserState> emit) {
//userModal = event.userModal;
    emit(UserState(event.userModal));
  }

  FutureOr<void> storeUserDataEventInFirestore(
      StoreUserDataEventInFirestore event, Emitter<UserState> emit) {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      CollectionReference users =
          FirebaseFirestore.instance.collection('all_users');
      users.doc(event.userModal.uid).set(event.userModal.toMap());
    } on FirebaseAuthException catch (e) {
      //showSnackBar(context, e.message!);
      print(e.message);
    } catch (e) {
      //showSnackBar(context, e.toString());
      print(e.toString());
    }
  }
}
