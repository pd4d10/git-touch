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
  GithubEventRelease release;
  String action;
  String ref;
  String refType;
  String before;
  String head;
  List<GithubEventCommit> commits;
  Map<String, dynamic> forkee;
  List<GithubPagesItem> pages;
  GithubSecurityItem securityAdvisory;
  GithubAlertItem alert;
  GithubProjectItem project;
  GithubProjectColumnItem projectColumn;
  GithubInstallationRepositoriesItem installation;
  GithubCheckrunItem checkRun;
  GithubCheckSuiteItem checkSuite;
  GithubContentReferenceItem contentReference;
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
  DateTime createdAt;

  bool get isPullRequestComment => pullRequest != null;

  GithubEventIssue();

  factory GithubEventIssue.fromJson(Map<String, dynamic> json) =>
      _$GithubEventIssueFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubEventComment {
  String body;
  GithubEventUser user;

  GithubEventComment();

  factory GithubEventComment.fromJson(Map<String, dynamic> json) =>
      _$GithubEventCommentFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubEventCommit {
  String sha;
  String message;

  GithubEventCommit();

  factory GithubEventCommit.fromJson(Map<String, dynamic> json) =>
      _$GithubEventCommitFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubEventRelease {
  String htmlUrl;
  String tagName;

  GithubEventRelease();

  factory GithubEventRelease.fromJson(Map<String, dynamic> json) =>
      _$GithubEventReleaseFromJson(json);
}

// Notification
@JsonSerializable(fieldRename: FieldRename.snake)
class GithubNotificationItem {
  String id;
  GithubNotificationItemSubject subject;
  DateTime updatedAt;
  GithubNotificationItemRepo repository;
  bool unread;

  @JsonKey(ignore: true)
  String state;

  String get key => '_$hashCode';

  GithubNotificationItem();

  factory GithubNotificationItem.fromJson(Map<String, dynamic> json) =>
      _$GithubNotificationItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubNotificationItemSubject {
  String title;
  String type;
  String url;

  int _number;
  int get number {
    if (_number == null) {
      _number = int.parse(url?.split('/')?.last ?? '0');
    }
    return _number;
  }

  GithubNotificationItemSubject();

  factory GithubNotificationItemSubject.fromJson(Map<String, dynamic> json) =>
      _$GithubNotificationItemSubjectFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubNotificationItemRepo {
  String fullName;

  Tuple2<String, String> _repo;
  String get owner {
    if (_repo == null) {
      _repo = parseRepositoryFullName(fullName);
    }
    return _repo.item1;
  }

  String get name {
    if (_repo == null) {
      _repo = parseRepositoryFullName(fullName);
    }
    return _repo.item2;
  }

  GithubNotificationItemRepo();

  factory GithubNotificationItemRepo.fromJson(Map<String, dynamic> json) =>
      _$GithubNotificationItemRepoFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubTreeItem {
  String name;
  String path;
  int size;
  String type;
  String downloadUrl;
  String content;
  GithubTreeItem();
  factory GithubTreeItem.fromJson(Map<String, dynamic> json) =>
      _$GithubTreeItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubPagesItem {
  String pageName;
  String title;
  String action;
  GithubPagesItem();
  factory GithubPagesItem.fromJson(Map<String, dynamic> json) =>
      _$GithubPagesItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubSecurityItem {
  String summary;
  String description;
  String severity;
  GithubSecurityItem();
  factory GithubSecurityItem.fromJson(Map<String, dynamic> json) =>
      _$GithubSecurityItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubAlertItem {
  String affectedPackageName;
  String affectedRange;
  GithubAlertItem();
  factory GithubAlertItem.fromJson(Map<String, dynamic> json) =>
      _$GithubAlertItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubProjectItem {
  String name;
  String state;
  String body;
  String htmlUrl;
  GithubProjectItem();
  factory GithubProjectItem.fromJson(Map<String, dynamic> json) =>
      _$GithubProjectItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubProjectColumnItem {
  String htmlUrl;
  String columnsUrl;
  String name;
  GithubProjectColumnItem();
  factory GithubProjectColumnItem.fromJson(Map<String, dynamic> json) =>
      _$GithubProjectColumnItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubInstallationRepositoriesItem {
  List<GithubNotificationItemRepo> repositoriesAdded, repositoriesRemoved;
  String repositoriesSelection;
  int id;
  GithubInstallationRepositoriesItem();
  factory GithubInstallationRepositoriesItem.fromJson(
          Map<String, dynamic> json) =>
      _$GithubInstallationRepositoriesItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubCheckrunItem {
  String status;
  String name;
  int id;
  GithubCheckrunItem();
  factory GithubCheckrunItem.fromJson(Map<String, dynamic> json) =>
      _$GithubCheckrunItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubCheckSuiteItem {
  String status;
  String conclusion;
  GithubCheckSuiteItem();
  factory GithubCheckSuiteItem.fromJson(Map<String, dynamic> json) =>
      _$GithubCheckSuiteItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GithubContentReferenceItem {
  int id;
  String reference;
  GithubContentReferenceItem();
  factory GithubContentReferenceItem.fromJson(Map<String, dynamic> json) =>
      _$GithubContentReferenceItemFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake) 
class GithubContributorItem {
  int id;
  String login;
  String avatarUrl;
  String htmlUrl;
  int contributions;
  GithubContributorItem();
  factory GithubContributorItem.fromJson(Map<String, dynamic> json) =>
    _$GithubContributorItemFromJson(json);
}

