// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:git_touch/graphql/serializers.gql.dart' as _i1;

part 'github.var.gql.g.dart';

abstract class GGistsVars implements Built<GGistsVars, GGistsVarsBuilder> {
  GGistsVars._();

  factory GGistsVars([Function(GGistsVarsBuilder b) updates]) = _$GGistsVars;

  String get login;
  String? get after;
  static Serializer<GGistsVars> get serializer => _$gGistsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGistsVars.serializer, this)
          as Map<String, dynamic>);
  static GGistsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGistsVars.serializer, json);
}

abstract class GGistVars implements Built<GGistVars, GGistVarsBuilder> {
  GGistVars._();

  factory GGistVars([Function(GGistVarsBuilder b) updates]) = _$GGistVars;

  String get login;
  String get name;
  static Serializer<GGistVars> get serializer => _$gGistVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GGistVars.serializer, this)
          as Map<String, dynamic>);
  static GGistVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GGistVars.serializer, json);
}

abstract class GFollowersVars
    implements Built<GFollowersVars, GFollowersVarsBuilder> {
  GFollowersVars._();

  factory GFollowersVars([Function(GFollowersVarsBuilder b) updates]) =
      _$GFollowersVars;

  String get login;
  String? get after;
  static Serializer<GFollowersVars> get serializer =>
      _$gFollowersVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GFollowersVars.serializer, this)
          as Map<String, dynamic>);
  static GFollowersVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFollowersVars.serializer, json);
}

abstract class GFollowingVars
    implements Built<GFollowingVars, GFollowingVarsBuilder> {
  GFollowingVars._();

  factory GFollowingVars([Function(GFollowingVarsBuilder b) updates]) =
      _$GFollowingVars;

  String get login;
  String? get after;
  static Serializer<GFollowingVars> get serializer =>
      _$gFollowingVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GFollowingVars.serializer, this)
          as Map<String, dynamic>);
  static GFollowingVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFollowingVars.serializer, json);
}

abstract class GMembersVars
    implements Built<GMembersVars, GMembersVarsBuilder> {
  GMembersVars._();

  factory GMembersVars([Function(GMembersVarsBuilder b) updates]) =
      _$GMembersVars;

  String get login;
  String? get after;
  static Serializer<GMembersVars> get serializer => _$gMembersVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GMembersVars.serializer, this)
          as Map<String, dynamic>);
  static GMembersVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GMembersVars.serializer, json);
}

abstract class GWatchersVars
    implements Built<GWatchersVars, GWatchersVarsBuilder> {
  GWatchersVars._();

  factory GWatchersVars([Function(GWatchersVarsBuilder b) updates]) =
      _$GWatchersVars;

  String get owner;
  String get name;
  String? get after;
  static Serializer<GWatchersVars> get serializer => _$gWatchersVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GWatchersVars.serializer, this)
          as Map<String, dynamic>);
  static GWatchersVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GWatchersVars.serializer, json);
}

abstract class GStargazersVars
    implements Built<GStargazersVars, GStargazersVarsBuilder> {
  GStargazersVars._();

  factory GStargazersVars([Function(GStargazersVarsBuilder b) updates]) =
      _$GStargazersVars;

  String get owner;
  String get name;
  String? get after;
  static Serializer<GStargazersVars> get serializer =>
      _$gStargazersVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GStargazersVars.serializer, this)
          as Map<String, dynamic>);
  static GStargazersVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStargazersVars.serializer, json);
}

abstract class GReposVars implements Built<GReposVars, GReposVarsBuilder> {
  GReposVars._();

  factory GReposVars([Function(GReposVarsBuilder b) updates]) = _$GReposVars;

  String get login;
  String? get after;
  static Serializer<GReposVars> get serializer => _$gReposVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReposVars.serializer, this)
          as Map<String, dynamic>);
  static GReposVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReposVars.serializer, json);
}

abstract class GStarsVars implements Built<GStarsVars, GStarsVarsBuilder> {
  GStarsVars._();

  factory GStarsVars([Function(GStarsVarsBuilder b) updates]) = _$GStarsVars;

  String get login;
  String? get after;
  static Serializer<GStarsVars> get serializer => _$gStarsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GStarsVars.serializer, this)
          as Map<String, dynamic>);
  static GStarsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GStarsVars.serializer, json);
}

abstract class GViewerVars implements Built<GViewerVars, GViewerVarsBuilder> {
  GViewerVars._();

  factory GViewerVars([Function(GViewerVarsBuilder b) updates]) = _$GViewerVars;

  static Serializer<GViewerVars> get serializer => _$gViewerVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GViewerVars.serializer, this)
          as Map<String, dynamic>);
  static GViewerVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GViewerVars.serializer, json);
}

abstract class GUserVars implements Built<GUserVars, GUserVarsBuilder> {
  GUserVars._();

  factory GUserVars([Function(GUserVarsBuilder b) updates]) = _$GUserVars;

  String get login;
  static Serializer<GUserVars> get serializer => _$gUserVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserVars.serializer, this)
          as Map<String, dynamic>);
  static GUserVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserVars.serializer, json);
}

abstract class GRepoVars implements Built<GRepoVars, GRepoVarsBuilder> {
  GRepoVars._();

  factory GRepoVars([Function(GRepoVarsBuilder b) updates]) = _$GRepoVars;

  String get owner;
  String get name;
  bool get branchSpecified;
  String get branch;
  static Serializer<GRepoVars> get serializer => _$gRepoVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRepoVars.serializer, this)
          as Map<String, dynamic>);
  static GRepoVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRepoVars.serializer, json);
}

abstract class GCommitsVars
    implements Built<GCommitsVars, GCommitsVarsBuilder> {
  GCommitsVars._();

  factory GCommitsVars([Function(GCommitsVarsBuilder b) updates]) =
      _$GCommitsVars;

  String get owner;
  String get name;
  String get ref;
  bool get hasRef;
  String? get after;
  static Serializer<GCommitsVars> get serializer => _$gCommitsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCommitsVars.serializer, this)
          as Map<String, dynamic>);
  static GCommitsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCommitsVars.serializer, json);
}

abstract class GIssuesVars implements Built<GIssuesVars, GIssuesVarsBuilder> {
  GIssuesVars._();

  factory GIssuesVars([Function(GIssuesVarsBuilder b) updates]) = _$GIssuesVars;

  String get owner;
  String get name;
  String? get cursor;
  static Serializer<GIssuesVars> get serializer => _$gIssuesVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GIssuesVars.serializer, this)
          as Map<String, dynamic>);
  static GIssuesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GIssuesVars.serializer, json);
}

abstract class GPullsVars implements Built<GPullsVars, GPullsVarsBuilder> {
  GPullsVars._();

  factory GPullsVars([Function(GPullsVarsBuilder b) updates]) = _$GPullsVars;

  String get owner;
  String get name;
  String? get cursor;
  static Serializer<GPullsVars> get serializer => _$gPullsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPullsVars.serializer, this)
          as Map<String, dynamic>);
  static GPullsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPullsVars.serializer, json);
}

abstract class GIssueVars implements Built<GIssueVars, GIssueVarsBuilder> {
  GIssueVars._();

  factory GIssueVars([Function(GIssueVarsBuilder b) updates]) = _$GIssueVars;

  String get owner;
  String get name;
  int get number;
  String? get cursor;
  static Serializer<GIssueVars> get serializer => _$gIssueVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GIssueVars.serializer, this)
          as Map<String, dynamic>);
  static GIssueVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GIssueVars.serializer, json);
}

abstract class GReleasesVars
    implements Built<GReleasesVars, GReleasesVarsBuilder> {
  GReleasesVars._();

  factory GReleasesVars([Function(GReleasesVarsBuilder b) updates]) =
      _$GReleasesVars;

  String get name;
  String get owner;
  String? get cursor;
  static Serializer<GReleasesVars> get serializer => _$gReleasesVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReleasesVars.serializer, this)
          as Map<String, dynamic>);
  static GReleasesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReleasesVars.serializer, json);
}

abstract class GPageInfoPartsVars
    implements Built<GPageInfoPartsVars, GPageInfoPartsVarsBuilder> {
  GPageInfoPartsVars._();

  factory GPageInfoPartsVars([Function(GPageInfoPartsVarsBuilder b) updates]) =
      _$GPageInfoPartsVars;

  static Serializer<GPageInfoPartsVars> get serializer =>
      _$gPageInfoPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPageInfoPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GPageInfoPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPageInfoPartsVars.serializer, json);
}

abstract class GRepoItemVars
    implements Built<GRepoItemVars, GRepoItemVarsBuilder> {
  GRepoItemVars._();

  factory GRepoItemVars([Function(GRepoItemVarsBuilder b) updates]) =
      _$GRepoItemVars;

  static Serializer<GRepoItemVars> get serializer => _$gRepoItemVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRepoItemVars.serializer, this)
          as Map<String, dynamic>);
  static GRepoItemVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRepoItemVars.serializer, json);
}

abstract class GUserItemVars
    implements Built<GUserItemVars, GUserItemVarsBuilder> {
  GUserItemVars._();

  factory GUserItemVars([Function(GUserItemVarsBuilder b) updates]) =
      _$GUserItemVars;

  static Serializer<GUserItemVars> get serializer => _$gUserItemVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserItemVars.serializer, this)
          as Map<String, dynamic>);
  static GUserItemVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserItemVars.serializer, json);
}

abstract class GReposRepoItemVars
    implements Built<GReposRepoItemVars, GReposRepoItemVarsBuilder> {
  GReposRepoItemVars._();

  factory GReposRepoItemVars([Function(GReposRepoItemVarsBuilder b) updates]) =
      _$GReposRepoItemVars;

  static Serializer<GReposRepoItemVars> get serializer =>
      _$gReposRepoItemVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReposRepoItemVars.serializer, this)
          as Map<String, dynamic>);
  static GReposRepoItemVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReposRepoItemVars.serializer, json);
}

abstract class GUserPartsVars
    implements Built<GUserPartsVars, GUserPartsVarsBuilder> {
  GUserPartsVars._();

  factory GUserPartsVars([Function(GUserPartsVarsBuilder b) updates]) =
      _$GUserPartsVars;

  static Serializer<GUserPartsVars> get serializer =>
      _$gUserPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUserPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GUserPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUserPartsVars.serializer, json);
}

abstract class GRepoCommitVars
    implements Built<GRepoCommitVars, GRepoCommitVarsBuilder> {
  GRepoCommitVars._();

  factory GRepoCommitVars([Function(GRepoCommitVarsBuilder b) updates]) =
      _$GRepoCommitVars;

  static Serializer<GRepoCommitVars> get serializer =>
      _$gRepoCommitVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRepoCommitVars.serializer, this)
          as Map<String, dynamic>);
  static GRepoCommitVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRepoCommitVars.serializer, json);
}

abstract class GRepoRefVars
    implements Built<GRepoRefVars, GRepoRefVarsBuilder> {
  GRepoRefVars._();

  factory GRepoRefVars([Function(GRepoRefVarsBuilder b) updates]) =
      _$GRepoRefVars;

  static Serializer<GRepoRefVars> get serializer => _$gRepoRefVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRepoRefVars.serializer, this)
          as Map<String, dynamic>);
  static GRepoRefVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRepoRefVars.serializer, json);
}

abstract class GCommitsRefCommitVars
    implements Built<GCommitsRefCommitVars, GCommitsRefCommitVarsBuilder> {
  GCommitsRefCommitVars._();

  factory GCommitsRefCommitVars(
          [Function(GCommitsRefCommitVarsBuilder b) updates]) =
      _$GCommitsRefCommitVars;

  String? get after;
  static Serializer<GCommitsRefCommitVars> get serializer =>
      _$gCommitsRefCommitVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCommitsRefCommitVars.serializer, this)
          as Map<String, dynamic>);
  static GCommitsRefCommitVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCommitsRefCommitVars.serializer, json);
}

abstract class GCommitsRefVars
    implements Built<GCommitsRefVars, GCommitsRefVarsBuilder> {
  GCommitsRefVars._();

  factory GCommitsRefVars([Function(GCommitsRefVarsBuilder b) updates]) =
      _$GCommitsRefVars;

  String? get after;
  static Serializer<GCommitsRefVars> get serializer =>
      _$gCommitsRefVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCommitsRefVars.serializer, this)
          as Map<String, dynamic>);
  static GCommitsRefVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCommitsRefVars.serializer, json);
}

abstract class GCommentPartsVars
    implements Built<GCommentPartsVars, GCommentPartsVarsBuilder> {
  GCommentPartsVars._();

  factory GCommentPartsVars([Function(GCommentPartsVarsBuilder b) updates]) =
      _$GCommentPartsVars;

  static Serializer<GCommentPartsVars> get serializer =>
      _$gCommentPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCommentPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GCommentPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCommentPartsVars.serializer, json);
}

abstract class GReactionConnectionPartsVars
    implements
        Built<GReactionConnectionPartsVars,
            GReactionConnectionPartsVarsBuilder> {
  GReactionConnectionPartsVars._();

  factory GReactionConnectionPartsVars(
          [Function(GReactionConnectionPartsVarsBuilder b) updates]) =
      _$GReactionConnectionPartsVars;

  static Serializer<GReactionConnectionPartsVars> get serializer =>
      _$gReactionConnectionPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GReactionConnectionPartsVars.serializer, this) as Map<String, dynamic>);
  static GReactionConnectionPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GReactionConnectionPartsVars.serializer, json);
}

abstract class GReactablePartsVars
    implements Built<GReactablePartsVars, GReactablePartsVarsBuilder> {
  GReactablePartsVars._();

  factory GReactablePartsVars(
      [Function(GReactablePartsVarsBuilder b) updates]) = _$GReactablePartsVars;

  static Serializer<GReactablePartsVars> get serializer =>
      _$gReactablePartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReactablePartsVars.serializer, this)
          as Map<String, dynamic>);
  static GReactablePartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReactablePartsVars.serializer, json);
}

abstract class GReferencedEventPartsVars
    implements
        Built<GReferencedEventPartsVars, GReferencedEventPartsVarsBuilder> {
  GReferencedEventPartsVars._();

  factory GReferencedEventPartsVars(
          [Function(GReferencedEventPartsVarsBuilder b) updates]) =
      _$GReferencedEventPartsVars;

  static Serializer<GReferencedEventPartsVars> get serializer =>
      _$gReferencedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReferencedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GReferencedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GReferencedEventPartsVars.serializer, json);
}

abstract class GRenamedTitleEventPartsVars
    implements
        Built<GRenamedTitleEventPartsVars, GRenamedTitleEventPartsVarsBuilder> {
  GRenamedTitleEventPartsVars._();

  factory GRenamedTitleEventPartsVars(
          [Function(GRenamedTitleEventPartsVarsBuilder b) updates]) =
      _$GRenamedTitleEventPartsVars;

  static Serializer<GRenamedTitleEventPartsVars> get serializer =>
      _$gRenamedTitleEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GRenamedTitleEventPartsVars.serializer, this) as Map<String, dynamic>);
  static GRenamedTitleEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GRenamedTitleEventPartsVars.serializer, json);
}

abstract class GClosedEventPartsVars
    implements Built<GClosedEventPartsVars, GClosedEventPartsVarsBuilder> {
  GClosedEventPartsVars._();

  factory GClosedEventPartsVars(
          [Function(GClosedEventPartsVarsBuilder b) updates]) =
      _$GClosedEventPartsVars;

  static Serializer<GClosedEventPartsVars> get serializer =>
      _$gClosedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GClosedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GClosedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GClosedEventPartsVars.serializer, json);
}

abstract class GReopenedEventPartsVars
    implements Built<GReopenedEventPartsVars, GReopenedEventPartsVarsBuilder> {
  GReopenedEventPartsVars._();

  factory GReopenedEventPartsVars(
          [Function(GReopenedEventPartsVarsBuilder b) updates]) =
      _$GReopenedEventPartsVars;

  static Serializer<GReopenedEventPartsVars> get serializer =>
      _$gReopenedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GReopenedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GReopenedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GReopenedEventPartsVars.serializer, json);
}

abstract class GCrossReferencedEventPartsVars
    implements
        Built<GCrossReferencedEventPartsVars,
            GCrossReferencedEventPartsVarsBuilder> {
  GCrossReferencedEventPartsVars._();

  factory GCrossReferencedEventPartsVars(
          [Function(GCrossReferencedEventPartsVarsBuilder b) updates]) =
      _$GCrossReferencedEventPartsVars;

  static Serializer<GCrossReferencedEventPartsVars> get serializer =>
      _$gCrossReferencedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GCrossReferencedEventPartsVars.serializer, this) as Map<String, dynamic>);
  static GCrossReferencedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GCrossReferencedEventPartsVars.serializer, json);
}

abstract class GLabeledEventPartsVars
    implements Built<GLabeledEventPartsVars, GLabeledEventPartsVarsBuilder> {
  GLabeledEventPartsVars._();

  factory GLabeledEventPartsVars(
          [Function(GLabeledEventPartsVarsBuilder b) updates]) =
      _$GLabeledEventPartsVars;

  static Serializer<GLabeledEventPartsVars> get serializer =>
      _$gLabeledEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLabeledEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GLabeledEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLabeledEventPartsVars.serializer, json);
}

abstract class GUnlabeledEventPartsVars
    implements
        Built<GUnlabeledEventPartsVars, GUnlabeledEventPartsVarsBuilder> {
  GUnlabeledEventPartsVars._();

  factory GUnlabeledEventPartsVars(
          [Function(GUnlabeledEventPartsVarsBuilder b) updates]) =
      _$GUnlabeledEventPartsVars;

  static Serializer<GUnlabeledEventPartsVars> get serializer =>
      _$gUnlabeledEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUnlabeledEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GUnlabeledEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUnlabeledEventPartsVars.serializer, json);
}

abstract class GMilestonedEventPartsVars
    implements
        Built<GMilestonedEventPartsVars, GMilestonedEventPartsVarsBuilder> {
  GMilestonedEventPartsVars._();

  factory GMilestonedEventPartsVars(
          [Function(GMilestonedEventPartsVarsBuilder b) updates]) =
      _$GMilestonedEventPartsVars;

  static Serializer<GMilestonedEventPartsVars> get serializer =>
      _$gMilestonedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GMilestonedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GMilestonedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GMilestonedEventPartsVars.serializer, json);
}

abstract class GDemilestonedEventPartsVars
    implements
        Built<GDemilestonedEventPartsVars, GDemilestonedEventPartsVarsBuilder> {
  GDemilestonedEventPartsVars._();

  factory GDemilestonedEventPartsVars(
          [Function(GDemilestonedEventPartsVarsBuilder b) updates]) =
      _$GDemilestonedEventPartsVars;

  static Serializer<GDemilestonedEventPartsVars> get serializer =>
      _$gDemilestonedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GDemilestonedEventPartsVars.serializer, this) as Map<String, dynamic>);
  static GDemilestonedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GDemilestonedEventPartsVars.serializer, json);
}

abstract class GLockedEventPartsVars
    implements Built<GLockedEventPartsVars, GLockedEventPartsVarsBuilder> {
  GLockedEventPartsVars._();

  factory GLockedEventPartsVars(
          [Function(GLockedEventPartsVarsBuilder b) updates]) =
      _$GLockedEventPartsVars;

  static Serializer<GLockedEventPartsVars> get serializer =>
      _$gLockedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GLockedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GLockedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLockedEventPartsVars.serializer, json);
}

abstract class GUnlockedEventPartsVars
    implements Built<GUnlockedEventPartsVars, GUnlockedEventPartsVarsBuilder> {
  GUnlockedEventPartsVars._();

  factory GUnlockedEventPartsVars(
          [Function(GUnlockedEventPartsVarsBuilder b) updates]) =
      _$GUnlockedEventPartsVars;

  static Serializer<GUnlockedEventPartsVars> get serializer =>
      _$gUnlockedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUnlockedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GUnlockedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GUnlockedEventPartsVars.serializer, json);
}

abstract class GAssignedEventPartsVars
    implements Built<GAssignedEventPartsVars, GAssignedEventPartsVarsBuilder> {
  GAssignedEventPartsVars._();

  factory GAssignedEventPartsVars(
          [Function(GAssignedEventPartsVarsBuilder b) updates]) =
      _$GAssignedEventPartsVars;

  static Serializer<GAssignedEventPartsVars> get serializer =>
      _$gAssignedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAssignedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GAssignedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAssignedEventPartsVars.serializer, json);
}

abstract class GUnassignedEventPartsVars
    implements
        Built<GUnassignedEventPartsVars, GUnassignedEventPartsVarsBuilder> {
  GUnassignedEventPartsVars._();

  factory GUnassignedEventPartsVars(
          [Function(GUnassignedEventPartsVarsBuilder b) updates]) =
      _$GUnassignedEventPartsVars;

  static Serializer<GUnassignedEventPartsVars> get serializer =>
      _$gUnassignedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GUnassignedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GUnassignedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUnassignedEventPartsVars.serializer, json);
}

abstract class GSubscribedEventPartsVars
    implements
        Built<GSubscribedEventPartsVars, GSubscribedEventPartsVarsBuilder> {
  GSubscribedEventPartsVars._();

  factory GSubscribedEventPartsVars(
          [Function(GSubscribedEventPartsVarsBuilder b) updates]) =
      _$GSubscribedEventPartsVars;

  static Serializer<GSubscribedEventPartsVars> get serializer =>
      _$gSubscribedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GSubscribedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GSubscribedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GSubscribedEventPartsVars.serializer, json);
}

abstract class GUnsubscribedEventPartsVars
    implements
        Built<GUnsubscribedEventPartsVars, GUnsubscribedEventPartsVarsBuilder> {
  GUnsubscribedEventPartsVars._();

  factory GUnsubscribedEventPartsVars(
          [Function(GUnsubscribedEventPartsVarsBuilder b) updates]) =
      _$GUnsubscribedEventPartsVars;

  static Serializer<GUnsubscribedEventPartsVars> get serializer =>
      _$gUnsubscribedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GUnsubscribedEventPartsVars.serializer, this) as Map<String, dynamic>);
  static GUnsubscribedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GUnsubscribedEventPartsVars.serializer, json);
}

abstract class GMentionedEventPartsVars
    implements
        Built<GMentionedEventPartsVars, GMentionedEventPartsVarsBuilder> {
  GMentionedEventPartsVars._();

  factory GMentionedEventPartsVars(
          [Function(GMentionedEventPartsVarsBuilder b) updates]) =
      _$GMentionedEventPartsVars;

  static Serializer<GMentionedEventPartsVars> get serializer =>
      _$gMentionedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GMentionedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GMentionedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GMentionedEventPartsVars.serializer, json);
}

abstract class GPinnedEventPartsVars
    implements Built<GPinnedEventPartsVars, GPinnedEventPartsVarsBuilder> {
  GPinnedEventPartsVars._();

  factory GPinnedEventPartsVars(
          [Function(GPinnedEventPartsVarsBuilder b) updates]) =
      _$GPinnedEventPartsVars;

  static Serializer<GPinnedEventPartsVars> get serializer =>
      _$gPinnedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GPinnedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GPinnedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GPinnedEventPartsVars.serializer, json);
}

abstract class GTransferredEventPartsVars
    implements
        Built<GTransferredEventPartsVars, GTransferredEventPartsVarsBuilder> {
  GTransferredEventPartsVars._();

  factory GTransferredEventPartsVars(
          [Function(GTransferredEventPartsVarsBuilder b) updates]) =
      _$GTransferredEventPartsVars;

  static Serializer<GTransferredEventPartsVars> get serializer =>
      _$gTransferredEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GTransferredEventPartsVars.serializer, this) as Map<String, dynamic>);
  static GTransferredEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GTransferredEventPartsVars.serializer, json);
}

abstract class GPullRequestCommitPartsVars
    implements
        Built<GPullRequestCommitPartsVars, GPullRequestCommitPartsVarsBuilder> {
  GPullRequestCommitPartsVars._();

  factory GPullRequestCommitPartsVars(
          [Function(GPullRequestCommitPartsVarsBuilder b) updates]) =
      _$GPullRequestCommitPartsVars;

  static Serializer<GPullRequestCommitPartsVars> get serializer =>
      _$gPullRequestCommitPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GPullRequestCommitPartsVars.serializer, this) as Map<String, dynamic>);
  static GPullRequestCommitPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GPullRequestCommitPartsVars.serializer, json);
}

abstract class GDeployedEventPartsVars
    implements Built<GDeployedEventPartsVars, GDeployedEventPartsVarsBuilder> {
  GDeployedEventPartsVars._();

  factory GDeployedEventPartsVars(
          [Function(GDeployedEventPartsVarsBuilder b) updates]) =
      _$GDeployedEventPartsVars;

  static Serializer<GDeployedEventPartsVars> get serializer =>
      _$gDeployedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GDeployedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GDeployedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GDeployedEventPartsVars.serializer, json);
}

abstract class GDeploymentEnvironmentChangedEventPartsVars
    implements
        Built<GDeploymentEnvironmentChangedEventPartsVars,
            GDeploymentEnvironmentChangedEventPartsVarsBuilder> {
  GDeploymentEnvironmentChangedEventPartsVars._();

  factory GDeploymentEnvironmentChangedEventPartsVars(
      [Function(GDeploymentEnvironmentChangedEventPartsVarsBuilder b)
          updates]) = _$GDeploymentEnvironmentChangedEventPartsVars;

  static Serializer<GDeploymentEnvironmentChangedEventPartsVars>
      get serializer => _$gDeploymentEnvironmentChangedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GDeploymentEnvironmentChangedEventPartsVars.serializer, this)
      as Map<String, dynamic>);
  static GDeploymentEnvironmentChangedEventPartsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GDeploymentEnvironmentChangedEventPartsVars.serializer, json);
}

abstract class GHeadRefRestoredEventPartsVars
    implements
        Built<GHeadRefRestoredEventPartsVars,
            GHeadRefRestoredEventPartsVarsBuilder> {
  GHeadRefRestoredEventPartsVars._();

  factory GHeadRefRestoredEventPartsVars(
          [Function(GHeadRefRestoredEventPartsVarsBuilder b) updates]) =
      _$GHeadRefRestoredEventPartsVars;

  static Serializer<GHeadRefRestoredEventPartsVars> get serializer =>
      _$gHeadRefRestoredEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GHeadRefRestoredEventPartsVars.serializer, this) as Map<String, dynamic>);
  static GHeadRefRestoredEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeadRefRestoredEventPartsVars.serializer, json);
}

abstract class GBaseRefForcePushedEventPartsVars
    implements
        Built<GBaseRefForcePushedEventPartsVars,
            GBaseRefForcePushedEventPartsVarsBuilder> {
  GBaseRefForcePushedEventPartsVars._();

  factory GBaseRefForcePushedEventPartsVars(
          [Function(GBaseRefForcePushedEventPartsVarsBuilder b) updates]) =
      _$GBaseRefForcePushedEventPartsVars;

  static Serializer<GBaseRefForcePushedEventPartsVars> get serializer =>
      _$gBaseRefForcePushedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GBaseRefForcePushedEventPartsVars.serializer, this)
      as Map<String, dynamic>);
  static GBaseRefForcePushedEventPartsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GBaseRefForcePushedEventPartsVars.serializer, json);
}

abstract class GHeadRefForcePushedEventPartsVars
    implements
        Built<GHeadRefForcePushedEventPartsVars,
            GHeadRefForcePushedEventPartsVarsBuilder> {
  GHeadRefForcePushedEventPartsVars._();

  factory GHeadRefForcePushedEventPartsVars(
          [Function(GHeadRefForcePushedEventPartsVarsBuilder b) updates]) =
      _$GHeadRefForcePushedEventPartsVars;

  static Serializer<GHeadRefForcePushedEventPartsVars> get serializer =>
      _$gHeadRefForcePushedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GHeadRefForcePushedEventPartsVars.serializer, this)
      as Map<String, dynamic>);
  static GHeadRefForcePushedEventPartsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeadRefForcePushedEventPartsVars.serializer, json);
}

abstract class GReviewRequestedEventPartsVars
    implements
        Built<GReviewRequestedEventPartsVars,
            GReviewRequestedEventPartsVarsBuilder> {
  GReviewRequestedEventPartsVars._();

  factory GReviewRequestedEventPartsVars(
          [Function(GReviewRequestedEventPartsVarsBuilder b) updates]) =
      _$GReviewRequestedEventPartsVars;

  static Serializer<GReviewRequestedEventPartsVars> get serializer =>
      _$gReviewRequestedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GReviewRequestedEventPartsVars.serializer, this) as Map<String, dynamic>);
  static GReviewRequestedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GReviewRequestedEventPartsVars.serializer, json);
}

abstract class GReviewRequestRemovedEventPartsVars
    implements
        Built<GReviewRequestRemovedEventPartsVars,
            GReviewRequestRemovedEventPartsVarsBuilder> {
  GReviewRequestRemovedEventPartsVars._();

  factory GReviewRequestRemovedEventPartsVars(
          [Function(GReviewRequestRemovedEventPartsVarsBuilder b) updates]) =
      _$GReviewRequestRemovedEventPartsVars;

  static Serializer<GReviewRequestRemovedEventPartsVars> get serializer =>
      _$gReviewRequestRemovedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GReviewRequestRemovedEventPartsVars.serializer, this)
      as Map<String, dynamic>);
  static GReviewRequestRemovedEventPartsVars? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GReviewRequestRemovedEventPartsVars.serializer, json);
}

abstract class GReviewDismissedEventPartsVars
    implements
        Built<GReviewDismissedEventPartsVars,
            GReviewDismissedEventPartsVarsBuilder> {
  GReviewDismissedEventPartsVars._();

  factory GReviewDismissedEventPartsVars(
          [Function(GReviewDismissedEventPartsVarsBuilder b) updates]) =
      _$GReviewDismissedEventPartsVars;

  static Serializer<GReviewDismissedEventPartsVars> get serializer =>
      _$gReviewDismissedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GReviewDismissedEventPartsVars.serializer, this) as Map<String, dynamic>);
  static GReviewDismissedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GReviewDismissedEventPartsVars.serializer, json);
}

abstract class GPullRequestReviewPartsVars
    implements
        Built<GPullRequestReviewPartsVars, GPullRequestReviewPartsVarsBuilder> {
  GPullRequestReviewPartsVars._();

  factory GPullRequestReviewPartsVars(
          [Function(GPullRequestReviewPartsVarsBuilder b) updates]) =
      _$GPullRequestReviewPartsVars;

  static Serializer<GPullRequestReviewPartsVars> get serializer =>
      _$gPullRequestReviewPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GPullRequestReviewPartsVars.serializer, this) as Map<String, dynamic>);
  static GPullRequestReviewPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GPullRequestReviewPartsVars.serializer, json);
}

abstract class GMergedEventPartsVars
    implements Built<GMergedEventPartsVars, GMergedEventPartsVarsBuilder> {
  GMergedEventPartsVars._();

  factory GMergedEventPartsVars(
          [Function(GMergedEventPartsVarsBuilder b) updates]) =
      _$GMergedEventPartsVars;

  static Serializer<GMergedEventPartsVars> get serializer =>
      _$gMergedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GMergedEventPartsVars.serializer, this)
          as Map<String, dynamic>);
  static GMergedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GMergedEventPartsVars.serializer, json);
}

abstract class GHeadRefDeletedEventPartsVars
    implements
        Built<GHeadRefDeletedEventPartsVars,
            GHeadRefDeletedEventPartsVarsBuilder> {
  GHeadRefDeletedEventPartsVars._();

  factory GHeadRefDeletedEventPartsVars(
          [Function(GHeadRefDeletedEventPartsVarsBuilder b) updates]) =
      _$GHeadRefDeletedEventPartsVars;

  static Serializer<GHeadRefDeletedEventPartsVars> get serializer =>
      _$gHeadRefDeletedEventPartsVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GHeadRefDeletedEventPartsVars.serializer, this) as Map<String, dynamic>);
  static GHeadRefDeletedEventPartsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeadRefDeletedEventPartsVars.serializer, json);
}
