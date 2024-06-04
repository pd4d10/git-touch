// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:gql_gitlab/project.ast.gql.dart' as _i5;
import 'package:gql_gitlab/project.data.gql.dart' as _i2;
import 'package:gql_gitlab/project.var.gql.dart' as _i3;
import 'package:gql_gitlab/serializers.gql.dart' as _i6;

part 'project.req.gql.g.dart';

abstract class GProjectReq
    implements
        Built<GProjectReq, GProjectReqBuilder>,
        _i1.OperationRequest<_i2.GProjectData, _i3.GProjectVars> {
  GProjectReq._();

  factory GProjectReq([Function(GProjectReqBuilder b) updates]) = _$GProjectReq;

  static void _initializeBuilder(GProjectReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'Project',
    )
    ..executeOnListen = true;
  @override
  _i3.GProjectVars get vars;
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
  _i2.GProjectData? Function(
    _i2.GProjectData?,
    _i2.GProjectData?,
  )? get updateResult;
  @override
  _i2.GProjectData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  _i2.GProjectData? parseData(Map<String, dynamic> json) =>
      _i2.GProjectData.fromJson(json);
  static Serializer<GProjectReq> get serializer => _$gProjectReqSerializer;
  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GProjectReq.serializer,
        this,
      ) as Map<String, dynamic>);
  static GProjectReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GProjectReq.serializer,
        json,
      );
}
