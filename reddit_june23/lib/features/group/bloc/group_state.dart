// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'group_bloc.dart';

@immutable
abstract class GroupState {}

class GroupInitial extends GroupState {}

class GroupStateData extends GroupState {
  final GroupModal groupModal;

  GroupStateData(this.groupModal);
}

class GroupErrorState extends GroupState {
  final String errorMessage;
  GroupErrorState({
    required this.errorMessage,
  });
}

class LoadingGroupState extends GroupState {}

class GroupSuccessState extends GroupState{}
