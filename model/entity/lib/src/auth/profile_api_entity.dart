import 'package:flutter/cupertino.dart';

@immutable
class ProfileApiEntity {
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;

  const ProfileApiEntity({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
  });

}
