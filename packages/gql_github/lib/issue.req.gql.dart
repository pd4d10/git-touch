// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql/ast.dart' as _i7;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/issue.ast.gql.dart' as _i5;
import 'package:gql_github/issue.data.gql.dart' as _i2;
import 'package:gql_github/issue.var.gql.dart' as _i3;
import 'package:gql_github/serializers.gql.dart' as _i6;

part 'issue.req.gql.g.dart';

abstract class GIssueReq
    implements
        Built<GIssueReq, GIssueReqBuilder>,
        _i1.OperationRequest<_i2.GIssueData, _i3.GIssueVars> {
  GIssueReq._();

  factory GIssueReq([Function(GIssueReqBuilder b) updates]) = _$GIssueReq;

  static void _initializeBuilder(GIssueReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Issue',
    )
    ..executeOnListen = true;
  @override
  _i3.GIssueVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
      );
  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: true)
  _i2.GIssueData? Function(
    _i2.GIssueData?,
    _i2.GIssueData?,
  )? get updateResult;
  @override
  _i2.GIssueData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GIssueData? parseData(Map<String, dynamic> json) =>
      _i2.GIssueData.fromJson(json);
  static Serializer<GIssueReq> get serializer => _$gIssueReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GIssueReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GIssueReq.serializer,
        json,
      );
}

abstract class GCommentPartsReq
    implements
        Built<GCommentPartsReq, GCommentPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GCommentPartsData, _i3.GCommentPartsVars> {
  GCommentPartsReq._();

  factory GCommentPartsReq([Function(GCommentPartsReqBuilder b) updates]) =
      _$GCommentPartsReq;

  static void _initializeBuilder(GCommentPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'CommentParts';
  @override
  _i3.GCommentPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GCommentPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GCommentPartsData.fromJson(json);
  static Serializer<GCommentPartsReq> get serializer =>
      _$gCommentPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCommentPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCommentPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCommentPartsReq.serializer,
        json,
      );
}

abstract class GReactionConnectionPartsReq
    implements
        Built<GReactionConnectionPartsReq, GReactionConnectionPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReactionConnectionPartsData,
            _i3.GReactionConnectionPartsVars> {
  GReactionConnectionPartsReq._();

  factory GReactionConnectionPartsReq(
          [Function(GReactionConnectionPartsReqBuilder b) updates]) =
      _$GReactionConnectionPartsReq;

  static void _initializeBuilder(GReactionConnectionPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReactionConnectionParts';
  @override
  _i3.GReactionConnectionPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GReactionConnectionPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GReactionConnectionPartsData.fromJson(json);
  static Serializer<GReactionConnectionPartsReq> get serializer =>
      _$gReactionConnectionPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReactionConnectionPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReactionConnectionPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReactionConnectionPartsReq.serializer,
        json,
      );
}

abstract class GReactablePartsReq
    implements
        Built<GReactablePartsReq, GReactablePartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReactablePartsData, _i3.GReactablePartsVars> {
  GReactablePartsReq._();

  factory GReactablePartsReq([Function(GReactablePartsReqBuilder b) updates]) =
      _$GReactablePartsReq;

  static void _initializeBuilder(GReactablePartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReactableParts';
  @override
  _i3.GReactablePartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GReactablePartsData? parseData(Map<String, dynamic> json) =>
      _i2.GReactablePartsData.fromJson(json);
  static Serializer<GReactablePartsReq> get serializer =>
      _$gReactablePartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReactablePartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReactablePartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReactablePartsReq.serializer,
        json,
      );
}

abstract class GReferencedEventPartsReq
    implements
        Built<GReferencedEventPartsReq, GReferencedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReferencedEventPartsData,
            _i3.GReferencedEventPartsVars> {
  GReferencedEventPartsReq._();

  factory GReferencedEventPartsReq(
          [Function(GReferencedEventPartsReqBuilder b) updates]) =
      _$GReferencedEventPartsReq;

  static void _initializeBuilder(GReferencedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReferencedEventParts';
  @override
  _i3.GReferencedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GReferencedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GReferencedEventPartsData.fromJson(json);
  static Serializer<GReferencedEventPartsReq> get serializer =>
      _$gReferencedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReferencedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReferencedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReferencedEventPartsReq.serializer,
        json,
      );
}

abstract class GRenamedTitleEventPartsReq
    implements
        Built<GRenamedTitleEventPartsReq, GRenamedTitleEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GRenamedTitleEventPartsData,
            _i3.GRenamedTitleEventPartsVars> {
  GRenamedTitleEventPartsReq._();

  factory GRenamedTitleEventPartsReq(
          [Function(GRenamedTitleEventPartsReqBuilder b) updates]) =
      _$GRenamedTitleEventPartsReq;

  static void _initializeBuilder(GRenamedTitleEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'RenamedTitleEventParts';
  @override
  _i3.GRenamedTitleEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GRenamedTitleEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GRenamedTitleEventPartsData.fromJson(json);
  static Serializer<GRenamedTitleEventPartsReq> get serializer =>
      _$gRenamedTitleEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GRenamedTitleEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRenamedTitleEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GRenamedTitleEventPartsReq.serializer,
        json,
      );
}

abstract class GClosedEventPartsReq
    implements
        Built<GClosedEventPartsReq, GClosedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GClosedEventPartsData,
            _i3.GClosedEventPartsVars> {
  GClosedEventPartsReq._();

  factory GClosedEventPartsReq(
          [Function(GClosedEventPartsReqBuilder b) updates]) =
      _$GClosedEventPartsReq;

  static void _initializeBuilder(GClosedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ClosedEventParts';
  @override
  _i3.GClosedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GClosedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GClosedEventPartsData.fromJson(json);
  static Serializer<GClosedEventPartsReq> get serializer =>
      _$gClosedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GClosedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GClosedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GClosedEventPartsReq.serializer,
        json,
      );
}

abstract class GReopenedEventPartsReq
    implements
        Built<GReopenedEventPartsReq, GReopenedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReopenedEventPartsData,
            _i3.GReopenedEventPartsVars> {
  GReopenedEventPartsReq._();

  factory GReopenedEventPartsReq(
          [Function(GReopenedEventPartsReqBuilder b) updates]) =
      _$GReopenedEventPartsReq;

  static void _initializeBuilder(GReopenedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReopenedEventParts';
  @override
  _i3.GReopenedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GReopenedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GReopenedEventPartsData.fromJson(json);
  static Serializer<GReopenedEventPartsReq> get serializer =>
      _$gReopenedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReopenedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReopenedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReopenedEventPartsReq.serializer,
        json,
      );
}

abstract class GCrossReferencedEventPartsReq
    implements
        Built<GCrossReferencedEventPartsReq,
            GCrossReferencedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GCrossReferencedEventPartsData,
            _i3.GCrossReferencedEventPartsVars> {
  GCrossReferencedEventPartsReq._();

  factory GCrossReferencedEventPartsReq(
          [Function(GCrossReferencedEventPartsReqBuilder b) updates]) =
      _$GCrossReferencedEventPartsReq;

  static void _initializeBuilder(GCrossReferencedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'CrossReferencedEventParts';
  @override
  _i3.GCrossReferencedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GCrossReferencedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GCrossReferencedEventPartsData.fromJson(json);
  static Serializer<GCrossReferencedEventPartsReq> get serializer =>
      _$gCrossReferencedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GCrossReferencedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCrossReferencedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GCrossReferencedEventPartsReq.serializer,
        json,
      );
}

abstract class GLabeledEventPartsReq
    implements
        Built<GLabeledEventPartsReq, GLabeledEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GLabeledEventPartsData,
            _i3.GLabeledEventPartsVars> {
  GLabeledEventPartsReq._();

  factory GLabeledEventPartsReq(
          [Function(GLabeledEventPartsReqBuilder b) updates]) =
      _$GLabeledEventPartsReq;

  static void _initializeBuilder(GLabeledEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'LabeledEventParts';
  @override
  _i3.GLabeledEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GLabeledEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GLabeledEventPartsData.fromJson(json);
  static Serializer<GLabeledEventPartsReq> get serializer =>
      _$gLabeledEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GLabeledEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLabeledEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GLabeledEventPartsReq.serializer,
        json,
      );
}

abstract class GUnlabeledEventPartsReq
    implements
        Built<GUnlabeledEventPartsReq, GUnlabeledEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GUnlabeledEventPartsData,
            _i3.GUnlabeledEventPartsVars> {
  GUnlabeledEventPartsReq._();

  factory GUnlabeledEventPartsReq(
          [Function(GUnlabeledEventPartsReqBuilder b) updates]) =
      _$GUnlabeledEventPartsReq;

  static void _initializeBuilder(GUnlabeledEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UnlabeledEventParts';
  @override
  _i3.GUnlabeledEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GUnlabeledEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GUnlabeledEventPartsData.fromJson(json);
  static Serializer<GUnlabeledEventPartsReq> get serializer =>
      _$gUnlabeledEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUnlabeledEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnlabeledEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUnlabeledEventPartsReq.serializer,
        json,
      );
}

abstract class GMilestonedEventPartsReq
    implements
        Built<GMilestonedEventPartsReq, GMilestonedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GMilestonedEventPartsData,
            _i3.GMilestonedEventPartsVars> {
  GMilestonedEventPartsReq._();

  factory GMilestonedEventPartsReq(
          [Function(GMilestonedEventPartsReqBuilder b) updates]) =
      _$GMilestonedEventPartsReq;

  static void _initializeBuilder(GMilestonedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'MilestonedEventParts';
  @override
  _i3.GMilestonedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GMilestonedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GMilestonedEventPartsData.fromJson(json);
  static Serializer<GMilestonedEventPartsReq> get serializer =>
      _$gMilestonedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMilestonedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMilestonedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMilestonedEventPartsReq.serializer,
        json,
      );
}

abstract class GDemilestonedEventPartsReq
    implements
        Built<GDemilestonedEventPartsReq, GDemilestonedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GDemilestonedEventPartsData,
            _i3.GDemilestonedEventPartsVars> {
  GDemilestonedEventPartsReq._();

  factory GDemilestonedEventPartsReq(
          [Function(GDemilestonedEventPartsReqBuilder b) updates]) =
      _$GDemilestonedEventPartsReq;

  static void _initializeBuilder(GDemilestonedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'DemilestonedEventParts';
  @override
  _i3.GDemilestonedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GDemilestonedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GDemilestonedEventPartsData.fromJson(json);
  static Serializer<GDemilestonedEventPartsReq> get serializer =>
      _$gDemilestonedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDemilestonedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDemilestonedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDemilestonedEventPartsReq.serializer,
        json,
      );
}

abstract class GLockedEventPartsReq
    implements
        Built<GLockedEventPartsReq, GLockedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GLockedEventPartsData,
            _i3.GLockedEventPartsVars> {
  GLockedEventPartsReq._();

  factory GLockedEventPartsReq(
          [Function(GLockedEventPartsReqBuilder b) updates]) =
      _$GLockedEventPartsReq;

  static void _initializeBuilder(GLockedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'LockedEventParts';
  @override
  _i3.GLockedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GLockedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GLockedEventPartsData.fromJson(json);
  static Serializer<GLockedEventPartsReq> get serializer =>
      _$gLockedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GLockedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLockedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GLockedEventPartsReq.serializer,
        json,
      );
}

abstract class GUnlockedEventPartsReq
    implements
        Built<GUnlockedEventPartsReq, GUnlockedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GUnlockedEventPartsData,
            _i3.GUnlockedEventPartsVars> {
  GUnlockedEventPartsReq._();

  factory GUnlockedEventPartsReq(
          [Function(GUnlockedEventPartsReqBuilder b) updates]) =
      _$GUnlockedEventPartsReq;

  static void _initializeBuilder(GUnlockedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UnlockedEventParts';
  @override
  _i3.GUnlockedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GUnlockedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GUnlockedEventPartsData.fromJson(json);
  static Serializer<GUnlockedEventPartsReq> get serializer =>
      _$gUnlockedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUnlockedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnlockedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUnlockedEventPartsReq.serializer,
        json,
      );
}

abstract class GAssignedEventPartsReq
    implements
        Built<GAssignedEventPartsReq, GAssignedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GAssignedEventPartsData,
            _i3.GAssignedEventPartsVars> {
  GAssignedEventPartsReq._();

  factory GAssignedEventPartsReq(
          [Function(GAssignedEventPartsReqBuilder b) updates]) =
      _$GAssignedEventPartsReq;

  static void _initializeBuilder(GAssignedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'AssignedEventParts';
  @override
  _i3.GAssignedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GAssignedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GAssignedEventPartsData.fromJson(json);
  static Serializer<GAssignedEventPartsReq> get serializer =>
      _$gAssignedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAssignedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAssignedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAssignedEventPartsReq.serializer,
        json,
      );
}

abstract class GUnassignedEventPartsReq
    implements
        Built<GUnassignedEventPartsReq, GUnassignedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GUnassignedEventPartsData,
            _i3.GUnassignedEventPartsVars> {
  GUnassignedEventPartsReq._();

  factory GUnassignedEventPartsReq(
          [Function(GUnassignedEventPartsReqBuilder b) updates]) =
      _$GUnassignedEventPartsReq;

  static void _initializeBuilder(GUnassignedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UnassignedEventParts';
  @override
  _i3.GUnassignedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GUnassignedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GUnassignedEventPartsData.fromJson(json);
  static Serializer<GUnassignedEventPartsReq> get serializer =>
      _$gUnassignedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUnassignedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnassignedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUnassignedEventPartsReq.serializer,
        json,
      );
}

abstract class GSubscribedEventPartsReq
    implements
        Built<GSubscribedEventPartsReq, GSubscribedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GSubscribedEventPartsData,
            _i3.GSubscribedEventPartsVars> {
  GSubscribedEventPartsReq._();

  factory GSubscribedEventPartsReq(
          [Function(GSubscribedEventPartsReqBuilder b) updates]) =
      _$GSubscribedEventPartsReq;

  static void _initializeBuilder(GSubscribedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'SubscribedEventParts';
  @override
  _i3.GSubscribedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GSubscribedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GSubscribedEventPartsData.fromJson(json);
  static Serializer<GSubscribedEventPartsReq> get serializer =>
      _$gSubscribedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GSubscribedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSubscribedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GSubscribedEventPartsReq.serializer,
        json,
      );
}

abstract class GUnsubscribedEventPartsReq
    implements
        Built<GUnsubscribedEventPartsReq, GUnsubscribedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GUnsubscribedEventPartsData,
            _i3.GUnsubscribedEventPartsVars> {
  GUnsubscribedEventPartsReq._();

  factory GUnsubscribedEventPartsReq(
          [Function(GUnsubscribedEventPartsReqBuilder b) updates]) =
      _$GUnsubscribedEventPartsReq;

  static void _initializeBuilder(GUnsubscribedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'UnsubscribedEventParts';
  @override
  _i3.GUnsubscribedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GUnsubscribedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GUnsubscribedEventPartsData.fromJson(json);
  static Serializer<GUnsubscribedEventPartsReq> get serializer =>
      _$gUnsubscribedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GUnsubscribedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUnsubscribedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GUnsubscribedEventPartsReq.serializer,
        json,
      );
}

abstract class GMentionedEventPartsReq
    implements
        Built<GMentionedEventPartsReq, GMentionedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GMentionedEventPartsData,
            _i3.GMentionedEventPartsVars> {
  GMentionedEventPartsReq._();

  factory GMentionedEventPartsReq(
          [Function(GMentionedEventPartsReqBuilder b) updates]) =
      _$GMentionedEventPartsReq;

  static void _initializeBuilder(GMentionedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'MentionedEventParts';
  @override
  _i3.GMentionedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GMentionedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GMentionedEventPartsData.fromJson(json);
  static Serializer<GMentionedEventPartsReq> get serializer =>
      _$gMentionedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMentionedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMentionedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMentionedEventPartsReq.serializer,
        json,
      );
}

abstract class GPinnedEventPartsReq
    implements
        Built<GPinnedEventPartsReq, GPinnedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GPinnedEventPartsData,
            _i3.GPinnedEventPartsVars> {
  GPinnedEventPartsReq._();

  factory GPinnedEventPartsReq(
          [Function(GPinnedEventPartsReqBuilder b) updates]) =
      _$GPinnedEventPartsReq;

  static void _initializeBuilder(GPinnedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'PinnedEventParts';
  @override
  _i3.GPinnedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GPinnedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GPinnedEventPartsData.fromJson(json);
  static Serializer<GPinnedEventPartsReq> get serializer =>
      _$gPinnedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPinnedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPinnedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPinnedEventPartsReq.serializer,
        json,
      );
}

abstract class GTransferredEventPartsReq
    implements
        Built<GTransferredEventPartsReq, GTransferredEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GTransferredEventPartsData,
            _i3.GTransferredEventPartsVars> {
  GTransferredEventPartsReq._();

  factory GTransferredEventPartsReq(
          [Function(GTransferredEventPartsReqBuilder b) updates]) =
      _$GTransferredEventPartsReq;

  static void _initializeBuilder(GTransferredEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'TransferredEventParts';
  @override
  _i3.GTransferredEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GTransferredEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GTransferredEventPartsData.fromJson(json);
  static Serializer<GTransferredEventPartsReq> get serializer =>
      _$gTransferredEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GTransferredEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTransferredEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GTransferredEventPartsReq.serializer,
        json,
      );
}

abstract class GPullRequestCommitPartsReq
    implements
        Built<GPullRequestCommitPartsReq, GPullRequestCommitPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GPullRequestCommitPartsData,
            _i3.GPullRequestCommitPartsVars> {
  GPullRequestCommitPartsReq._();

  factory GPullRequestCommitPartsReq(
          [Function(GPullRequestCommitPartsReqBuilder b) updates]) =
      _$GPullRequestCommitPartsReq;

  static void _initializeBuilder(GPullRequestCommitPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'PullRequestCommitParts';
  @override
  _i3.GPullRequestCommitPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GPullRequestCommitPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GPullRequestCommitPartsData.fromJson(json);
  static Serializer<GPullRequestCommitPartsReq> get serializer =>
      _$gPullRequestCommitPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPullRequestCommitPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPullRequestCommitPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPullRequestCommitPartsReq.serializer,
        json,
      );
}

abstract class GDeployedEventPartsReq
    implements
        Built<GDeployedEventPartsReq, GDeployedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GDeployedEventPartsData,
            _i3.GDeployedEventPartsVars> {
  GDeployedEventPartsReq._();

  factory GDeployedEventPartsReq(
          [Function(GDeployedEventPartsReqBuilder b) updates]) =
      _$GDeployedEventPartsReq;

  static void _initializeBuilder(GDeployedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'DeployedEventParts';
  @override
  _i3.GDeployedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GDeployedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GDeployedEventPartsData.fromJson(json);
  static Serializer<GDeployedEventPartsReq> get serializer =>
      _$gDeployedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDeployedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeployedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDeployedEventPartsReq.serializer,
        json,
      );
}

abstract class GDeploymentEnvironmentChangedEventPartsReq
    implements
        Built<GDeploymentEnvironmentChangedEventPartsReq,
            GDeploymentEnvironmentChangedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GDeploymentEnvironmentChangedEventPartsData,
            _i3.GDeploymentEnvironmentChangedEventPartsVars> {
  GDeploymentEnvironmentChangedEventPartsReq._();

  factory GDeploymentEnvironmentChangedEventPartsReq(
      [Function(GDeploymentEnvironmentChangedEventPartsReqBuilder b)
          updates]) = _$GDeploymentEnvironmentChangedEventPartsReq;

  static void _initializeBuilder(
          GDeploymentEnvironmentChangedEventPartsReqBuilder b) =>
      b
        ..document = _i5.document
        ..fragmentName = 'DeploymentEnvironmentChangedEventParts';
  @override
  _i3.GDeploymentEnvironmentChangedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GDeploymentEnvironmentChangedEventPartsData? parseData(
          Map<String, dynamic> json) =>
      _i2.GDeploymentEnvironmentChangedEventPartsData.fromJson(json);
  static Serializer<GDeploymentEnvironmentChangedEventPartsReq>
      get serializer => _$gDeploymentEnvironmentChangedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GDeploymentEnvironmentChangedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeploymentEnvironmentChangedEventPartsReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GDeploymentEnvironmentChangedEventPartsReq.serializer,
        json,
      );
}

abstract class GHeadRefRestoredEventPartsReq
    implements
        Built<GHeadRefRestoredEventPartsReq,
            GHeadRefRestoredEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GHeadRefRestoredEventPartsData,
            _i3.GHeadRefRestoredEventPartsVars> {
  GHeadRefRestoredEventPartsReq._();

  factory GHeadRefRestoredEventPartsReq(
          [Function(GHeadRefRestoredEventPartsReqBuilder b) updates]) =
      _$GHeadRefRestoredEventPartsReq;

  static void _initializeBuilder(GHeadRefRestoredEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'HeadRefRestoredEventParts';
  @override
  _i3.GHeadRefRestoredEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GHeadRefRestoredEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GHeadRefRestoredEventPartsData.fromJson(json);
  static Serializer<GHeadRefRestoredEventPartsReq> get serializer =>
      _$gHeadRefRestoredEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GHeadRefRestoredEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeadRefRestoredEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GHeadRefRestoredEventPartsReq.serializer,
        json,
      );
}

abstract class GBaseRefForcePushedEventPartsReq
    implements
        Built<GBaseRefForcePushedEventPartsReq,
            GBaseRefForcePushedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GBaseRefForcePushedEventPartsData,
            _i3.GBaseRefForcePushedEventPartsVars> {
  GBaseRefForcePushedEventPartsReq._();

  factory GBaseRefForcePushedEventPartsReq(
          [Function(GBaseRefForcePushedEventPartsReqBuilder b) updates]) =
      _$GBaseRefForcePushedEventPartsReq;

  static void _initializeBuilder(GBaseRefForcePushedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'BaseRefForcePushedEventParts';
  @override
  _i3.GBaseRefForcePushedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GBaseRefForcePushedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GBaseRefForcePushedEventPartsData.fromJson(json);
  static Serializer<GBaseRefForcePushedEventPartsReq> get serializer =>
      _$gBaseRefForcePushedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GBaseRefForcePushedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBaseRefForcePushedEventPartsReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GBaseRefForcePushedEventPartsReq.serializer,
        json,
      );
}

abstract class GHeadRefForcePushedEventPartsReq
    implements
        Built<GHeadRefForcePushedEventPartsReq,
            GHeadRefForcePushedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GHeadRefForcePushedEventPartsData,
            _i3.GHeadRefForcePushedEventPartsVars> {
  GHeadRefForcePushedEventPartsReq._();

  factory GHeadRefForcePushedEventPartsReq(
          [Function(GHeadRefForcePushedEventPartsReqBuilder b) updates]) =
      _$GHeadRefForcePushedEventPartsReq;

  static void _initializeBuilder(GHeadRefForcePushedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'HeadRefForcePushedEventParts';
  @override
  _i3.GHeadRefForcePushedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GHeadRefForcePushedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GHeadRefForcePushedEventPartsData.fromJson(json);
  static Serializer<GHeadRefForcePushedEventPartsReq> get serializer =>
      _$gHeadRefForcePushedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GHeadRefForcePushedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeadRefForcePushedEventPartsReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GHeadRefForcePushedEventPartsReq.serializer,
        json,
      );
}

abstract class GReviewRequestedEventPartsReq
    implements
        Built<GReviewRequestedEventPartsReq,
            GReviewRequestedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReviewRequestedEventPartsData,
            _i3.GReviewRequestedEventPartsVars> {
  GReviewRequestedEventPartsReq._();

  factory GReviewRequestedEventPartsReq(
          [Function(GReviewRequestedEventPartsReqBuilder b) updates]) =
      _$GReviewRequestedEventPartsReq;

  static void _initializeBuilder(GReviewRequestedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReviewRequestedEventParts';
  @override
  _i3.GReviewRequestedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GReviewRequestedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GReviewRequestedEventPartsData.fromJson(json);
  static Serializer<GReviewRequestedEventPartsReq> get serializer =>
      _$gReviewRequestedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReviewRequestedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewRequestedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReviewRequestedEventPartsReq.serializer,
        json,
      );
}

abstract class GReviewRequestRemovedEventPartsReq
    implements
        Built<GReviewRequestRemovedEventPartsReq,
            GReviewRequestRemovedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReviewRequestRemovedEventPartsData,
            _i3.GReviewRequestRemovedEventPartsVars> {
  GReviewRequestRemovedEventPartsReq._();

  factory GReviewRequestRemovedEventPartsReq(
          [Function(GReviewRequestRemovedEventPartsReqBuilder b) updates]) =
      _$GReviewRequestRemovedEventPartsReq;

  static void _initializeBuilder(GReviewRequestRemovedEventPartsReqBuilder b) =>
      b
        ..document = _i5.document
        ..fragmentName = 'ReviewRequestRemovedEventParts';
  @override
  _i3.GReviewRequestRemovedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GReviewRequestRemovedEventPartsData? parseData(
          Map<String, dynamic> json) =>
      _i2.GReviewRequestRemovedEventPartsData.fromJson(json);
  static Serializer<GReviewRequestRemovedEventPartsReq> get serializer =>
      _$gReviewRequestRemovedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReviewRequestRemovedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewRequestRemovedEventPartsReq? fromJson(
          Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReviewRequestRemovedEventPartsReq.serializer,
        json,
      );
}

abstract class GReviewDismissedEventPartsReq
    implements
        Built<GReviewDismissedEventPartsReq,
            GReviewDismissedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GReviewDismissedEventPartsData,
            _i3.GReviewDismissedEventPartsVars> {
  GReviewDismissedEventPartsReq._();

  factory GReviewDismissedEventPartsReq(
          [Function(GReviewDismissedEventPartsReqBuilder b) updates]) =
      _$GReviewDismissedEventPartsReq;

  static void _initializeBuilder(GReviewDismissedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'ReviewDismissedEventParts';
  @override
  _i3.GReviewDismissedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GReviewDismissedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GReviewDismissedEventPartsData.fromJson(json);
  static Serializer<GReviewDismissedEventPartsReq> get serializer =>
      _$gReviewDismissedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GReviewDismissedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReviewDismissedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GReviewDismissedEventPartsReq.serializer,
        json,
      );
}

abstract class GPullRequestReviewPartsReq
    implements
        Built<GPullRequestReviewPartsReq, GPullRequestReviewPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GPullRequestReviewPartsData,
            _i3.GPullRequestReviewPartsVars> {
  GPullRequestReviewPartsReq._();

  factory GPullRequestReviewPartsReq(
          [Function(GPullRequestReviewPartsReqBuilder b) updates]) =
      _$GPullRequestReviewPartsReq;

  static void _initializeBuilder(GPullRequestReviewPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'PullRequestReviewParts';
  @override
  _i3.GPullRequestReviewPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GPullRequestReviewPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GPullRequestReviewPartsData.fromJson(json);
  static Serializer<GPullRequestReviewPartsReq> get serializer =>
      _$gPullRequestReviewPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPullRequestReviewPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPullRequestReviewPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPullRequestReviewPartsReq.serializer,
        json,
      );
}

abstract class GMergedEventPartsReq
    implements
        Built<GMergedEventPartsReq, GMergedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GMergedEventPartsData,
            _i3.GMergedEventPartsVars> {
  GMergedEventPartsReq._();

  factory GMergedEventPartsReq(
          [Function(GMergedEventPartsReqBuilder b) updates]) =
      _$GMergedEventPartsReq;

  static void _initializeBuilder(GMergedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'MergedEventParts';
  @override
  _i3.GMergedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GMergedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GMergedEventPartsData.fromJson(json);
  static Serializer<GMergedEventPartsReq> get serializer =>
      _$gMergedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GMergedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GMergedEventPartsReq.serializer,
        json,
      );
}

abstract class GHeadRefDeletedEventPartsReq
    implements
        Built<GHeadRefDeletedEventPartsReq,
            GHeadRefDeletedEventPartsReqBuilder>,
        _i1.FragmentRequest<_i2.GHeadRefDeletedEventPartsData,
            _i3.GHeadRefDeletedEventPartsVars> {
  GHeadRefDeletedEventPartsReq._();

  factory GHeadRefDeletedEventPartsReq(
          [Function(GHeadRefDeletedEventPartsReqBuilder b) updates]) =
      _$GHeadRefDeletedEventPartsReq;

  static void _initializeBuilder(GHeadRefDeletedEventPartsReqBuilder b) => b
    ..document = _i5.document
    ..fragmentName = 'HeadRefDeletedEventParts';
  @override
  _i3.GHeadRefDeletedEventPartsVars get vars;
  @override
  _i7.DocumentNode get document;
  @override
  String? get fragmentName;
  @override
  Map<String, dynamic> get idFields;
  @override
  _i2.GHeadRefDeletedEventPartsData? parseData(Map<String, dynamic> json) =>
      _i2.GHeadRefDeletedEventPartsData.fromJson(json);
  static Serializer<GHeadRefDeletedEventPartsReq> get serializer =>
      _$gHeadRefDeletedEventPartsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GHeadRefDeletedEventPartsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHeadRefDeletedEventPartsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GHeadRefDeletedEventPartsReq.serializer,
        json,
      );
}
