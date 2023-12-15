// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attributes.g.dart';

@JsonSerializable()
@immutable

/// This model will use X api response
final class Attributes with EquatableMixin {
  /// it will be used to create an ew instance of this class
  const Attributes({
    this.title,
    this.body,
    this.created,
    this.updated,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => _$AttributesFromJson(json);

  final String? title;
  final String? body;
  final DateTime? created;
  final DateTime? updated;

  /// The function converts an object of type Attributes to a JSON map.
  Map<String, dynamic> toJson() => _$AttributesToJson(this);

  @override
  List<Object?> get props => [title, body, created, updated];

  /// The `copyWith` function in Dart returns a new instance of the `Attributes` class with updated
  /// values for the specified attributes, while keeping the original values for any attributes that are
  /// not updated.
  ///
  /// Args:
  ///   title (String): A string representing the title of the attributes.
  ///   body (String): The `body` parameter is a `String` that represents the body of the attributes. It
  /// is an optional parameter, meaning it can be null.
  ///   created (DateTime): A DateTime object representing the creation date of the attributes.
  ///   updated (DateTime): The "updated" parameter is a DateTime object that represents the updated date
  /// and time of the attributes.
  ///
  /// Returns:
  ///   The method is returning an instance of the `Attributes` class with updated values for the
  /// `title`, `body`, `created`, and `updated` attributes.
  Attributes copyWith({
    String? title,
    String? body,
    DateTime? created,
    DateTime? updated,
  }) {
    return Attributes(
      title: title ?? this.title,
      body: body ?? this.body,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }
}
