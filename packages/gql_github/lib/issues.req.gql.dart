// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_github/issues.ast.gql.dart' as _i5;
import 'package:gql_github/issues.data.gql.dart' as _i2;
import 'package:gql_github/issues.var.gql.dart' as _i3;
import 'package:gql_github/serializers.gql.dart' as _i6;

part 'issues.req.gql.g.dart';

abstract class GIssuesReq
    implements
        Built<GIssuesReq, GIssuesReqBuilder>,
        _i1.OperationRequest<_i2.GIssuesData, _i3.GIssuesVars> {
  GIssuesReq._();

  factory GIssuesReq([Function(GIssuesReqBuilder b) updates]) = _$GIssuesReq;

  static void _initializeBuilder(GIssuesReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Issues',
    )
    ..executeOnListen = true;
  @override
  _i3.GIssuesVars get vars;
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
  _i2.GIssuesData? Function(
    _i2.GIssuesData?,
    _i2.GIssuesData?,
  )? get updateResult;
  @override
  _i2.GIssuesData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GIssuesData? parseData(Map<String, dynamic> json) =>
      _i2.GIssuesData.fromJson(json);
  static Serializer<GIssuesReq> get serializer => _$gIssuesReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GIssuesReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssuesReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GIssuesReq.serializer,
        json,
      );
}

abstract class GPullsReq
    implements
        Built<GPullsReq, GPullsReqBuilder>,
        _i1.OperationRequest<_i2.GPullsData, _i3.GPullsVars> {
  GPullsReq._();

  factory GPullsReq([Function(GPullsReqBuilder b) updates]) = _$GPullsReq;

  static void _initializeBuilder(GPullsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Pulls',
    )
    ..executeOnListen = true;
  @override
  _i3.GPullsVars get vars;
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
  _i2.GPullsData? Function(
    _i2.GPullsData?,
    _i2.GPullsData?,
  )? get updateResult;
  @override
  _i2.GPullsData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GPullsData? parseData(Map<String, dynamic> json) =>
      _i2.GPullsData.fromJson(json);
  static Serializer<GPullsReq> get serializer => _$gPullsReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPullsReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPullsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPullsReq.serializer,
        json,
      );
}
