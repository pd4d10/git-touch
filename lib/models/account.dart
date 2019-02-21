import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'account.g.dart';

@JsonSerializable()
class AccountModel {
  String avatarUrl;
  String token;
  String domain;

  AccountModel({
    @required this.avatarUrl,
    @required this.token,
    this.domain,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
