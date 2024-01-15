import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'license.g.dart';

@JsonSerializable()
@immutable

/// [License] is the model of license
final class License with EquatableMixin {
  /// Constructor
  const License({this.name, this.url});

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  /// [name] is the name of searched word
  final String? name;

  /// [url] is the url of searched word
  final String? url;

  Map<String, dynamic> toJson() => _$LicenseToJson(this);

  @override
  List<Object?> get props => [name, url];
}
