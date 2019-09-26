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

  equals(AccountModel a) {
    final uri = Uri.parse(domain);
    final uriA = Uri.parse(a.domain);

    // Treat domains as the same if they have the same hosts and ports
    return a.platform == platform &&
        a.login == login &&
        uri.host == uriA.host &&
        uri.port == uriA.port;
  }

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
