import 'package:json_annotation/json_annotation.dart';
part 'bitbucket.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BbUser {
  String username;
  String displayName;
  bool isStaff;
  DateTime createdOn;
  Map<String, dynamic> links;
  String get avatarUrl => links['avatar']['href'];
  BbUser();
  factory BbUser.fromJson(Map<String, dynamic> json) => _$BbUserFromJson(json);
}
