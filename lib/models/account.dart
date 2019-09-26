import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'account.g.dart';

@JsonSerializable()
class AccountModel {
  String platform;
  String domain;
  String token;
  String login;
  String avatarUrl;

  equals(AccountModel a) =>
      a.platform == platform && a.domain == domain && a.login == login;

  AccountModel({
    @required this.platform,
    @required this.domain,
    @required this.token,
    @required this.login,
    @required this.avatarUrl,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
