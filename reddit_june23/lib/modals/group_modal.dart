// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class GroupModal extends Equatable {
  final String uid;
  final String groupName;
  final String groupDescription;
  final List<String> groupMembersIds;
  final String stars;
  final List<String> groupAdminIds;
  final int noOfGroupMembers;
  const GroupModal({
    required this.uid,
    required this.groupName,
    required this.groupDescription,
    required this.groupMembersIds,
    required this.stars,
    required this.groupAdminIds,
    required this.noOfGroupMembers,
  });
  
  @override
  // TODO: implement props
  List<Object> get props {
    return [
      uid,
      groupName,
      groupDescription,
      groupMembersIds,
      stars,
      groupAdminIds,
      noOfGroupMembers,
    ];
  }

  GroupModal copyWith({
    String? uid,
    String? groupName,
    String? groupDescription,
    List<String>? groupMembersIds,
    String? stars,
    List<String>? groupAdminIds,
    int? noOfGroupMembers,
  }) {
    return GroupModal(
      uid: uid ?? this.uid,
      groupName: groupName ?? this.groupName,
      groupDescription: groupDescription ?? this.groupDescription,
      groupMembersIds: groupMembersIds ?? this.groupMembersIds,
      stars: stars ?? this.stars,
      groupAdminIds: groupAdminIds ?? this.groupAdminIds,
      noOfGroupMembers: noOfGroupMembers ?? this.noOfGroupMembers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'groupName': groupName,
      'groupDescription': groupDescription,
      'groupMembersIds': groupMembersIds,
      'stars': stars,
      'groupAdminIds': groupAdminIds,
      'noOfGroupMembers': noOfGroupMembers,
    };
  }

factory GroupModal.fromMap(Map<String, dynamic> map) {
  return GroupModal(
    uid: map['uid'] as String,
    groupName: map['groupName'] as String,
    groupDescription: map['groupDescription'] as String,
    groupMembersIds: List<String>.from(map['groupMembersIds'] as List<String>),
    stars: map['stars'] as String,
    groupAdminIds: List<String>.from(map['groupAdminIds'] as List<String>),
    noOfGroupMembers: map['noOfGroupMembers'] as int,
  );
}


  String toJson() => json.encode(toMap());

  factory GroupModal.fromJson(String source) => GroupModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
