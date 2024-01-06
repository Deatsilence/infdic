import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'infdic_user.g.dart';

@JsonSerializable()
@immutable

/// [InfDicUser] is the model of home page
final class InfDicUser with EquatableMixin {
  /// Constructor
  InfDicUser({
    required this.uId,
    required this.email,
    required this.phoneNumber,
    this.createdAt,
  });

  /// [InfDicUser.fromJson] is the json of [InfDicUser]
  factory InfDicUser.fromJson(Map<String, dynamic> json) =>
      _$InfDicUserFromJson(json);

  /// [email] is the email of home page
  final String? email;

  /// [phoneNumber] is the phone number of home page
  final String? phoneNumber;

  /// [uId] is the uId of home page
  final String? uId;

  /// [createdAt] is the created of home page
  final DateTime? createdAt;

  /// [toJson] is the json of [InfDicUser]
  Map<String, dynamic> toJson() => _$InfDicUserToJson(this);

  @override
  List<Object?> get props => [email, phoneNumber, uId, createdAt];

  /// [copyWith] is the copy of [InfDicUser]
  InfDicUser copyWith({
    String? email,
    String? phoneNumber,
    String? uId,
    DateTime? created,
  }) {
    return InfDicUser(
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      uId: uId ?? this.uId,
      createdAt: created ?? createdAt,
    );
  }
}
