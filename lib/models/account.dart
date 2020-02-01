import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'account.g.dart';

@JsonSerializable(includeIfNull: false)
class Account {
  String platform;
  String domain;
  String token;
  String login;
  String avatarUrl;
  int gitlabId;

  equals(Account a) {
    final uri = Uri.parse(domain);
    final uriA = Uri.parse(a.domain);

    // Treat domains as the same if they have the same hosts and ports
    return a.platform == platform &&
        a.login == login &&
        a.gitlabId == gitlabId &&
        uri.host == uriA.host &&
        uri.port == uriA.port;
  }

  Account({
    @required this.platform,
    @required this.domain,
    @required this.token,
    @required this.login,
    @required this.avatarUrl,
    this.gitlabId,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
