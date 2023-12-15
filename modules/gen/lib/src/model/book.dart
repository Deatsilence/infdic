// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/attributes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
@immutable

/// The line `final class Book with EquatableMixin` is declaring
/// a Dart class named `Book` and
/// specifying that it should use the `EquatableMixin` mixin.
final class Book with EquatableMixin {
  /// The code `const Book({ this.type, this.id, this.attributes })`
  /// is defining a constructor for the
  /// `Book` class. This constructor allows you to create a new instance of
  /// the `Book` class by specifying
  /// values for the `type`, `id`, and `attributes` properties.
  const Book({
    this.type,
    this.id,
    this.attributes,
  });

  /// The above function is a factory constructor in Dart that creates
  /// a Book object from a JSON map.
  ///
  /// Args:
  ///   json (Map<String, dynamic>): The `json` parameter is a `Map` object
  /// that contains key-value pairs
  /// representing the properties of a book.
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  final String? type;
  final String? id;
  final Attributes? attributes;

  /// The line `final Attributes? attributes;` is declaring a final instance variable named `attributes`
  /// of type `Attributes?`. The `?` indicates that the variable can be nullable, meaning it can have a
  /// value of `null` in addition to an `Attributes` object.
  /// The function converts a Book object to a JSON format.
  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  List<Object?> get props => [type, id, attributes];

  /// The `copyWith` function creates a new instance of the `Book` class with updated values for the
  /// specified properties.
  ///
  /// Args:
  ///   type (String): The "type" parameter is a string that represents the type of the book. It is an
  /// optional parameter, meaning it can be null or have a value.
  ///   id (String): The `id` parameter is a string that represents the unique identifier of a book.
  ///   attributes (Attributes): The "attributes" parameter is an optional parameter of type
  /// "Attributes". It is used to provide additional information or properties for the book object.
  ///
  /// Returns:
  ///   an instance of the `Book` class.
  Book copyWith({
    String? type,
    String? id,
    Attributes? attributes,
  }) {
    return Book(
      type: type ?? this.type,
      id: id ?? this.id,
      attributes: attributes ?? this.attributes,
    );
  }
}
