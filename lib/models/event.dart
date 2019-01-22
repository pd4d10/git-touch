import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Actor {
  Actor(this.login, this.avatarUrl);

  String login;
  String avatarUrl;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
  Map<String, dynamic> toJson() => _$ActorToJson(this);
}

@JsonSerializable()
class Repo {
  Repo(this.name);

  String name;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}

@JsonSerializable()
class Event {
  Event(this.id, this.type, this.actor, this.repo);

  String id;
  String type;
  Actor actor;
  Repo repo;
  Map<String, dynamic> payload;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
