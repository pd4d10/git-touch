import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Subject {
  Subject(this.title, this.type);

  String title;
  String type;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable()
class Owner {
  Owner(this.login, this.avatarUrl);

  String login;
  String avatarUrl;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}

@JsonSerializable()
class Repository {
  Repository(this.fullName, this.type, this.onwer);

  String fullName;
  String type;
  Owner onwer;

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);
  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}

@JsonSerializable()
class NotificationItem {
  NotificationItem(this.id, this.type, this.actor, this.repository);

  String id;
  String type;
  Subject actor;
  Repository repository;
  Map<String, dynamic> payload;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationItemToJson(this);
}
