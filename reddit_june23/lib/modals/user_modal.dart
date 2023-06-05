import 'dart:convert';

import 'package:collection/collection.dart';

class UserModal {
  final String uid;
  final String username;
  final String phoneNumber;
  final bool isAdmin;
  final String bio;
  final String city;
  final List<String> idOfFollowers;
  final List<String> skill;
  final String email;
  final String rating;

  UserModal({
    required this.uid,
    required this.username,
    required this.phoneNumber,
    required this.isAdmin,
    required this.bio,
    required this.city,
    required this.idOfFollowers,
    required this.skill,
    required this.email,
    required this.rating,
  });

  UserModal copyWith({
    String? uid,
    String? username,
    String? phoneNumber,
    bool? isAdmin,
    String? bio,
    String? city,
    List<String>? idOfFollowers,
    List<String>? skill,
    String? email,
    String? rating,
  }) {
    return UserModal(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isAdmin: isAdmin ?? this.isAdmin,
      bio: bio ?? this.bio,
      city: city ?? this.city,
      idOfFollowers: idOfFollowers ?? this.idOfFollowers,
      skill: skill ?? this.skill,
      email: email ?? this.email,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'phoneNumber': phoneNumber,
      'isAdmin': isAdmin,
      'bio': bio,
      'city': city,
      'idOfFollowers': idOfFollowers,
      'skill': skill,
      'email': email,
      'rating': rating,
    };
  }

  factory UserModal.fromMap(Map<String, dynamic> map) {
    return UserModal(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
      bio: map['bio'] ?? '',
      city: map['city'] ?? '',
      idOfFollowers: List<String>.from(map['idOfFollowers']),
      skill: List<String>.from(map['skill']),
      email: map['email'] ?? '',
      rating: map['rating'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModal.fromJson(String source) =>
      UserModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModal(uid: $uid, username: $username, phoneNumber: $phoneNumber, isAdmin: $isAdmin, bio: $bio, city: $city, idOfFollowers: $idOfFollowers, skill: $skill, email: $email, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is UserModal &&
        other.uid == uid &&
        other.username == username &&
        other.phoneNumber == phoneNumber &&
        other.isAdmin == isAdmin &&
        other.bio == bio &&
        other.city == city &&
        listEquals(other.idOfFollowers, idOfFollowers) &&
        listEquals(other.skill, skill) &&
        other.email == email &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        username.hashCode ^
        phoneNumber.hashCode ^
        isAdmin.hashCode ^
        bio.hashCode ^
        city.hashCode ^
        idOfFollowers.hashCode ^
        skill.hashCode ^
        email.hashCode ^
        rating.hashCode;
  }
}
