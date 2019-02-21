import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'account.g.dart';

@JsonSerializable()
class AccountModel {
  String avatarUrl;
  String token;

  @JsonKey(ignore: true)
  String platform;
  @JsonKey(ignore: true)
  String domain;
  @JsonKey(ignore: true)
  String login;

  AccountModel({
    @required this.avatarUrl,
    @required this.token,
    this.platform,
    this.domain,
    this.login,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
