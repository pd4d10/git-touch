import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  @JsonSerializable(includeIfNull: true)
  factory Account({
    required String platform,
    required String domain,
    required String token,
    required String login,
    required String avatarUrl,
    int? gitlabId, // For GitLab
    String? appPassword, // For Bitbucket
    String? accountId, // For Bitbucket
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}
