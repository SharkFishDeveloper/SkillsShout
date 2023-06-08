import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:reddit_june23/modals/group_modal.dart';
import 'package:reddit_june23/modals/user_modal.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc() : super(GroupInitial()) {
    on<CreateGroupAndStoreFireStoreEvent>(createGroupAndStoreToFireStore);
  }

  FutureOr<void> createGroupAndStoreToFireStore(
      CreateGroupAndStoreFireStoreEvent event, Emitter<GroupState> emit) async {
    emit(LoadingGroupState());

    try {
      print("Inside try");
      final firestore = FirebaseFirestore.instance;
      // Generate a UID for the group
      final groupRef = firestore.collection('groups').doc();
      final groupId = groupRef.id;
      final newGroup = GroupModal(
          uid: groupId,
          groupName: event.groupName,
          groupDescription: event.groupDescription,
          groupMembersIds: [],
          stars: "0",
          groupAdminIds: [],
          noOfGroupMembers: 1);

      newGroup.groupMembersIds.add(event.userWhoCreatedGroup.uid);
      newGroup.groupAdminIds.add(event.userWhoCreatedGroup.uid);
      print(newGroup.toString());
      // Store the group data in Firestore
      await groupRef.set(newGroup.toMap());
      emit(GroupStateData(newGroup));
      emit(GroupSuccessState());
    } catch (e) {
      emit(GroupErrorState(errorMessage: e.toString()));
    }
  }
}
