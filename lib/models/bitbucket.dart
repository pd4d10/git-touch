import 'package:json_annotation/json_annotation.dart';
part 'bitbucket.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BbPagination {
  int pagelen;
  int size;
  int page;
  String next;
  List values;
  BbPagination();
  factory BbPagination.fromJson(Map<String, dynamic> json) =>
      _$BbPaginationFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbUser {
  String username;
  String nickname;
  String displayName;
  String type; // user, team
  bool isStaff;
  DateTime createdOn;
  Map<String, dynamic> links;
  String get avatarUrl => links['avatar']['href'];
  BbUser();
  factory BbUser.fromJson(Map<String, dynamic> json) => _$BbUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BbRepo {
  String name;
  BbUser owner;
  String website;
  String language;
  int size;
  String type; // repository
  bool isPrivate;
  DateTime createdOn;
  DateTime updatedOn;
  String description;
  String fullName;
  Map<String, dynamic> links;
  String get avatarUrl => links['avatar']['href'];
  BbRepo();
  factory BbRepo.fromJson(Map<String, dynamic> json) => _$BbRepoFromJson(json);
}
