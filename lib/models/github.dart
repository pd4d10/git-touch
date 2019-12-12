import 'package:git_touch/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tuple/tuple.dart';

part 'github.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubEvent {
  GithubEventActor actor;
  String type;
  GithubEventRepo repo;
  String createdAt;
  Map<String, dynamic> payload;

  Tuple2<String, String> _repo;
  String get repoOwner {
    if (_repo == null) {
      _repo = parseRepositoryFullName(repo.name);
    }
    return _repo.item1;
  }

  String get repoName {
    if (_repo == null) {
      _repo = parseRepositoryFullName(repo.name);
    }
    return _repo.item2;
  }

  GithubEvent();

  factory GithubEvent.fromJson(Map<String, dynamic> json) =>
      _$GithubEventFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubEventActor {
  String login;
  String avatarUrl;

  GithubEventActor();

  factory GithubEventActor.fromJson(Map<String, dynamic> json) =>
      _$GithubEventActorFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubEventRepo {
  String name;

  GithubEventRepo();

  factory GithubEventRepo.fromJson(Map<String, dynamic> json) =>
      _$GithubEventRepoFromJson(json);
}

@JsonSerializable()
class GithubTrendingItem {
  String author;
  String name;
  String avatar;
  String description;
  String language;
  String languageColor;
  int stars;
  int forks;
  int currentPeriodStars;

  GithubTrendingItem();

  factory GithubTrendingItem.fromJson(Map<String, dynamic> json) =>
      _$GithubTrendingItemFromJson(json);
}
