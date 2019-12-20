import 'package:git_touch/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tuple/tuple.dart';

part 'github.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubEvent {
  GithubEventUser actor;
  String type;
  GithubEventRepo repo;
  DateTime createdAt;
  GithubEventPayload payload;

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
class GithubEventUser {
  String login;
  String avatarUrl;

  GithubEventUser();

  factory GithubEventUser.fromJson(Map<String, dynamic> json) =>
      _$GithubEventUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubEventRepo {
  String name;

  GithubEventRepo();

  factory GithubEventRepo.fromJson(Map<String, dynamic> json) =>
      _$GithubEventRepoFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubEventPayload {
  GithubEventIssue issue;
  GithubEventIssue pullRequest;
  GithubEventComment comment;
  String action;
  String ref;
  String before;
  String head;
  List<GithubEventCommit> commits;
  Map<String, dynamic> forkee;

  GithubEventPayload();

  factory GithubEventPayload.fromJson(Map<String, dynamic> json) =>
      _$GithubEventPayloadFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubEventIssue {
  String title;
  GithubEventUser user;
  int number;
  String body;
  dynamic pullRequest;
  String state;
  int comments;
  bool merged;

  bool get isPullRequestComment => pullRequest != null;

  GithubEventIssue();

  factory GithubEventIssue.fromJson(Map<String, dynamic> json) =>
      _$GithubEventIssueFromJson(json);
}

@JsonSerializable()
class GithubEventComment {
  String body;
  GithubEventUser user;

  GithubEventComment();

  factory GithubEventComment.fromJson(Map<String, dynamic> json) =>
      _$GithubEventCommentFromJson(json);
}

@JsonSerializable()
class GithubEventCommit {
  String sha;
  String message;

  GithubEventCommit();

  factory GithubEventCommit.fromJson(Map<String, dynamic> json) =>
      _$GithubEventCommitFromJson(json);
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
