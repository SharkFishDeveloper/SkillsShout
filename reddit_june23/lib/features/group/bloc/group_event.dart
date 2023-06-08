part of 'group_bloc.dart';

@immutable
abstract class GroupEvent {}

class CreateGroupAndStoreFireStoreEvent extends GroupEvent {
  final UserModal userWhoCreatedGroup;
  final String groupName;
  final String groupDescription;

  CreateGroupAndStoreFireStoreEvent(
      {required this.userWhoCreatedGroup,
      required this.groupName,
      required this.groupDescription});
}

class DeleteGroupEvent extends GroupEvent {}

class StoreGroupToFireStoreEvent extends GroupEvent {}

class FetchGroupFromFireStoreEvent extends GroupEvent {
  final GroupModal fetchedGroupModal;

  FetchGroupFromFireStoreEvent(this.fetchedGroupModal);
}
