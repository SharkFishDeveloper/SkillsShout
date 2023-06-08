part of 'group_bloc.dart';

@immutable
abstract class GroupEvent {}

class CreateGroupAndStoreFireStoreEvent extends GroupEvent {
  final UserModal userWhoCreatedGroup;
  final GroupModal groupModal;

  CreateGroupAndStoreFireStoreEvent(this.userWhoCreatedGroup, this.groupModal);
}

class DeleteGroupEvent extends GroupEvent {}

class StoreGroupToFireStoreEvent extends GroupEvent {}

class FetchGroupFromFireStoreEvent extends GroupEvent {
  final GroupModal fetchedGroupModal;

  FetchGroupFromFireStoreEvent(this.fetchedGroupModal);
}
