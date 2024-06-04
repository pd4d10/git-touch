// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i2;
import 'package:gql_gitlab/serializers.gql.dart' as _i1;

part 'schema.schema.gql.g.dart';

class GAccessLevelEnum extends EnumClass {
  const GAccessLevelEnum._(String name) : super(name);

  static const GAccessLevelEnum NO_ACCESS = _$gAccessLevelEnumNO_ACCESS;

  static const GAccessLevelEnum MINIMAL_ACCESS =
      _$gAccessLevelEnumMINIMAL_ACCESS;

  static const GAccessLevelEnum GUEST = _$gAccessLevelEnumGUEST;

  static const GAccessLevelEnum REPORTER = _$gAccessLevelEnumREPORTER;

  static const GAccessLevelEnum DEVELOPER = _$gAccessLevelEnumDEVELOPER;

  static const GAccessLevelEnum MAINTAINER = _$gAccessLevelEnumMAINTAINER;

  static const GAccessLevelEnum OWNER = _$gAccessLevelEnumOWNER;

  static Serializer<GAccessLevelEnum> get serializer =>
      _$gAccessLevelEnumSerializer;
  static BuiltSet<GAccessLevelEnum> get values => _$gAccessLevelEnumValues;
  static GAccessLevelEnum valueOf(String name) =>
      _$gAccessLevelEnumValueOf(name);
}

abstract class GAddProjectToSecurityDashboardInput
    implements
        Built<GAddProjectToSecurityDashboardInput,
            GAddProjectToSecurityDashboardInputBuilder> {
  GAddProjectToSecurityDashboardInput._();

  factory GAddProjectToSecurityDashboardInput(
          [Function(GAddProjectToSecurityDashboardInputBuilder b) updates]) =
      _$GAddProjectToSecurityDashboardInput;

  String? get clientMutationId;
  GProjectID get id;
  static Serializer<GAddProjectToSecurityDashboardInput> get serializer =>
      _$gAddProjectToSecurityDashboardInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAddProjectToSecurityDashboardInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddProjectToSecurityDashboardInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAddProjectToSecurityDashboardInput.serializer,
        json,
      );
}

abstract class GAdminSidekiqQueuesDeleteJobsInput
    implements
        Built<GAdminSidekiqQueuesDeleteJobsInput,
            GAdminSidekiqQueuesDeleteJobsInputBuilder> {
  GAdminSidekiqQueuesDeleteJobsInput._();

  factory GAdminSidekiqQueuesDeleteJobsInput(
          [Function(GAdminSidekiqQueuesDeleteJobsInputBuilder b) updates]) =
      _$GAdminSidekiqQueuesDeleteJobsInput;

  String? get clientMutationId;
  String? get user;
  String? get project;
  String? get rootNamespace;
  String? get clientId;
  String? get callerId;
  String? get remoteIp;
  String? get jobId;
  String? get pipelineId;
  String? get relatedClass;
  String? get featureCategory;
  String? get artifactSize;
  String? get artifactUsedCdn;
  String? get artifactsDependenciesSize;
  String? get artifactsDependenciesCount;
  String? get rootCallerId;
  String? get subscriptionPlan;
  String? get workerClass;
  String get queueName;
  static Serializer<GAdminSidekiqQueuesDeleteJobsInput> get serializer =>
      _$gAdminSidekiqQueuesDeleteJobsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAdminSidekiqQueuesDeleteJobsInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAdminSidekiqQueuesDeleteJobsInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAdminSidekiqQueuesDeleteJobsInput.serializer,
        json,
      );
}

class GAgentTokenStatus extends EnumClass {
  const GAgentTokenStatus._(String name) : super(name);

  static const GAgentTokenStatus ACTIVE = _$gAgentTokenStatusACTIVE;

  static const GAgentTokenStatus REVOKED = _$gAgentTokenStatusREVOKED;

  static Serializer<GAgentTokenStatus> get serializer =>
      _$gAgentTokenStatusSerializer;
  static BuiltSet<GAgentTokenStatus> get values => _$gAgentTokenStatusValues;
  static GAgentTokenStatus valueOf(String name) =>
      _$gAgentTokenStatusValueOf(name);
}

class GAlertManagementAlertSort extends EnumClass {
  const GAlertManagementAlertSort._(String name) : super(name);

  static const GAlertManagementAlertSort STARTED_AT_ASC =
      _$gAlertManagementAlertSortSTARTED_AT_ASC;

  static const GAlertManagementAlertSort STARTED_AT_DESC =
      _$gAlertManagementAlertSortSTARTED_AT_DESC;

  static const GAlertManagementAlertSort ENDED_AT_ASC =
      _$gAlertManagementAlertSortENDED_AT_ASC;

  static const GAlertManagementAlertSort ENDED_AT_DESC =
      _$gAlertManagementAlertSortENDED_AT_DESC;

  static const GAlertManagementAlertSort CREATED_TIME_ASC =
      _$gAlertManagementAlertSortCREATED_TIME_ASC;

  static const GAlertManagementAlertSort CREATED_TIME_DESC =
      _$gAlertManagementAlertSortCREATED_TIME_DESC;

  static const GAlertManagementAlertSort UPDATED_TIME_ASC =
      _$gAlertManagementAlertSortUPDATED_TIME_ASC;

  static const GAlertManagementAlertSort UPDATED_TIME_DESC =
      _$gAlertManagementAlertSortUPDATED_TIME_DESC;

  static const GAlertManagementAlertSort EVENT_COUNT_ASC =
      _$gAlertManagementAlertSortEVENT_COUNT_ASC;

  static const GAlertManagementAlertSort EVENT_COUNT_DESC =
      _$gAlertManagementAlertSortEVENT_COUNT_DESC;

  static const GAlertManagementAlertSort SEVERITY_ASC =
      _$gAlertManagementAlertSortSEVERITY_ASC;

  static const GAlertManagementAlertSort SEVERITY_DESC =
      _$gAlertManagementAlertSortSEVERITY_DESC;

  static const GAlertManagementAlertSort STATUS_ASC =
      _$gAlertManagementAlertSortSTATUS_ASC;

  static const GAlertManagementAlertSort STATUS_DESC =
      _$gAlertManagementAlertSortSTATUS_DESC;

  static const GAlertManagementAlertSort updated_desc =
      _$gAlertManagementAlertSortupdated_desc;

  static const GAlertManagementAlertSort updated_asc =
      _$gAlertManagementAlertSortupdated_asc;

  static const GAlertManagementAlertSort created_desc =
      _$gAlertManagementAlertSortcreated_desc;

  static const GAlertManagementAlertSort created_asc =
      _$gAlertManagementAlertSortcreated_asc;

  static const GAlertManagementAlertSort UPDATED_DESC =
      _$gAlertManagementAlertSortUPDATED_DESC;

  static const GAlertManagementAlertSort UPDATED_ASC =
      _$gAlertManagementAlertSortUPDATED_ASC;

  static const GAlertManagementAlertSort CREATED_DESC =
      _$gAlertManagementAlertSortCREATED_DESC;

  static const GAlertManagementAlertSort CREATED_ASC =
      _$gAlertManagementAlertSortCREATED_ASC;

  static Serializer<GAlertManagementAlertSort> get serializer =>
      _$gAlertManagementAlertSortSerializer;
  static BuiltSet<GAlertManagementAlertSort> get values =>
      _$gAlertManagementAlertSortValues;
  static GAlertManagementAlertSort valueOf(String name) =>
      _$gAlertManagementAlertSortValueOf(name);
}

class GAlertManagementDomainFilter extends EnumClass {
  const GAlertManagementDomainFilter._(String name) : super(name);

  static const GAlertManagementDomainFilter operations =
      _$gAlertManagementDomainFilteroperations;

  static const GAlertManagementDomainFilter threat_monitoring =
      _$gAlertManagementDomainFilterthreat_monitoring;

  static Serializer<GAlertManagementDomainFilter> get serializer =>
      _$gAlertManagementDomainFilterSerializer;
  static BuiltSet<GAlertManagementDomainFilter> get values =>
      _$gAlertManagementDomainFilterValues;
  static GAlertManagementDomainFilter valueOf(String name) =>
      _$gAlertManagementDomainFilterValueOf(name);
}

abstract class GAlertManagementHttpIntegrationID
    implements
        Built<GAlertManagementHttpIntegrationID,
            GAlertManagementHttpIntegrationIDBuilder> {
  GAlertManagementHttpIntegrationID._();

  factory GAlertManagementHttpIntegrationID([String? value]) =>
      _$GAlertManagementHttpIntegrationID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GAlertManagementHttpIntegrationID> get serializer =>
      _i2.DefaultScalarSerializer<GAlertManagementHttpIntegrationID>(
          (Object serialized) =>
              GAlertManagementHttpIntegrationID((serialized as String?)));
}

class GAlertManagementIntegrationType extends EnumClass {
  const GAlertManagementIntegrationType._(String name) : super(name);

  static const GAlertManagementIntegrationType PROMETHEUS =
      _$gAlertManagementIntegrationTypePROMETHEUS;

  static const GAlertManagementIntegrationType HTTP =
      _$gAlertManagementIntegrationTypeHTTP;

  static Serializer<GAlertManagementIntegrationType> get serializer =>
      _$gAlertManagementIntegrationTypeSerializer;
  static BuiltSet<GAlertManagementIntegrationType> get values =>
      _$gAlertManagementIntegrationTypeValues;
  static GAlertManagementIntegrationType valueOf(String name) =>
      _$gAlertManagementIntegrationTypeValueOf(name);
}

abstract class GAlertManagementPayloadAlertFieldInput
    implements
        Built<GAlertManagementPayloadAlertFieldInput,
            GAlertManagementPayloadAlertFieldInputBuilder> {
  GAlertManagementPayloadAlertFieldInput._();

  factory GAlertManagementPayloadAlertFieldInput(
          [Function(GAlertManagementPayloadAlertFieldInputBuilder b) updates]) =
      _$GAlertManagementPayloadAlertFieldInput;

  GAlertManagementPayloadAlertFieldName get fieldName;
  BuiltList<GPayloadAlertFieldPathSegment> get path;
  String? get label;
  GAlertManagementPayloadAlertFieldType get type;
  static Serializer<GAlertManagementPayloadAlertFieldInput> get serializer =>
      _$gAlertManagementPayloadAlertFieldInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlertManagementPayloadAlertFieldInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlertManagementPayloadAlertFieldInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlertManagementPayloadAlertFieldInput.serializer,
        json,
      );
}

class GAlertManagementPayloadAlertFieldName extends EnumClass {
  const GAlertManagementPayloadAlertFieldName._(String name) : super(name);

  static const GAlertManagementPayloadAlertFieldName TITLE =
      _$gAlertManagementPayloadAlertFieldNameTITLE;

  static const GAlertManagementPayloadAlertFieldName DESCRIPTION =
      _$gAlertManagementPayloadAlertFieldNameDESCRIPTION;

  static const GAlertManagementPayloadAlertFieldName START_TIME =
      _$gAlertManagementPayloadAlertFieldNameSTART_TIME;

  static const GAlertManagementPayloadAlertFieldName END_TIME =
      _$gAlertManagementPayloadAlertFieldNameEND_TIME;

  static const GAlertManagementPayloadAlertFieldName SERVICE =
      _$gAlertManagementPayloadAlertFieldNameSERVICE;

  static const GAlertManagementPayloadAlertFieldName MONITORING_TOOL =
      _$gAlertManagementPayloadAlertFieldNameMONITORING_TOOL;

  static const GAlertManagementPayloadAlertFieldName HOSTS =
      _$gAlertManagementPayloadAlertFieldNameHOSTS;

  static const GAlertManagementPayloadAlertFieldName SEVERITY =
      _$gAlertManagementPayloadAlertFieldNameSEVERITY;

  static const GAlertManagementPayloadAlertFieldName FINGERPRINT =
      _$gAlertManagementPayloadAlertFieldNameFINGERPRINT;

  static const GAlertManagementPayloadAlertFieldName GITLAB_ENVIRONMENT_NAME =
      _$gAlertManagementPayloadAlertFieldNameGITLAB_ENVIRONMENT_NAME;

  static Serializer<GAlertManagementPayloadAlertFieldName> get serializer =>
      _$gAlertManagementPayloadAlertFieldNameSerializer;
  static BuiltSet<GAlertManagementPayloadAlertFieldName> get values =>
      _$gAlertManagementPayloadAlertFieldNameValues;
  static GAlertManagementPayloadAlertFieldName valueOf(String name) =>
      _$gAlertManagementPayloadAlertFieldNameValueOf(name);
}

class GAlertManagementPayloadAlertFieldType extends EnumClass {
  const GAlertManagementPayloadAlertFieldType._(String name) : super(name);

  static const GAlertManagementPayloadAlertFieldType ARRAY =
      _$gAlertManagementPayloadAlertFieldTypeARRAY;

  static const GAlertManagementPayloadAlertFieldType DATETIME =
      _$gAlertManagementPayloadAlertFieldTypeDATETIME;

  static const GAlertManagementPayloadAlertFieldType STRING =
      _$gAlertManagementPayloadAlertFieldTypeSTRING;

  static Serializer<GAlertManagementPayloadAlertFieldType> get serializer =>
      _$gAlertManagementPayloadAlertFieldTypeSerializer;
  static BuiltSet<GAlertManagementPayloadAlertFieldType> get values =>
      _$gAlertManagementPayloadAlertFieldTypeValues;
  static GAlertManagementPayloadAlertFieldType valueOf(String name) =>
      _$gAlertManagementPayloadAlertFieldTypeValueOf(name);
}

class GAlertManagementSeverity extends EnumClass {
  const GAlertManagementSeverity._(String name) : super(name);

  static const GAlertManagementSeverity CRITICAL =
      _$gAlertManagementSeverityCRITICAL;

  static const GAlertManagementSeverity HIGH = _$gAlertManagementSeverityHIGH;

  static const GAlertManagementSeverity MEDIUM =
      _$gAlertManagementSeverityMEDIUM;

  static const GAlertManagementSeverity LOW = _$gAlertManagementSeverityLOW;

  static const GAlertManagementSeverity INFO = _$gAlertManagementSeverityINFO;

  static const GAlertManagementSeverity UNKNOWN =
      _$gAlertManagementSeverityUNKNOWN;

  static Serializer<GAlertManagementSeverity> get serializer =>
      _$gAlertManagementSeveritySerializer;
  static BuiltSet<GAlertManagementSeverity> get values =>
      _$gAlertManagementSeverityValues;
  static GAlertManagementSeverity valueOf(String name) =>
      _$gAlertManagementSeverityValueOf(name);
}

class GAlertManagementStatus extends EnumClass {
  const GAlertManagementStatus._(String name) : super(name);

  static const GAlertManagementStatus TRIGGERED =
      _$gAlertManagementStatusTRIGGERED;

  static const GAlertManagementStatus ACKNOWLEDGED =
      _$gAlertManagementStatusACKNOWLEDGED;

  static const GAlertManagementStatus RESOLVED =
      _$gAlertManagementStatusRESOLVED;

  static const GAlertManagementStatus IGNORED = _$gAlertManagementStatusIGNORED;

  static Serializer<GAlertManagementStatus> get serializer =>
      _$gAlertManagementStatusSerializer;
  static BuiltSet<GAlertManagementStatus> get values =>
      _$gAlertManagementStatusValues;
  static GAlertManagementStatus valueOf(String name) =>
      _$gAlertManagementStatusValueOf(name);
}

abstract class GAlertSetAssigneesInput
    implements Built<GAlertSetAssigneesInput, GAlertSetAssigneesInputBuilder> {
  GAlertSetAssigneesInput._();

  factory GAlertSetAssigneesInput(
          [Function(GAlertSetAssigneesInputBuilder b) updates]) =
      _$GAlertSetAssigneesInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  BuiltList<String> get assigneeUsernames;
  GMutationOperationMode? get operationMode;
  static Serializer<GAlertSetAssigneesInput> get serializer =>
      _$gAlertSetAssigneesInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlertSetAssigneesInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlertSetAssigneesInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlertSetAssigneesInput.serializer,
        json,
      );
}

abstract class GAlertTodoCreateInput
    implements Built<GAlertTodoCreateInput, GAlertTodoCreateInputBuilder> {
  GAlertTodoCreateInput._();

  factory GAlertTodoCreateInput(
          [Function(GAlertTodoCreateInputBuilder b) updates]) =
      _$GAlertTodoCreateInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  static Serializer<GAlertTodoCreateInput> get serializer =>
      _$gAlertTodoCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAlertTodoCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAlertTodoCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAlertTodoCreateInput.serializer,
        json,
      );
}

abstract class GAnalyticsDevopsAdoptionEnabledNamespaceID
    implements
        Built<GAnalyticsDevopsAdoptionEnabledNamespaceID,
            GAnalyticsDevopsAdoptionEnabledNamespaceIDBuilder> {
  GAnalyticsDevopsAdoptionEnabledNamespaceID._();

  factory GAnalyticsDevopsAdoptionEnabledNamespaceID([String? value]) =>
      _$GAnalyticsDevopsAdoptionEnabledNamespaceID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GAnalyticsDevopsAdoptionEnabledNamespaceID>
      get serializer => _i2.DefaultScalarSerializer<
          GAnalyticsDevopsAdoptionEnabledNamespaceID>((Object
              serialized) =>
          GAnalyticsDevopsAdoptionEnabledNamespaceID((serialized as String?)));
}

abstract class GApiFuzzingCiConfigurationCreateInput
    implements
        Built<GApiFuzzingCiConfigurationCreateInput,
            GApiFuzzingCiConfigurationCreateInputBuilder> {
  GApiFuzzingCiConfigurationCreateInput._();

  factory GApiFuzzingCiConfigurationCreateInput(
          [Function(GApiFuzzingCiConfigurationCreateInputBuilder b) updates]) =
      _$GApiFuzzingCiConfigurationCreateInput;

  String? get clientMutationId;
  String get projectPath;
  String get apiSpecificationFile;
  String? get authPassword;
  String? get authUsername;
  GApiFuzzingScanMode get scanMode;
  String? get scanProfile;
  String get target;
  static Serializer<GApiFuzzingCiConfigurationCreateInput> get serializer =>
      _$gApiFuzzingCiConfigurationCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GApiFuzzingCiConfigurationCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GApiFuzzingCiConfigurationCreateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GApiFuzzingCiConfigurationCreateInput.serializer,
        json,
      );
}

class GApiFuzzingScanMode extends EnumClass {
  const GApiFuzzingScanMode._(String name) : super(name);

  static const GApiFuzzingScanMode HAR = _$gApiFuzzingScanModeHAR;

  static const GApiFuzzingScanMode OPENAPI = _$gApiFuzzingScanModeOPENAPI;

  static const GApiFuzzingScanMode POSTMAN = _$gApiFuzzingScanModePOSTMAN;

  static Serializer<GApiFuzzingScanMode> get serializer =>
      _$gApiFuzzingScanModeSerializer;
  static BuiltSet<GApiFuzzingScanMode> get values =>
      _$gApiFuzzingScanModeValues;
  static GApiFuzzingScanMode valueOf(String name) =>
      _$gApiFuzzingScanModeValueOf(name);
}

class GApprovalRuleType extends EnumClass {
  const GApprovalRuleType._(String name) : super(name);

  static const GApprovalRuleType REGULAR = _$gApprovalRuleTypeREGULAR;

  static const GApprovalRuleType CODE_OWNER = _$gApprovalRuleTypeCODE_OWNER;

  static const GApprovalRuleType REPORT_APPROVER =
      _$gApprovalRuleTypeREPORT_APPROVER;

  static const GApprovalRuleType ANY_APPROVER = _$gApprovalRuleTypeANY_APPROVER;

  static Serializer<GApprovalRuleType> get serializer =>
      _$gApprovalRuleTypeSerializer;
  static BuiltSet<GApprovalRuleType> get values => _$gApprovalRuleTypeValues;
  static GApprovalRuleType valueOf(String name) =>
      _$gApprovalRuleTypeValueOf(name);
}

abstract class GAppSecFuzzingCoverageCorpusID
    implements
        Built<GAppSecFuzzingCoverageCorpusID,
            GAppSecFuzzingCoverageCorpusIDBuilder> {
  GAppSecFuzzingCoverageCorpusID._();

  factory GAppSecFuzzingCoverageCorpusID([String? value]) =>
      _$GAppSecFuzzingCoverageCorpusID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GAppSecFuzzingCoverageCorpusID> get serializer =>
      _i2.DefaultScalarSerializer<GAppSecFuzzingCoverageCorpusID>(
          (Object serialized) =>
              GAppSecFuzzingCoverageCorpusID((serialized as String?)));
}

abstract class GArtifactDestroyInput
    implements Built<GArtifactDestroyInput, GArtifactDestroyInputBuilder> {
  GArtifactDestroyInput._();

  factory GArtifactDestroyInput(
          [Function(GArtifactDestroyInputBuilder b) updates]) =
      _$GArtifactDestroyInput;

  String? get clientMutationId;
  GCiJobArtifactID get id;
  static Serializer<GArtifactDestroyInput> get serializer =>
      _$gArtifactDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GArtifactDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GArtifactDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GArtifactDestroyInput.serializer,
        json,
      );
}

class GAssigneeWildcardId extends EnumClass {
  const GAssigneeWildcardId._(String name) : super(name);

  static const GAssigneeWildcardId NONE = _$gAssigneeWildcardIdNONE;

  static const GAssigneeWildcardId ANY = _$gAssigneeWildcardIdANY;

  static Serializer<GAssigneeWildcardId> get serializer =>
      _$gAssigneeWildcardIdSerializer;
  static BuiltSet<GAssigneeWildcardId> get values =>
      _$gAssigneeWildcardIdValues;
  static GAssigneeWildcardId valueOf(String name) =>
      _$gAssigneeWildcardIdValueOf(name);
}

abstract class GAuditEventsExternalAuditEventDestinationID
    implements
        Built<GAuditEventsExternalAuditEventDestinationID,
            GAuditEventsExternalAuditEventDestinationIDBuilder> {
  GAuditEventsExternalAuditEventDestinationID._();

  factory GAuditEventsExternalAuditEventDestinationID([String? value]) =>
      _$GAuditEventsExternalAuditEventDestinationID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GAuditEventsExternalAuditEventDestinationID>
      get serializer => _i2.DefaultScalarSerializer<
          GAuditEventsExternalAuditEventDestinationID>((Object
              serialized) =>
          GAuditEventsExternalAuditEventDestinationID((serialized as String?)));
}

abstract class GAuditEventsStreamingHeaderID
    implements
        Built<GAuditEventsStreamingHeaderID,
            GAuditEventsStreamingHeaderIDBuilder> {
  GAuditEventsStreamingHeaderID._();

  factory GAuditEventsStreamingHeaderID([String? value]) =>
      _$GAuditEventsStreamingHeaderID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GAuditEventsStreamingHeaderID> get serializer =>
      _i2.DefaultScalarSerializer<GAuditEventsStreamingHeaderID>(
          (Object serialized) =>
              GAuditEventsStreamingHeaderID((serialized as String?)));
}

abstract class GAuditEventsStreamingHeadersCreateInput
    implements
        Built<GAuditEventsStreamingHeadersCreateInput,
            GAuditEventsStreamingHeadersCreateInputBuilder> {
  GAuditEventsStreamingHeadersCreateInput._();

  factory GAuditEventsStreamingHeadersCreateInput(
      [Function(GAuditEventsStreamingHeadersCreateInputBuilder b)
          updates]) = _$GAuditEventsStreamingHeadersCreateInput;

  String? get clientMutationId;
  String get key;
  String get value;
  GAuditEventsExternalAuditEventDestinationID get destinationId;
  static Serializer<GAuditEventsStreamingHeadersCreateInput> get serializer =>
      _$gAuditEventsStreamingHeadersCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuditEventsStreamingHeadersCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAuditEventsStreamingHeadersCreateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuditEventsStreamingHeadersCreateInput.serializer,
        json,
      );
}

abstract class GAuditEventsStreamingHeadersDestroyInput
    implements
        Built<GAuditEventsStreamingHeadersDestroyInput,
            GAuditEventsStreamingHeadersDestroyInputBuilder> {
  GAuditEventsStreamingHeadersDestroyInput._();

  factory GAuditEventsStreamingHeadersDestroyInput(
      [Function(GAuditEventsStreamingHeadersDestroyInputBuilder b)
          updates]) = _$GAuditEventsStreamingHeadersDestroyInput;

  String? get clientMutationId;
  GAuditEventsStreamingHeaderID get headerId;
  static Serializer<GAuditEventsStreamingHeadersDestroyInput> get serializer =>
      _$gAuditEventsStreamingHeadersDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuditEventsStreamingHeadersDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAuditEventsStreamingHeadersDestroyInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuditEventsStreamingHeadersDestroyInput.serializer,
        json,
      );
}

abstract class GAuditEventsStreamingHeadersUpdateInput
    implements
        Built<GAuditEventsStreamingHeadersUpdateInput,
            GAuditEventsStreamingHeadersUpdateInputBuilder> {
  GAuditEventsStreamingHeadersUpdateInput._();

  factory GAuditEventsStreamingHeadersUpdateInput(
      [Function(GAuditEventsStreamingHeadersUpdateInputBuilder b)
          updates]) = _$GAuditEventsStreamingHeadersUpdateInput;

  String? get clientMutationId;
  GAuditEventsStreamingHeaderID get headerId;
  String get key;
  String get value;
  static Serializer<GAuditEventsStreamingHeadersUpdateInput> get serializer =>
      _$gAuditEventsStreamingHeadersUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuditEventsStreamingHeadersUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAuditEventsStreamingHeadersUpdateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuditEventsStreamingHeadersUpdateInput.serializer,
        json,
      );
}

class GAvailabilityEnum extends EnumClass {
  const GAvailabilityEnum._(String name) : super(name);

  static const GAvailabilityEnum NOT_SET = _$gAvailabilityEnumNOT_SET;

  static const GAvailabilityEnum BUSY = _$gAvailabilityEnumBUSY;

  static Serializer<GAvailabilityEnum> get serializer =>
      _$gAvailabilityEnumSerializer;
  static BuiltSet<GAvailabilityEnum> get values => _$gAvailabilityEnumValues;
  static GAvailabilityEnum valueOf(String name) =>
      _$gAvailabilityEnumValueOf(name);
}

abstract class GAwardableID
    implements Built<GAwardableID, GAwardableIDBuilder> {
  GAwardableID._();

  factory GAwardableID([String? value]) =>
      _$GAwardableID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GAwardableID> get serializer =>
      _i2.DefaultScalarSerializer<GAwardableID>(
          (Object serialized) => GAwardableID((serialized as String?)));
}

abstract class GAwardEmojiAddInput
    implements Built<GAwardEmojiAddInput, GAwardEmojiAddInputBuilder> {
  GAwardEmojiAddInput._();

  factory GAwardEmojiAddInput(
      [Function(GAwardEmojiAddInputBuilder b) updates]) = _$GAwardEmojiAddInput;

  GAwardableID get awardableId;
  String get name;
  String? get clientMutationId;
  static Serializer<GAwardEmojiAddInput> get serializer =>
      _$gAwardEmojiAddInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAwardEmojiAddInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAwardEmojiAddInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAwardEmojiAddInput.serializer,
        json,
      );
}

abstract class GAwardEmojiRemoveInput
    implements Built<GAwardEmojiRemoveInput, GAwardEmojiRemoveInputBuilder> {
  GAwardEmojiRemoveInput._();

  factory GAwardEmojiRemoveInput(
          [Function(GAwardEmojiRemoveInputBuilder b) updates]) =
      _$GAwardEmojiRemoveInput;

  GAwardableID get awardableId;
  String get name;
  String? get clientMutationId;
  static Serializer<GAwardEmojiRemoveInput> get serializer =>
      _$gAwardEmojiRemoveInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAwardEmojiRemoveInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAwardEmojiRemoveInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAwardEmojiRemoveInput.serializer,
        json,
      );
}

abstract class GAwardEmojiToggleInput
    implements Built<GAwardEmojiToggleInput, GAwardEmojiToggleInputBuilder> {
  GAwardEmojiToggleInput._();

  factory GAwardEmojiToggleInput(
          [Function(GAwardEmojiToggleInputBuilder b) updates]) =
      _$GAwardEmojiToggleInput;

  GAwardableID get awardableId;
  String get name;
  String? get clientMutationId;
  static Serializer<GAwardEmojiToggleInput> get serializer =>
      _$gAwardEmojiToggleInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAwardEmojiToggleInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAwardEmojiToggleInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAwardEmojiToggleInput.serializer,
        json,
      );
}

abstract class GBigInt implements Built<GBigInt, GBigIntBuilder> {
  GBigInt._();

  factory GBigInt([String? value]) =>
      _$GBigInt((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GBigInt> get serializer =>
      _i2.DefaultScalarSerializer<GBigInt>(
          (Object serialized) => GBigInt((serialized as String?)));
}

class GBlobViewersType extends EnumClass {
  const GBlobViewersType._(String name) : super(name);

  static const GBlobViewersType rich = _$gBlobViewersTyperich;

  static const GBlobViewersType simple = _$gBlobViewersTypesimple;

  static const GBlobViewersType auxiliary = _$gBlobViewersTypeauxiliary;

  static Serializer<GBlobViewersType> get serializer =>
      _$gBlobViewersTypeSerializer;
  static BuiltSet<GBlobViewersType> get values => _$gBlobViewersTypeValues;
  static GBlobViewersType valueOf(String name) =>
      _$gBlobViewersTypeValueOf(name);
}

abstract class GBoardEpicCreateInput
    implements Built<GBoardEpicCreateInput, GBoardEpicCreateInputBuilder> {
  GBoardEpicCreateInput._();

  factory GBoardEpicCreateInput(
          [Function(GBoardEpicCreateInputBuilder b) updates]) =
      _$GBoardEpicCreateInput;

  String? get clientMutationId;
  String get groupPath;
  GBoardsEpicBoardID get boardId;
  GBoardsEpicListID get listId;
  String get title;
  static Serializer<GBoardEpicCreateInput> get serializer =>
      _$gBoardEpicCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBoardEpicCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBoardEpicCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBoardEpicCreateInput.serializer,
        json,
      );
}

abstract class GBoardID implements Built<GBoardID, GBoardIDBuilder> {
  GBoardID._();

  factory GBoardID([String? value]) =>
      _$GBoardID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GBoardID> get serializer =>
      _i2.DefaultScalarSerializer<GBoardID>(
          (Object serialized) => GBoardID((serialized as String?)));
}

abstract class GBoardIssueInput
    implements Built<GBoardIssueInput, GBoardIssueInputBuilder> {
  GBoardIssueInput._();

  factory GBoardIssueInput([Function(GBoardIssueInputBuilder b) updates]) =
      _$GBoardIssueInput;

  BuiltList<String>? get labelName;
  String? get authorUsername;
  String? get myReactionEmoji;
  BuiltList<String>? get iids;
  String? get milestoneTitle;
  BuiltList<String>? get assigneeUsername;
  String? get releaseTag;
  BuiltList<GIssueType>? get types;
  GMilestoneWildcardId? get milestoneWildcardId;
  GEpicID? get epicId;
  String? get iterationTitle;
  String? get weight;
  BuiltList<GIterationID>? get iterationId;
  GNegatedBoardIssueInput? get not;
  String? get search;
  GAssigneeWildcardId? get assigneeWildcardId;
  bool? get confidential;
  GEpicWildcardId? get epicWildcardId;
  GIterationWildcardId? get iterationWildcardId;
  BuiltList<GIterationsCadenceID>? get iterationCadenceId;
  GWeightWildcardId? get weightWildcardId;
  static Serializer<GBoardIssueInput> get serializer =>
      _$gBoardIssueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBoardIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBoardIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBoardIssueInput.serializer,
        json,
      );
}

abstract class GBoardListCreateInput
    implements Built<GBoardListCreateInput, GBoardListCreateInputBuilder> {
  GBoardListCreateInput._();

  factory GBoardListCreateInput(
          [Function(GBoardListCreateInputBuilder b) updates]) =
      _$GBoardListCreateInput;

  bool? get backlog;
  GLabelID? get labelId;
  String? get clientMutationId;
  GBoardID get boardId;
  GMilestoneID? get milestoneId;
  GIterationID? get iterationId;
  GUserID? get assigneeId;
  static Serializer<GBoardListCreateInput> get serializer =>
      _$gBoardListCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBoardListCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBoardListCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBoardListCreateInput.serializer,
        json,
      );
}

abstract class GBoardListUpdateLimitMetricsInput
    implements
        Built<GBoardListUpdateLimitMetricsInput,
            GBoardListUpdateLimitMetricsInputBuilder> {
  GBoardListUpdateLimitMetricsInput._();

  factory GBoardListUpdateLimitMetricsInput(
          [Function(GBoardListUpdateLimitMetricsInputBuilder b) updates]) =
      _$GBoardListUpdateLimitMetricsInput;

  String? get clientMutationId;
  GListID get listId;
  GListLimitMetric? get limitMetric;
  int? get maxIssueCount;
  int? get maxIssueWeight;
  static Serializer<GBoardListUpdateLimitMetricsInput> get serializer =>
      _$gBoardListUpdateLimitMetricsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBoardListUpdateLimitMetricsInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBoardListUpdateLimitMetricsInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBoardListUpdateLimitMetricsInput.serializer,
        json,
      );
}

abstract class GBoardsEpicBoardID
    implements Built<GBoardsEpicBoardID, GBoardsEpicBoardIDBuilder> {
  GBoardsEpicBoardID._();

  factory GBoardsEpicBoardID([String? value]) =>
      _$GBoardsEpicBoardID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GBoardsEpicBoardID> get serializer =>
      _i2.DefaultScalarSerializer<GBoardsEpicBoardID>(
          (Object serialized) => GBoardsEpicBoardID((serialized as String?)));
}

abstract class GBoardsEpicListID
    implements Built<GBoardsEpicListID, GBoardsEpicListIDBuilder> {
  GBoardsEpicListID._();

  factory GBoardsEpicListID([String? value]) =>
      _$GBoardsEpicListID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GBoardsEpicListID> get serializer =>
      _i2.DefaultScalarSerializer<GBoardsEpicListID>(
          (Object serialized) => GBoardsEpicListID((serialized as String?)));
}

abstract class GBulkEnableDevopsAdoptionNamespacesInput
    implements
        Built<GBulkEnableDevopsAdoptionNamespacesInput,
            GBulkEnableDevopsAdoptionNamespacesInputBuilder> {
  GBulkEnableDevopsAdoptionNamespacesInput._();

  factory GBulkEnableDevopsAdoptionNamespacesInput(
      [Function(GBulkEnableDevopsAdoptionNamespacesInputBuilder b)
          updates]) = _$GBulkEnableDevopsAdoptionNamespacesInput;

  String? get clientMutationId;
  BuiltList<GNamespaceID> get namespaceIds;
  GNamespaceID? get displayNamespaceId;
  static Serializer<GBulkEnableDevopsAdoptionNamespacesInput> get serializer =>
      _$gBulkEnableDevopsAdoptionNamespacesInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBulkEnableDevopsAdoptionNamespacesInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBulkEnableDevopsAdoptionNamespacesInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBulkEnableDevopsAdoptionNamespacesInput.serializer,
        json,
      );
}

abstract class GBulkRunnerDeleteInput
    implements Built<GBulkRunnerDeleteInput, GBulkRunnerDeleteInputBuilder> {
  GBulkRunnerDeleteInput._();

  factory GBulkRunnerDeleteInput(
          [Function(GBulkRunnerDeleteInputBuilder b) updates]) =
      _$GBulkRunnerDeleteInput;

  String? get clientMutationId;
  BuiltList<GCiRunnerID>? get ids;
  static Serializer<GBulkRunnerDeleteInput> get serializer =>
      _$gBulkRunnerDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBulkRunnerDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GBulkRunnerDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBulkRunnerDeleteInput.serializer,
        json,
      );
}

abstract class GCiBuildID implements Built<GCiBuildID, GCiBuildIDBuilder> {
  GCiBuildID._();

  factory GCiBuildID([String? value]) =>
      _$GCiBuildID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GCiBuildID> get serializer =>
      _i2.DefaultScalarSerializer<GCiBuildID>(
          (Object serialized) => GCiBuildID((serialized as String?)));
}

abstract class GCiCdSettingsUpdateInput
    implements
        Built<GCiCdSettingsUpdateInput, GCiCdSettingsUpdateInputBuilder> {
  GCiCdSettingsUpdateInput._();

  factory GCiCdSettingsUpdateInput(
          [Function(GCiCdSettingsUpdateInputBuilder b) updates]) =
      _$GCiCdSettingsUpdateInput;

  String get fullPath;
  bool? get keepLatestArtifact;
  bool? get jobTokenScopeEnabled;
  bool? get mergePipelinesEnabled;
  bool? get mergeTrainsEnabled;
  String? get clientMutationId;
  static Serializer<GCiCdSettingsUpdateInput> get serializer =>
      _$gCiCdSettingsUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCiCdSettingsUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCiCdSettingsUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCiCdSettingsUpdateInput.serializer,
        json,
      );
}

class GCiConfigIncludeType extends EnumClass {
  const GCiConfigIncludeType._(String name) : super(name);

  static const GCiConfigIncludeType remote = _$gCiConfigIncludeTyperemote;

  static const GCiConfigIncludeType local = _$gCiConfigIncludeTypelocal;

  static const GCiConfigIncludeType file = _$gCiConfigIncludeTypefile;

  static const GCiConfigIncludeType template = _$gCiConfigIncludeTypetemplate;

  static Serializer<GCiConfigIncludeType> get serializer =>
      _$gCiConfigIncludeTypeSerializer;
  static BuiltSet<GCiConfigIncludeType> get values =>
      _$gCiConfigIncludeTypeValues;
  static GCiConfigIncludeType valueOf(String name) =>
      _$gCiConfigIncludeTypeValueOf(name);
}

class GCiConfigStatus extends EnumClass {
  const GCiConfigStatus._(String name) : super(name);

  static const GCiConfigStatus VALID = _$gCiConfigStatusVALID;

  static const GCiConfigStatus INVALID = _$gCiConfigStatusINVALID;

  static Serializer<GCiConfigStatus> get serializer =>
      _$gCiConfigStatusSerializer;
  static BuiltSet<GCiConfigStatus> get values => _$gCiConfigStatusValues;
  static GCiConfigStatus valueOf(String name) => _$gCiConfigStatusValueOf(name);
}

abstract class GCiJobArtifactID
    implements Built<GCiJobArtifactID, GCiJobArtifactIDBuilder> {
  GCiJobArtifactID._();

  factory GCiJobArtifactID([String? value]) =>
      _$GCiJobArtifactID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GCiJobArtifactID> get serializer =>
      _i2.DefaultScalarSerializer<GCiJobArtifactID>(
          (Object serialized) => GCiJobArtifactID((serialized as String?)));
}

class GCiJobKind extends EnumClass {
  const GCiJobKind._(String name) : super(name);

  static const GCiJobKind BUILD = _$gCiJobKindBUILD;

  static const GCiJobKind BRIDGE = _$gCiJobKindBRIDGE;

  static Serializer<GCiJobKind> get serializer => _$gCiJobKindSerializer;
  static BuiltSet<GCiJobKind> get values => _$gCiJobKindValues;
  static GCiJobKind valueOf(String name) => _$gCiJobKindValueOf(name);
}

class GCiJobStatus extends EnumClass {
  const GCiJobStatus._(String name) : super(name);

  static const GCiJobStatus CREATED = _$gCiJobStatusCREATED;

  static const GCiJobStatus WAITING_FOR_RESOURCE =
      _$gCiJobStatusWAITING_FOR_RESOURCE;

  static const GCiJobStatus PREPARING = _$gCiJobStatusPREPARING;

  static const GCiJobStatus PENDING = _$gCiJobStatusPENDING;

  static const GCiJobStatus RUNNING = _$gCiJobStatusRUNNING;

  static const GCiJobStatus SUCCESS = _$gCiJobStatusSUCCESS;

  static const GCiJobStatus FAILED = _$gCiJobStatusFAILED;

  static const GCiJobStatus CANCELED = _$gCiJobStatusCANCELED;

  static const GCiJobStatus SKIPPED = _$gCiJobStatusSKIPPED;

  static const GCiJobStatus MANUAL = _$gCiJobStatusMANUAL;

  static const GCiJobStatus SCHEDULED = _$gCiJobStatusSCHEDULED;

  static Serializer<GCiJobStatus> get serializer => _$gCiJobStatusSerializer;
  static BuiltSet<GCiJobStatus> get values => _$gCiJobStatusValues;
  static GCiJobStatus valueOf(String name) => _$gCiJobStatusValueOf(name);
}

abstract class GCiJobTokenScopeAddProjectInput
    implements
        Built<GCiJobTokenScopeAddProjectInput,
            GCiJobTokenScopeAddProjectInputBuilder> {
  GCiJobTokenScopeAddProjectInput._();

  factory GCiJobTokenScopeAddProjectInput(
          [Function(GCiJobTokenScopeAddProjectInputBuilder b) updates]) =
      _$GCiJobTokenScopeAddProjectInput;

  String? get clientMutationId;
  String get projectPath;
  String get targetProjectPath;
  static Serializer<GCiJobTokenScopeAddProjectInput> get serializer =>
      _$gCiJobTokenScopeAddProjectInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCiJobTokenScopeAddProjectInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCiJobTokenScopeAddProjectInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCiJobTokenScopeAddProjectInput.serializer,
        json,
      );
}

abstract class GCiJobTokenScopeRemoveProjectInput
    implements
        Built<GCiJobTokenScopeRemoveProjectInput,
            GCiJobTokenScopeRemoveProjectInputBuilder> {
  GCiJobTokenScopeRemoveProjectInput._();

  factory GCiJobTokenScopeRemoveProjectInput(
          [Function(GCiJobTokenScopeRemoveProjectInputBuilder b) updates]) =
      _$GCiJobTokenScopeRemoveProjectInput;

  String? get clientMutationId;
  String get projectPath;
  String get targetProjectPath;
  static Serializer<GCiJobTokenScopeRemoveProjectInput> get serializer =>
      _$gCiJobTokenScopeRemoveProjectInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCiJobTokenScopeRemoveProjectInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCiJobTokenScopeRemoveProjectInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCiJobTokenScopeRemoveProjectInput.serializer,
        json,
      );
}

abstract class GCiPipelineID
    implements Built<GCiPipelineID, GCiPipelineIDBuilder> {
  GCiPipelineID._();

  factory GCiPipelineID([String? value]) =>
      _$GCiPipelineID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GCiPipelineID> get serializer =>
      _i2.DefaultScalarSerializer<GCiPipelineID>(
          (Object serialized) => GCiPipelineID((serialized as String?)));
}

class GCiRunnerAccessLevel extends EnumClass {
  const GCiRunnerAccessLevel._(String name) : super(name);

  static const GCiRunnerAccessLevel NOT_PROTECTED =
      _$gCiRunnerAccessLevelNOT_PROTECTED;

  static const GCiRunnerAccessLevel REF_PROTECTED =
      _$gCiRunnerAccessLevelREF_PROTECTED;

  static Serializer<GCiRunnerAccessLevel> get serializer =>
      _$gCiRunnerAccessLevelSerializer;
  static BuiltSet<GCiRunnerAccessLevel> get values =>
      _$gCiRunnerAccessLevelValues;
  static GCiRunnerAccessLevel valueOf(String name) =>
      _$gCiRunnerAccessLevelValueOf(name);
}

abstract class GCiRunnerID implements Built<GCiRunnerID, GCiRunnerIDBuilder> {
  GCiRunnerID._();

  factory GCiRunnerID([String? value]) =>
      _$GCiRunnerID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GCiRunnerID> get serializer =>
      _i2.DefaultScalarSerializer<GCiRunnerID>(
          (Object serialized) => GCiRunnerID((serialized as String?)));
}

class GCiRunnerMembershipFilter extends EnumClass {
  const GCiRunnerMembershipFilter._(String name) : super(name);

  static const GCiRunnerMembershipFilter DIRECT =
      _$gCiRunnerMembershipFilterDIRECT;

  static const GCiRunnerMembershipFilter DESCENDANTS =
      _$gCiRunnerMembershipFilterDESCENDANTS;

  static const GCiRunnerMembershipFilter ALL_AVAILABLE =
      _$gCiRunnerMembershipFilterALL_AVAILABLE;

  static Serializer<GCiRunnerMembershipFilter> get serializer =>
      _$gCiRunnerMembershipFilterSerializer;
  static BuiltSet<GCiRunnerMembershipFilter> get values =>
      _$gCiRunnerMembershipFilterValues;
  static GCiRunnerMembershipFilter valueOf(String name) =>
      _$gCiRunnerMembershipFilterValueOf(name);
}

class GCiRunnerSort extends EnumClass {
  const GCiRunnerSort._(String name) : super(name);

  static const GCiRunnerSort CONTACTED_ASC = _$gCiRunnerSortCONTACTED_ASC;

  static const GCiRunnerSort CONTACTED_DESC = _$gCiRunnerSortCONTACTED_DESC;

  static const GCiRunnerSort CREATED_ASC = _$gCiRunnerSortCREATED_ASC;

  static const GCiRunnerSort CREATED_DESC = _$gCiRunnerSortCREATED_DESC;

  static const GCiRunnerSort TOKEN_EXPIRES_AT_ASC =
      _$gCiRunnerSortTOKEN_EXPIRES_AT_ASC;

  static const GCiRunnerSort TOKEN_EXPIRES_AT_DESC =
      _$gCiRunnerSortTOKEN_EXPIRES_AT_DESC;

  static Serializer<GCiRunnerSort> get serializer => _$gCiRunnerSortSerializer;
  static BuiltSet<GCiRunnerSort> get values => _$gCiRunnerSortValues;
  static GCiRunnerSort valueOf(String name) => _$gCiRunnerSortValueOf(name);
}

class GCiRunnerStatus extends EnumClass {
  const GCiRunnerStatus._(String name) : super(name);

  static const GCiRunnerStatus ACTIVE = _$gCiRunnerStatusACTIVE;

  static const GCiRunnerStatus PAUSED = _$gCiRunnerStatusPAUSED;

  static const GCiRunnerStatus ONLINE = _$gCiRunnerStatusONLINE;

  static const GCiRunnerStatus OFFLINE = _$gCiRunnerStatusOFFLINE;

  static const GCiRunnerStatus STALE = _$gCiRunnerStatusSTALE;

  static const GCiRunnerStatus NEVER_CONTACTED =
      _$gCiRunnerStatusNEVER_CONTACTED;

  static Serializer<GCiRunnerStatus> get serializer =>
      _$gCiRunnerStatusSerializer;
  static BuiltSet<GCiRunnerStatus> get values => _$gCiRunnerStatusValues;
  static GCiRunnerStatus valueOf(String name) => _$gCiRunnerStatusValueOf(name);
}

class GCiRunnerType extends EnumClass {
  const GCiRunnerType._(String name) : super(name);

  static const GCiRunnerType INSTANCE_TYPE = _$gCiRunnerTypeINSTANCE_TYPE;

  static const GCiRunnerType GROUP_TYPE = _$gCiRunnerTypeGROUP_TYPE;

  static const GCiRunnerType PROJECT_TYPE = _$gCiRunnerTypePROJECT_TYPE;

  static Serializer<GCiRunnerType> get serializer => _$gCiRunnerTypeSerializer;
  static BuiltSet<GCiRunnerType> get values => _$gCiRunnerTypeValues;
  static GCiRunnerType valueOf(String name) => _$gCiRunnerTypeValueOf(name);
}

class GCiRunnerUpgradeStatus extends EnumClass {
  const GCiRunnerUpgradeStatus._(String name) : super(name);

  static const GCiRunnerUpgradeStatus INVALID = _$gCiRunnerUpgradeStatusINVALID;

  static const GCiRunnerUpgradeStatus NOT_AVAILABLE =
      _$gCiRunnerUpgradeStatusNOT_AVAILABLE;

  static const GCiRunnerUpgradeStatus AVAILABLE =
      _$gCiRunnerUpgradeStatusAVAILABLE;

  static const GCiRunnerUpgradeStatus RECOMMENDED =
      _$gCiRunnerUpgradeStatusRECOMMENDED;

  static Serializer<GCiRunnerUpgradeStatus> get serializer =>
      _$gCiRunnerUpgradeStatusSerializer;
  static BuiltSet<GCiRunnerUpgradeStatus> get values =>
      _$gCiRunnerUpgradeStatusValues;
  static GCiRunnerUpgradeStatus valueOf(String name) =>
      _$gCiRunnerUpgradeStatusValueOf(name);
}

abstract class GCiVariableInput
    implements Built<GCiVariableInput, GCiVariableInputBuilder> {
  GCiVariableInput._();

  factory GCiVariableInput([Function(GCiVariableInputBuilder b) updates]) =
      _$GCiVariableInput;

  String get key;
  String get value;
  static Serializer<GCiVariableInput> get serializer =>
      _$gCiVariableInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCiVariableInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCiVariableInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCiVariableInput.serializer,
        json,
      );
}

class GCiVariableType extends EnumClass {
  const GCiVariableType._(String name) : super(name);

  static const GCiVariableType ENV_VAR = _$gCiVariableTypeENV_VAR;

  static const GCiVariableType FILE = _$gCiVariableTypeFILE;

  static Serializer<GCiVariableType> get serializer =>
      _$gCiVariableTypeSerializer;
  static BuiltSet<GCiVariableType> get values => _$gCiVariableTypeValues;
  static GCiVariableType valueOf(String name) => _$gCiVariableTypeValueOf(name);
}

abstract class GClusterAgentDeleteInput
    implements
        Built<GClusterAgentDeleteInput, GClusterAgentDeleteInputBuilder> {
  GClusterAgentDeleteInput._();

  factory GClusterAgentDeleteInput(
          [Function(GClusterAgentDeleteInputBuilder b) updates]) =
      _$GClusterAgentDeleteInput;

  String? get clientMutationId;
  GClustersAgentID get id;
  static Serializer<GClusterAgentDeleteInput> get serializer =>
      _$gClusterAgentDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GClusterAgentDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GClusterAgentDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GClusterAgentDeleteInput.serializer,
        json,
      );
}

abstract class GClusterAgentTokenCreateInput
    implements
        Built<GClusterAgentTokenCreateInput,
            GClusterAgentTokenCreateInputBuilder> {
  GClusterAgentTokenCreateInput._();

  factory GClusterAgentTokenCreateInput(
          [Function(GClusterAgentTokenCreateInputBuilder b) updates]) =
      _$GClusterAgentTokenCreateInput;

  String? get clientMutationId;
  GClustersAgentID get clusterAgentId;
  String? get description;
  String get name;
  static Serializer<GClusterAgentTokenCreateInput> get serializer =>
      _$gClusterAgentTokenCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GClusterAgentTokenCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GClusterAgentTokenCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GClusterAgentTokenCreateInput.serializer,
        json,
      );
}

abstract class GClusterAgentTokenRevokeInput
    implements
        Built<GClusterAgentTokenRevokeInput,
            GClusterAgentTokenRevokeInputBuilder> {
  GClusterAgentTokenRevokeInput._();

  factory GClusterAgentTokenRevokeInput(
          [Function(GClusterAgentTokenRevokeInputBuilder b) updates]) =
      _$GClusterAgentTokenRevokeInput;

  String? get clientMutationId;
  GClustersAgentTokenID get id;
  static Serializer<GClusterAgentTokenRevokeInput> get serializer =>
      _$gClusterAgentTokenRevokeInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GClusterAgentTokenRevokeInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GClusterAgentTokenRevokeInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GClusterAgentTokenRevokeInput.serializer,
        json,
      );
}

abstract class GClustersAgentID
    implements Built<GClustersAgentID, GClustersAgentIDBuilder> {
  GClustersAgentID._();

  factory GClustersAgentID([String? value]) =>
      _$GClustersAgentID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GClustersAgentID> get serializer =>
      _i2.DefaultScalarSerializer<GClustersAgentID>(
          (Object serialized) => GClustersAgentID((serialized as String?)));
}

abstract class GClustersAgentTokenID
    implements Built<GClustersAgentTokenID, GClustersAgentTokenIDBuilder> {
  GClustersAgentTokenID._();

  factory GClustersAgentTokenID([String? value]) =>
      _$GClustersAgentTokenID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GClustersAgentTokenID> get serializer =>
      _i2.DefaultScalarSerializer<GClustersAgentTokenID>((Object serialized) =>
          GClustersAgentTokenID((serialized as String?)));
}

abstract class GClustersClusterID
    implements Built<GClustersClusterID, GClustersClusterIDBuilder> {
  GClustersClusterID._();

  factory GClustersClusterID([String? value]) =>
      _$GClustersClusterID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GClustersClusterID> get serializer =>
      _i2.DefaultScalarSerializer<GClustersClusterID>(
          (Object serialized) => GClustersClusterID((serialized as String?)));
}

class GCodeQualityDegradationSeverity extends EnumClass {
  const GCodeQualityDegradationSeverity._(String name) : super(name);

  static const GCodeQualityDegradationSeverity BLOCKER =
      _$gCodeQualityDegradationSeverityBLOCKER;

  static const GCodeQualityDegradationSeverity CRITICAL =
      _$gCodeQualityDegradationSeverityCRITICAL;

  static const GCodeQualityDegradationSeverity MAJOR =
      _$gCodeQualityDegradationSeverityMAJOR;

  static const GCodeQualityDegradationSeverity MINOR =
      _$gCodeQualityDegradationSeverityMINOR;

  static const GCodeQualityDegradationSeverity INFO =
      _$gCodeQualityDegradationSeverityINFO;

  static const GCodeQualityDegradationSeverity UNKNOWN =
      _$gCodeQualityDegradationSeverityUNKNOWN;

  static Serializer<GCodeQualityDegradationSeverity> get serializer =>
      _$gCodeQualityDegradationSeveritySerializer;
  static BuiltSet<GCodeQualityDegradationSeverity> get values =>
      _$gCodeQualityDegradationSeverityValues;
  static GCodeQualityDegradationSeverity valueOf(String name) =>
      _$gCodeQualityDegradationSeverityValueOf(name);
}

abstract class GColor implements Built<GColor, GColorBuilder> {
  GColor._();

  factory GColor([String? value]) =>
      _$GColor((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GColor> get serializer =>
      _i2.DefaultScalarSerializer<GColor>(
          (Object serialized) => GColor((serialized as String?)));
}

abstract class GCommitAction
    implements Built<GCommitAction, GCommitActionBuilder> {
  GCommitAction._();

  factory GCommitAction([Function(GCommitActionBuilder b) updates]) =
      _$GCommitAction;

  GCommitActionMode get action;
  String? get content;
  GCommitEncoding? get encoding;
  bool? get executeFilemode;
  String get filePath;
  String? get lastCommitId;
  String? get previousPath;
  static Serializer<GCommitAction> get serializer => _$gCommitActionSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCommitAction.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCommitAction? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCommitAction.serializer,
        json,
      );
}

class GCommitActionMode extends EnumClass {
  const GCommitActionMode._(String name) : super(name);

  static const GCommitActionMode CREATE = _$gCommitActionModeCREATE;

  static const GCommitActionMode DELETE = _$gCommitActionModeDELETE;

  static const GCommitActionMode MOVE = _$gCommitActionModeMOVE;

  static const GCommitActionMode UPDATE = _$gCommitActionModeUPDATE;

  static const GCommitActionMode CHMOD = _$gCommitActionModeCHMOD;

  static Serializer<GCommitActionMode> get serializer =>
      _$gCommitActionModeSerializer;
  static BuiltSet<GCommitActionMode> get values => _$gCommitActionModeValues;
  static GCommitActionMode valueOf(String name) =>
      _$gCommitActionModeValueOf(name);
}

abstract class GCommitCreateInput
    implements Built<GCommitCreateInput, GCommitCreateInputBuilder> {
  GCommitCreateInput._();

  factory GCommitCreateInput([Function(GCommitCreateInputBuilder b) updates]) =
      _$GCommitCreateInput;

  String? get clientMutationId;
  String get projectPath;
  String get branch;
  String? get startBranch;
  String get message;
  BuiltList<GCommitAction> get actions;
  static Serializer<GCommitCreateInput> get serializer =>
      _$gCommitCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCommitCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCommitCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCommitCreateInput.serializer,
        json,
      );
}

class GCommitEncoding extends EnumClass {
  const GCommitEncoding._(String name) : super(name);

  static const GCommitEncoding TEXT = _$gCommitEncodingTEXT;

  static const GCommitEncoding BASE64 = _$gCommitEncodingBASE64;

  static Serializer<GCommitEncoding> get serializer =>
      _$gCommitEncodingSerializer;
  static BuiltSet<GCommitEncoding> get values => _$gCommitEncodingValues;
  static GCommitEncoding valueOf(String name) => _$gCommitEncodingValueOf(name);
}

abstract class GComplianceFrameworkInput
    implements
        Built<GComplianceFrameworkInput, GComplianceFrameworkInputBuilder> {
  GComplianceFrameworkInput._();

  factory GComplianceFrameworkInput(
          [Function(GComplianceFrameworkInputBuilder b) updates]) =
      _$GComplianceFrameworkInput;

  String? get name;
  String? get description;
  String? get color;
  String? get pipelineConfigurationFullPath;
  static Serializer<GComplianceFrameworkInput> get serializer =>
      _$gComplianceFrameworkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GComplianceFrameworkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComplianceFrameworkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GComplianceFrameworkInput.serializer,
        json,
      );
}

abstract class GComplianceManagementFrameworkID
    implements
        Built<GComplianceManagementFrameworkID,
            GComplianceManagementFrameworkIDBuilder> {
  GComplianceManagementFrameworkID._();

  factory GComplianceManagementFrameworkID([String? value]) =>
      _$GComplianceManagementFrameworkID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GComplianceManagementFrameworkID> get serializer =>
      _i2.DefaultScalarSerializer<GComplianceManagementFrameworkID>(
          (Object serialized) =>
              GComplianceManagementFrameworkID((serialized as String?)));
}

abstract class GComplianceViolationInput
    implements
        Built<GComplianceViolationInput, GComplianceViolationInputBuilder> {
  GComplianceViolationInput._();

  factory GComplianceViolationInput(
          [Function(GComplianceViolationInputBuilder b) updates]) =
      _$GComplianceViolationInput;

  BuiltList<GProjectID>? get projectIds;
  GDate? get mergedBefore;
  GDate? get mergedAfter;
  static Serializer<GComplianceViolationInput> get serializer =>
      _$gComplianceViolationInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GComplianceViolationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GComplianceViolationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GComplianceViolationInput.serializer,
        json,
      );
}

class GComplianceViolationReason extends EnumClass {
  const GComplianceViolationReason._(String name) : super(name);

  static const GComplianceViolationReason APPROVED_BY_MERGE_REQUEST_AUTHOR =
      _$gComplianceViolationReasonAPPROVED_BY_MERGE_REQUEST_AUTHOR;

  static const GComplianceViolationReason APPROVED_BY_COMMITTER =
      _$gComplianceViolationReasonAPPROVED_BY_COMMITTER;

  static const GComplianceViolationReason APPROVED_BY_INSUFFICIENT_USERS =
      _$gComplianceViolationReasonAPPROVED_BY_INSUFFICIENT_USERS;

  static Serializer<GComplianceViolationReason> get serializer =>
      _$gComplianceViolationReasonSerializer;
  static BuiltSet<GComplianceViolationReason> get values =>
      _$gComplianceViolationReasonValues;
  static GComplianceViolationReason valueOf(String name) =>
      _$gComplianceViolationReasonValueOf(name);
}

class GComplianceViolationSeverity extends EnumClass {
  const GComplianceViolationSeverity._(String name) : super(name);

  static const GComplianceViolationSeverity INFO =
      _$gComplianceViolationSeverityINFO;

  static const GComplianceViolationSeverity LOW =
      _$gComplianceViolationSeverityLOW;

  static const GComplianceViolationSeverity MEDIUM =
      _$gComplianceViolationSeverityMEDIUM;

  static const GComplianceViolationSeverity HIGH =
      _$gComplianceViolationSeverityHIGH;

  static const GComplianceViolationSeverity CRITICAL =
      _$gComplianceViolationSeverityCRITICAL;

  static Serializer<GComplianceViolationSeverity> get serializer =>
      _$gComplianceViolationSeveritySerializer;
  static BuiltSet<GComplianceViolationSeverity> get values =>
      _$gComplianceViolationSeverityValues;
  static GComplianceViolationSeverity valueOf(String name) =>
      _$gComplianceViolationSeverityValueOf(name);
}

class GComplianceViolationSort extends EnumClass {
  const GComplianceViolationSort._(String name) : super(name);

  static const GComplianceViolationSort SEVERITY_LEVEL_DESC =
      _$gComplianceViolationSortSEVERITY_LEVEL_DESC;

  static const GComplianceViolationSort SEVERITY_LEVEL_ASC =
      _$gComplianceViolationSortSEVERITY_LEVEL_ASC;

  static const GComplianceViolationSort VIOLATION_REASON_DESC =
      _$gComplianceViolationSortVIOLATION_REASON_DESC;

  static const GComplianceViolationSort VIOLATION_REASON_ASC =
      _$gComplianceViolationSortVIOLATION_REASON_ASC;

  static const GComplianceViolationSort MERGE_REQUEST_TITLE_DESC =
      _$gComplianceViolationSortMERGE_REQUEST_TITLE_DESC;

  static const GComplianceViolationSort MERGE_REQUEST_TITLE_ASC =
      _$gComplianceViolationSortMERGE_REQUEST_TITLE_ASC;

  static const GComplianceViolationSort MERGED_AT_DESC =
      _$gComplianceViolationSortMERGED_AT_DESC;

  static const GComplianceViolationSort MERGED_AT_ASC =
      _$gComplianceViolationSortMERGED_AT_ASC;

  static Serializer<GComplianceViolationSort> get serializer =>
      _$gComplianceViolationSortSerializer;
  static BuiltSet<GComplianceViolationSort> get values =>
      _$gComplianceViolationSortValues;
  static GComplianceViolationSort valueOf(String name) =>
      _$gComplianceViolationSortValueOf(name);
}

class GConanMetadatumFileTypeEnum extends EnumClass {
  const GConanMetadatumFileTypeEnum._(String name) : super(name);

  static const GConanMetadatumFileTypeEnum RECIPE_FILE =
      _$gConanMetadatumFileTypeEnumRECIPE_FILE;

  static const GConanMetadatumFileTypeEnum PACKAGE_FILE =
      _$gConanMetadatumFileTypeEnumPACKAGE_FILE;

  static Serializer<GConanMetadatumFileTypeEnum> get serializer =>
      _$gConanMetadatumFileTypeEnumSerializer;
  static BuiltSet<GConanMetadatumFileTypeEnum> get values =>
      _$gConanMetadatumFileTypeEnumValues;
  static GConanMetadatumFileTypeEnum valueOf(String name) =>
      _$gConanMetadatumFileTypeEnumValueOf(name);
}

abstract class GConfigureContainerScanningInput
    implements
        Built<GConfigureContainerScanningInput,
            GConfigureContainerScanningInputBuilder> {
  GConfigureContainerScanningInput._();

  factory GConfigureContainerScanningInput(
          [Function(GConfigureContainerScanningInputBuilder b) updates]) =
      _$GConfigureContainerScanningInput;

  String get projectPath;
  String? get clientMutationId;
  static Serializer<GConfigureContainerScanningInput> get serializer =>
      _$gConfigureContainerScanningInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GConfigureContainerScanningInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GConfigureContainerScanningInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GConfigureContainerScanningInput.serializer,
        json,
      );
}

abstract class GConfigureDependencyScanningInput
    implements
        Built<GConfigureDependencyScanningInput,
            GConfigureDependencyScanningInputBuilder> {
  GConfigureDependencyScanningInput._();

  factory GConfigureDependencyScanningInput(
          [Function(GConfigureDependencyScanningInputBuilder b) updates]) =
      _$GConfigureDependencyScanningInput;

  String get projectPath;
  String? get clientMutationId;
  static Serializer<GConfigureDependencyScanningInput> get serializer =>
      _$gConfigureDependencyScanningInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GConfigureDependencyScanningInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GConfigureDependencyScanningInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GConfigureDependencyScanningInput.serializer,
        json,
      );
}

abstract class GConfigureSastIacInput
    implements Built<GConfigureSastIacInput, GConfigureSastIacInputBuilder> {
  GConfigureSastIacInput._();

  factory GConfigureSastIacInput(
          [Function(GConfigureSastIacInputBuilder b) updates]) =
      _$GConfigureSastIacInput;

  String get projectPath;
  String? get clientMutationId;
  static Serializer<GConfigureSastIacInput> get serializer =>
      _$gConfigureSastIacInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GConfigureSastIacInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GConfigureSastIacInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GConfigureSastIacInput.serializer,
        json,
      );
}

abstract class GConfigureSastInput
    implements Built<GConfigureSastInput, GConfigureSastInputBuilder> {
  GConfigureSastInput._();

  factory GConfigureSastInput(
      [Function(GConfigureSastInputBuilder b) updates]) = _$GConfigureSastInput;

  String get projectPath;
  String? get clientMutationId;
  GSastCiConfigurationInput get configuration;
  static Serializer<GConfigureSastInput> get serializer =>
      _$gConfigureSastInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GConfigureSastInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GConfigureSastInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GConfigureSastInput.serializer,
        json,
      );
}

abstract class GConfigureSecretDetectionInput
    implements
        Built<GConfigureSecretDetectionInput,
            GConfigureSecretDetectionInputBuilder> {
  GConfigureSecretDetectionInput._();

  factory GConfigureSecretDetectionInput(
          [Function(GConfigureSecretDetectionInputBuilder b) updates]) =
      _$GConfigureSecretDetectionInput;

  String get projectPath;
  String? get clientMutationId;
  static Serializer<GConfigureSecretDetectionInput> get serializer =>
      _$gConfigureSecretDetectionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GConfigureSecretDetectionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GConfigureSecretDetectionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GConfigureSecretDetectionInput.serializer,
        json,
      );
}

class GContactSort extends EnumClass {
  const GContactSort._(String name) : super(name);

  static const GContactSort FIRST_NAME_ASC = _$gContactSortFIRST_NAME_ASC;

  static const GContactSort FIRST_NAME_DESC = _$gContactSortFIRST_NAME_DESC;

  static const GContactSort LAST_NAME_ASC = _$gContactSortLAST_NAME_ASC;

  static const GContactSort LAST_NAME_DESC = _$gContactSortLAST_NAME_DESC;

  static const GContactSort EMAIL_ASC = _$gContactSortEMAIL_ASC;

  static const GContactSort EMAIL_DESC = _$gContactSortEMAIL_DESC;

  static const GContactSort PHONE_ASC = _$gContactSortPHONE_ASC;

  static const GContactSort PHONE_DESC = _$gContactSortPHONE_DESC;

  static const GContactSort DESCRIPTION_ASC = _$gContactSortDESCRIPTION_ASC;

  static const GContactSort DESCRIPTION_DESC = _$gContactSortDESCRIPTION_DESC;

  static const GContactSort ORGANIZATION_ASC = _$gContactSortORGANIZATION_ASC;

  static const GContactSort ORGANIZATION_DESC = _$gContactSortORGANIZATION_DESC;

  static const GContactSort updated_desc = _$gContactSortupdated_desc;

  static const GContactSort updated_asc = _$gContactSortupdated_asc;

  static const GContactSort created_desc = _$gContactSortcreated_desc;

  static const GContactSort created_asc = _$gContactSortcreated_asc;

  static const GContactSort UPDATED_DESC = _$gContactSortUPDATED_DESC;

  static const GContactSort UPDATED_ASC = _$gContactSortUPDATED_ASC;

  static const GContactSort CREATED_DESC = _$gContactSortCREATED_DESC;

  static const GContactSort CREATED_ASC = _$gContactSortCREATED_ASC;

  static Serializer<GContactSort> get serializer => _$gContactSortSerializer;
  static BuiltSet<GContactSort> get values => _$gContactSortValues;
  static GContactSort valueOf(String name) => _$gContactSortValueOf(name);
}

class GContainerExpirationPolicyCadenceEnum extends EnumClass {
  const GContainerExpirationPolicyCadenceEnum._(String name) : super(name);

  static const GContainerExpirationPolicyCadenceEnum EVERY_DAY =
      _$gContainerExpirationPolicyCadenceEnumEVERY_DAY;

  static const GContainerExpirationPolicyCadenceEnum EVERY_WEEK =
      _$gContainerExpirationPolicyCadenceEnumEVERY_WEEK;

  static const GContainerExpirationPolicyCadenceEnum EVERY_TWO_WEEKS =
      _$gContainerExpirationPolicyCadenceEnumEVERY_TWO_WEEKS;

  static const GContainerExpirationPolicyCadenceEnum EVERY_MONTH =
      _$gContainerExpirationPolicyCadenceEnumEVERY_MONTH;

  static const GContainerExpirationPolicyCadenceEnum EVERY_THREE_MONTHS =
      _$gContainerExpirationPolicyCadenceEnumEVERY_THREE_MONTHS;

  static Serializer<GContainerExpirationPolicyCadenceEnum> get serializer =>
      _$gContainerExpirationPolicyCadenceEnumSerializer;
  static BuiltSet<GContainerExpirationPolicyCadenceEnum> get values =>
      _$gContainerExpirationPolicyCadenceEnumValues;
  static GContainerExpirationPolicyCadenceEnum valueOf(String name) =>
      _$gContainerExpirationPolicyCadenceEnumValueOf(name);
}

class GContainerExpirationPolicyKeepEnum extends EnumClass {
  const GContainerExpirationPolicyKeepEnum._(String name) : super(name);

  static const GContainerExpirationPolicyKeepEnum ONE_TAG =
      _$gContainerExpirationPolicyKeepEnumONE_TAG;

  static const GContainerExpirationPolicyKeepEnum FIVE_TAGS =
      _$gContainerExpirationPolicyKeepEnumFIVE_TAGS;

  static const GContainerExpirationPolicyKeepEnum TEN_TAGS =
      _$gContainerExpirationPolicyKeepEnumTEN_TAGS;

  static const GContainerExpirationPolicyKeepEnum TWENTY_FIVE_TAGS =
      _$gContainerExpirationPolicyKeepEnumTWENTY_FIVE_TAGS;

  static const GContainerExpirationPolicyKeepEnum FIFTY_TAGS =
      _$gContainerExpirationPolicyKeepEnumFIFTY_TAGS;

  static const GContainerExpirationPolicyKeepEnum ONE_HUNDRED_TAGS =
      _$gContainerExpirationPolicyKeepEnumONE_HUNDRED_TAGS;

  static Serializer<GContainerExpirationPolicyKeepEnum> get serializer =>
      _$gContainerExpirationPolicyKeepEnumSerializer;
  static BuiltSet<GContainerExpirationPolicyKeepEnum> get values =>
      _$gContainerExpirationPolicyKeepEnumValues;
  static GContainerExpirationPolicyKeepEnum valueOf(String name) =>
      _$gContainerExpirationPolicyKeepEnumValueOf(name);
}

class GContainerExpirationPolicyOlderThanEnum extends EnumClass {
  const GContainerExpirationPolicyOlderThanEnum._(String name) : super(name);

  static const GContainerExpirationPolicyOlderThanEnum SEVEN_DAYS =
      _$gContainerExpirationPolicyOlderThanEnumSEVEN_DAYS;

  static const GContainerExpirationPolicyOlderThanEnum FOURTEEN_DAYS =
      _$gContainerExpirationPolicyOlderThanEnumFOURTEEN_DAYS;

  static const GContainerExpirationPolicyOlderThanEnum THIRTY_DAYS =
      _$gContainerExpirationPolicyOlderThanEnumTHIRTY_DAYS;

  static const GContainerExpirationPolicyOlderThanEnum SIXTY_DAYS =
      _$gContainerExpirationPolicyOlderThanEnumSIXTY_DAYS;

  static const GContainerExpirationPolicyOlderThanEnum NINETY_DAYS =
      _$gContainerExpirationPolicyOlderThanEnumNINETY_DAYS;

  static Serializer<GContainerExpirationPolicyOlderThanEnum> get serializer =>
      _$gContainerExpirationPolicyOlderThanEnumSerializer;
  static BuiltSet<GContainerExpirationPolicyOlderThanEnum> get values =>
      _$gContainerExpirationPolicyOlderThanEnumValues;
  static GContainerExpirationPolicyOlderThanEnum valueOf(String name) =>
      _$gContainerExpirationPolicyOlderThanEnumValueOf(name);
}

class GContainerRepositoryCleanupStatus extends EnumClass {
  const GContainerRepositoryCleanupStatus._(String name) : super(name);

  static const GContainerRepositoryCleanupStatus UNSCHEDULED =
      _$gContainerRepositoryCleanupStatusUNSCHEDULED;

  static const GContainerRepositoryCleanupStatus SCHEDULED =
      _$gContainerRepositoryCleanupStatusSCHEDULED;

  static const GContainerRepositoryCleanupStatus UNFINISHED =
      _$gContainerRepositoryCleanupStatusUNFINISHED;

  static const GContainerRepositoryCleanupStatus ONGOING =
      _$gContainerRepositoryCleanupStatusONGOING;

  static Serializer<GContainerRepositoryCleanupStatus> get serializer =>
      _$gContainerRepositoryCleanupStatusSerializer;
  static BuiltSet<GContainerRepositoryCleanupStatus> get values =>
      _$gContainerRepositoryCleanupStatusValues;
  static GContainerRepositoryCleanupStatus valueOf(String name) =>
      _$gContainerRepositoryCleanupStatusValueOf(name);
}

abstract class GContainerRepositoryID
    implements Built<GContainerRepositoryID, GContainerRepositoryIDBuilder> {
  GContainerRepositoryID._();

  factory GContainerRepositoryID([String? value]) =>
      _$GContainerRepositoryID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GContainerRepositoryID> get serializer =>
      _i2.DefaultScalarSerializer<GContainerRepositoryID>((Object serialized) =>
          GContainerRepositoryID((serialized as String?)));
}

class GContainerRepositorySort extends EnumClass {
  const GContainerRepositorySort._(String name) : super(name);

  static const GContainerRepositorySort NAME_ASC =
      _$gContainerRepositorySortNAME_ASC;

  static const GContainerRepositorySort NAME_DESC =
      _$gContainerRepositorySortNAME_DESC;

  static const GContainerRepositorySort updated_desc =
      _$gContainerRepositorySortupdated_desc;

  static const GContainerRepositorySort updated_asc =
      _$gContainerRepositorySortupdated_asc;

  static const GContainerRepositorySort created_desc =
      _$gContainerRepositorySortcreated_desc;

  static const GContainerRepositorySort created_asc =
      _$gContainerRepositorySortcreated_asc;

  static const GContainerRepositorySort UPDATED_DESC =
      _$gContainerRepositorySortUPDATED_DESC;

  static const GContainerRepositorySort UPDATED_ASC =
      _$gContainerRepositorySortUPDATED_ASC;

  static const GContainerRepositorySort CREATED_DESC =
      _$gContainerRepositorySortCREATED_DESC;

  static const GContainerRepositorySort CREATED_ASC =
      _$gContainerRepositorySortCREATED_ASC;

  static Serializer<GContainerRepositorySort> get serializer =>
      _$gContainerRepositorySortSerializer;
  static BuiltSet<GContainerRepositorySort> get values =>
      _$gContainerRepositorySortValues;
  static GContainerRepositorySort valueOf(String name) =>
      _$gContainerRepositorySortValueOf(name);
}

class GContainerRepositoryStatus extends EnumClass {
  const GContainerRepositoryStatus._(String name) : super(name);

  static const GContainerRepositoryStatus DELETE_SCHEDULED =
      _$gContainerRepositoryStatusDELETE_SCHEDULED;

  static const GContainerRepositoryStatus DELETE_FAILED =
      _$gContainerRepositoryStatusDELETE_FAILED;

  static Serializer<GContainerRepositoryStatus> get serializer =>
      _$gContainerRepositoryStatusSerializer;
  static BuiltSet<GContainerRepositoryStatus> get values =>
      _$gContainerRepositoryStatusValues;
  static GContainerRepositoryStatus valueOf(String name) =>
      _$gContainerRepositoryStatusValueOf(name);
}

class GContainerRepositoryTagSort extends EnumClass {
  const GContainerRepositoryTagSort._(String name) : super(name);

  static const GContainerRepositoryTagSort NAME_ASC =
      _$gContainerRepositoryTagSortNAME_ASC;

  static const GContainerRepositoryTagSort NAME_DESC =
      _$gContainerRepositoryTagSortNAME_DESC;

  static Serializer<GContainerRepositoryTagSort> get serializer =>
      _$gContainerRepositoryTagSortSerializer;
  static BuiltSet<GContainerRepositoryTagSort> get values =>
      _$gContainerRepositoryTagSortValues;
  static GContainerRepositoryTagSort valueOf(String name) =>
      _$gContainerRepositoryTagSortValueOf(name);
}

abstract class GCorpusCreateInput
    implements Built<GCorpusCreateInput, GCorpusCreateInputBuilder> {
  GCorpusCreateInput._();

  factory GCorpusCreateInput([Function(GCorpusCreateInputBuilder b) updates]) =
      _$GCorpusCreateInput;

  String? get clientMutationId;
  GPackagesPackageID get packageId;
  String get fullPath;
  static Serializer<GCorpusCreateInput> get serializer =>
      _$gCorpusCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCorpusCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCorpusCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCorpusCreateInput.serializer,
        json,
      );
}

abstract class GCreateAlertIssueInput
    implements Built<GCreateAlertIssueInput, GCreateAlertIssueInputBuilder> {
  GCreateAlertIssueInput._();

  factory GCreateAlertIssueInput(
          [Function(GCreateAlertIssueInputBuilder b) updates]) =
      _$GCreateAlertIssueInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  static Serializer<GCreateAlertIssueInput> get serializer =>
      _$gCreateAlertIssueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAlertIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateAlertIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAlertIssueInput.serializer,
        json,
      );
}

abstract class GCreateAnnotationInput
    implements Built<GCreateAnnotationInput, GCreateAnnotationInputBuilder> {
  GCreateAnnotationInput._();

  factory GCreateAnnotationInput(
          [Function(GCreateAnnotationInputBuilder b) updates]) =
      _$GCreateAnnotationInput;

  String? get clientMutationId;
  GEnvironmentID? get environmentId;
  GClustersClusterID? get clusterId;
  GTime get startingAt;
  GTime? get endingAt;
  String get dashboardPath;
  String get description;
  static Serializer<GCreateAnnotationInput> get serializer =>
      _$gCreateAnnotationInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateAnnotationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateAnnotationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateAnnotationInput.serializer,
        json,
      );
}

abstract class GCreateBoardInput
    implements Built<GCreateBoardInput, GCreateBoardInputBuilder> {
  GCreateBoardInput._();

  factory GCreateBoardInput([Function(GCreateBoardInputBuilder b) updates]) =
      _$GCreateBoardInput;

  String? get clientMutationId;
  String? get projectPath;
  String? get groupPath;
  String? get name;
  bool? get hideBacklogList;
  bool? get hideClosedList;
  GUserID? get assigneeId;
  GMilestoneID? get milestoneId;
  GIterationID? get iterationId;
  GIterationsCadenceID? get iterationCadenceId;
  int? get weight;
  BuiltList<String>? get labels;
  BuiltList<GLabelID>? get labelIds;
  static Serializer<GCreateBoardInput> get serializer =>
      _$gCreateBoardInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateBoardInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateBoardInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateBoardInput.serializer,
        json,
      );
}

abstract class GCreateBranchInput
    implements Built<GCreateBranchInput, GCreateBranchInputBuilder> {
  GCreateBranchInput._();

  factory GCreateBranchInput([Function(GCreateBranchInputBuilder b) updates]) =
      _$GCreateBranchInput;

  String? get clientMutationId;
  String get projectPath;
  String get name;
  String get ref;
  static Serializer<GCreateBranchInput> get serializer =>
      _$gCreateBranchInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateBranchInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateBranchInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateBranchInput.serializer,
        json,
      );
}

abstract class GCreateClusterAgentInput
    implements
        Built<GCreateClusterAgentInput, GCreateClusterAgentInputBuilder> {
  GCreateClusterAgentInput._();

  factory GCreateClusterAgentInput(
          [Function(GCreateClusterAgentInputBuilder b) updates]) =
      _$GCreateClusterAgentInput;

  String? get clientMutationId;
  String get projectPath;
  String get name;
  static Serializer<GCreateClusterAgentInput> get serializer =>
      _$gCreateClusterAgentInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateClusterAgentInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateClusterAgentInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateClusterAgentInput.serializer,
        json,
      );
}

abstract class GCreateComplianceFrameworkInput
    implements
        Built<GCreateComplianceFrameworkInput,
            GCreateComplianceFrameworkInputBuilder> {
  GCreateComplianceFrameworkInput._();

  factory GCreateComplianceFrameworkInput(
          [Function(GCreateComplianceFrameworkInputBuilder b) updates]) =
      _$GCreateComplianceFrameworkInput;

  String? get clientMutationId;
  String get namespacePath;
  GComplianceFrameworkInput get params;
  static Serializer<GCreateComplianceFrameworkInput> get serializer =>
      _$gCreateComplianceFrameworkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateComplianceFrameworkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateComplianceFrameworkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateComplianceFrameworkInput.serializer,
        json,
      );
}

abstract class GCreateCustomEmojiInput
    implements Built<GCreateCustomEmojiInput, GCreateCustomEmojiInputBuilder> {
  GCreateCustomEmojiInput._();

  factory GCreateCustomEmojiInput(
          [Function(GCreateCustomEmojiInputBuilder b) updates]) =
      _$GCreateCustomEmojiInput;

  String? get clientMutationId;
  String get groupPath;
  String get name;
  String get url;
  static Serializer<GCreateCustomEmojiInput> get serializer =>
      _$gCreateCustomEmojiInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateCustomEmojiInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateCustomEmojiInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateCustomEmojiInput.serializer,
        json,
      );
}

abstract class GCreateDiffNoteInput
    implements Built<GCreateDiffNoteInput, GCreateDiffNoteInputBuilder> {
  GCreateDiffNoteInput._();

  factory GCreateDiffNoteInput(
          [Function(GCreateDiffNoteInputBuilder b) updates]) =
      _$GCreateDiffNoteInput;

  GNoteableID get noteableId;
  String get body;
  bool? get internal;
  String? get clientMutationId;
  GDiffPositionInput get position;
  static Serializer<GCreateDiffNoteInput> get serializer =>
      _$gCreateDiffNoteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateDiffNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateDiffNoteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateDiffNoteInput.serializer,
        json,
      );
}

abstract class GCreateEpicInput
    implements Built<GCreateEpicInput, GCreateEpicInputBuilder> {
  GCreateEpicInput._();

  factory GCreateEpicInput([Function(GCreateEpicInputBuilder b) updates]) =
      _$GCreateEpicInput;

  String? get clientMutationId;
  String get groupPath;
  String? get title;
  String? get description;
  bool? get confidential;
  String? get startDateFixed;
  String? get dueDateFixed;
  bool? get startDateIsFixed;
  bool? get dueDateIsFixed;
  BuiltList<String>? get addLabelIds;
  BuiltList<String>? get removeLabelIds;
  BuiltList<String>? get addLabels;
  GColor? get color;
  static Serializer<GCreateEpicInput> get serializer =>
      _$gCreateEpicInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateEpicInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateEpicInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateEpicInput.serializer,
        json,
      );
}

abstract class GCreateImageDiffNoteInput
    implements
        Built<GCreateImageDiffNoteInput, GCreateImageDiffNoteInputBuilder> {
  GCreateImageDiffNoteInput._();

  factory GCreateImageDiffNoteInput(
          [Function(GCreateImageDiffNoteInputBuilder b) updates]) =
      _$GCreateImageDiffNoteInput;

  GNoteableID get noteableId;
  String get body;
  bool? get internal;
  String? get clientMutationId;
  GDiffImagePositionInput get position;
  static Serializer<GCreateImageDiffNoteInput> get serializer =>
      _$gCreateImageDiffNoteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateImageDiffNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateImageDiffNoteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateImageDiffNoteInput.serializer,
        json,
      );
}

abstract class GCreateIssueInput
    implements Built<GCreateIssueInput, GCreateIssueInputBuilder> {
  GCreateIssueInput._();

  factory GCreateIssueInput([Function(GCreateIssueInputBuilder b) updates]) =
      _$GCreateIssueInput;

  String? get clientMutationId;
  String? get description;
  GISO8601Date? get dueDate;
  bool? get confidential;
  bool? get locked;
  GIssueType? get type;
  String get projectPath;
  int? get iid;
  String get title;
  GMilestoneID? get milestoneId;
  BuiltList<String>? get labels;
  BuiltList<GLabelID>? get labelIds;
  GTime? get createdAt;
  GMergeRequestID? get mergeRequestToResolveDiscussionsOf;
  String? get discussionToResolve;
  BuiltList<GUserID>? get assigneeIds;
  GIssueID? get moveBeforeId;
  GIssueID? get moveAfterId;
  GHealthStatus? get healthStatus;
  int? get weight;
  GEpicID? get epicId;
  GIterationID? get iterationId;
  GIssueCreationIterationWildcardId? get iterationWildcardId;
  GIterationsCadenceID? get iterationCadenceId;
  static Serializer<GCreateIssueInput> get serializer =>
      _$gCreateIssueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateIssueInput.serializer,
        json,
      );
}

abstract class GCreateIterationInput
    implements Built<GCreateIterationInput, GCreateIterationInputBuilder> {
  GCreateIterationInput._();

  factory GCreateIterationInput(
          [Function(GCreateIterationInputBuilder b) updates]) =
      _$GCreateIterationInput;

  String? get projectPath;
  String? get groupPath;
  GIterationsCadenceID? get iterationsCadenceId;
  String? get title;
  String? get description;
  String? get startDate;
  String? get dueDate;
  String? get clientMutationId;
  static Serializer<GCreateIterationInput> get serializer =>
      _$gCreateIterationInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateIterationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateIterationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateIterationInput.serializer,
        json,
      );
}

abstract class GCreateNoteInput
    implements Built<GCreateNoteInput, GCreateNoteInputBuilder> {
  GCreateNoteInput._();

  factory GCreateNoteInput([Function(GCreateNoteInputBuilder b) updates]) =
      _$GCreateNoteInput;

  GNoteableID get noteableId;
  String get body;
  bool? get internal;
  String? get clientMutationId;
  GDiscussionID? get discussionId;
  String? get mergeRequestDiffHeadSha;
  static Serializer<GCreateNoteInput> get serializer =>
      _$gCreateNoteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateNoteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateNoteInput.serializer,
        json,
      );
}

abstract class GCreateRequirementInput
    implements Built<GCreateRequirementInput, GCreateRequirementInputBuilder> {
  GCreateRequirementInput._();

  factory GCreateRequirementInput(
          [Function(GCreateRequirementInputBuilder b) updates]) =
      _$GCreateRequirementInput;

  String? get title;
  String? get description;
  String get projectPath;
  String? get clientMutationId;
  static Serializer<GCreateRequirementInput> get serializer =>
      _$gCreateRequirementInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateRequirementInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateRequirementInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateRequirementInput.serializer,
        json,
      );
}

abstract class GCreateSnippetInput
    implements Built<GCreateSnippetInput, GCreateSnippetInputBuilder> {
  GCreateSnippetInput._();

  factory GCreateSnippetInput(
      [Function(GCreateSnippetInputBuilder b) updates]) = _$GCreateSnippetInput;

  String? get clientMutationId;
  String get title;
  String? get description;
  GVisibilityLevelsEnum get visibilityLevel;
  String? get projectPath;
  BuiltList<String>? get uploadedFiles;
  BuiltList<GSnippetBlobActionInputType>? get blobActions;
  static Serializer<GCreateSnippetInput> get serializer =>
      _$gCreateSnippetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateSnippetInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateSnippetInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateSnippetInput.serializer,
        json,
      );
}

abstract class GCreateTestCaseInput
    implements Built<GCreateTestCaseInput, GCreateTestCaseInputBuilder> {
  GCreateTestCaseInput._();

  factory GCreateTestCaseInput(
          [Function(GCreateTestCaseInputBuilder b) updates]) =
      _$GCreateTestCaseInput;

  String? get clientMutationId;
  String get title;
  String? get description;
  BuiltList<String>? get labelIds;
  String get projectPath;
  static Serializer<GCreateTestCaseInput> get serializer =>
      _$gCreateTestCaseInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCreateTestCaseInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCreateTestCaseInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCreateTestCaseInput.serializer,
        json,
      );
}

abstract class GCustomEmojiID
    implements Built<GCustomEmojiID, GCustomEmojiIDBuilder> {
  GCustomEmojiID._();

  factory GCustomEmojiID([String? value]) =>
      _$GCustomEmojiID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GCustomEmojiID> get serializer =>
      _i2.DefaultScalarSerializer<GCustomEmojiID>(
          (Object serialized) => GCustomEmojiID((serialized as String?)));
}

abstract class GCustomerRelationsContactCreateInput
    implements
        Built<GCustomerRelationsContactCreateInput,
            GCustomerRelationsContactCreateInputBuilder> {
  GCustomerRelationsContactCreateInput._();

  factory GCustomerRelationsContactCreateInput(
          [Function(GCustomerRelationsContactCreateInputBuilder b) updates]) =
      _$GCustomerRelationsContactCreateInput;

  String? get clientMutationId;
  GGroupID get groupId;
  GCustomerRelationsOrganizationID? get organizationId;
  String get firstName;
  String get lastName;
  String? get phone;
  String? get email;
  String? get description;
  static Serializer<GCustomerRelationsContactCreateInput> get serializer =>
      _$gCustomerRelationsContactCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCustomerRelationsContactCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCustomerRelationsContactCreateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCustomerRelationsContactCreateInput.serializer,
        json,
      );
}

abstract class GCustomerRelationsContactID
    implements
        Built<GCustomerRelationsContactID, GCustomerRelationsContactIDBuilder> {
  GCustomerRelationsContactID._();

  factory GCustomerRelationsContactID([String? value]) =>
      _$GCustomerRelationsContactID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GCustomerRelationsContactID> get serializer =>
      _i2.DefaultScalarSerializer<GCustomerRelationsContactID>(
          (Object serialized) =>
              GCustomerRelationsContactID((serialized as String?)));
}

class GCustomerRelationsContactState extends EnumClass {
  const GCustomerRelationsContactState._(String name) : super(name);

  static const GCustomerRelationsContactState all =
      _$gCustomerRelationsContactStateall;

  static const GCustomerRelationsContactState active =
      _$gCustomerRelationsContactStateactive;

  static const GCustomerRelationsContactState inactive =
      _$gCustomerRelationsContactStateinactive;

  static Serializer<GCustomerRelationsContactState> get serializer =>
      _$gCustomerRelationsContactStateSerializer;
  static BuiltSet<GCustomerRelationsContactState> get values =>
      _$gCustomerRelationsContactStateValues;
  static GCustomerRelationsContactState valueOf(String name) =>
      _$gCustomerRelationsContactStateValueOf(name);
}

abstract class GCustomerRelationsContactUpdateInput
    implements
        Built<GCustomerRelationsContactUpdateInput,
            GCustomerRelationsContactUpdateInputBuilder> {
  GCustomerRelationsContactUpdateInput._();

  factory GCustomerRelationsContactUpdateInput(
          [Function(GCustomerRelationsContactUpdateInputBuilder b) updates]) =
      _$GCustomerRelationsContactUpdateInput;

  String? get clientMutationId;
  GCustomerRelationsContactID get id;
  GCustomerRelationsOrganizationID? get organizationId;
  String? get firstName;
  String? get lastName;
  String? get phone;
  String? get email;
  String? get description;
  bool? get active;
  static Serializer<GCustomerRelationsContactUpdateInput> get serializer =>
      _$gCustomerRelationsContactUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCustomerRelationsContactUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCustomerRelationsContactUpdateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCustomerRelationsContactUpdateInput.serializer,
        json,
      );
}

abstract class GCustomerRelationsOrganizationCreateInput
    implements
        Built<GCustomerRelationsOrganizationCreateInput,
            GCustomerRelationsOrganizationCreateInputBuilder> {
  GCustomerRelationsOrganizationCreateInput._();

  factory GCustomerRelationsOrganizationCreateInput(
      [Function(GCustomerRelationsOrganizationCreateInputBuilder b)
          updates]) = _$GCustomerRelationsOrganizationCreateInput;

  String? get clientMutationId;
  GGroupID get groupId;
  String get name;
  double? get defaultRate;
  String? get description;
  static Serializer<GCustomerRelationsOrganizationCreateInput> get serializer =>
      _$gCustomerRelationsOrganizationCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCustomerRelationsOrganizationCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCustomerRelationsOrganizationCreateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCustomerRelationsOrganizationCreateInput.serializer,
        json,
      );
}

abstract class GCustomerRelationsOrganizationID
    implements
        Built<GCustomerRelationsOrganizationID,
            GCustomerRelationsOrganizationIDBuilder> {
  GCustomerRelationsOrganizationID._();

  factory GCustomerRelationsOrganizationID([String? value]) =>
      _$GCustomerRelationsOrganizationID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GCustomerRelationsOrganizationID> get serializer =>
      _i2.DefaultScalarSerializer<GCustomerRelationsOrganizationID>(
          (Object serialized) =>
              GCustomerRelationsOrganizationID((serialized as String?)));
}

class GCustomerRelationsOrganizationState extends EnumClass {
  const GCustomerRelationsOrganizationState._(String name) : super(name);

  static const GCustomerRelationsOrganizationState all =
      _$gCustomerRelationsOrganizationStateall;

  static const GCustomerRelationsOrganizationState active =
      _$gCustomerRelationsOrganizationStateactive;

  static const GCustomerRelationsOrganizationState inactive =
      _$gCustomerRelationsOrganizationStateinactive;

  static Serializer<GCustomerRelationsOrganizationState> get serializer =>
      _$gCustomerRelationsOrganizationStateSerializer;
  static BuiltSet<GCustomerRelationsOrganizationState> get values =>
      _$gCustomerRelationsOrganizationStateValues;
  static GCustomerRelationsOrganizationState valueOf(String name) =>
      _$gCustomerRelationsOrganizationStateValueOf(name);
}

abstract class GCustomerRelationsOrganizationUpdateInput
    implements
        Built<GCustomerRelationsOrganizationUpdateInput,
            GCustomerRelationsOrganizationUpdateInputBuilder> {
  GCustomerRelationsOrganizationUpdateInput._();

  factory GCustomerRelationsOrganizationUpdateInput(
      [Function(GCustomerRelationsOrganizationUpdateInputBuilder b)
          updates]) = _$GCustomerRelationsOrganizationUpdateInput;

  String? get clientMutationId;
  GCustomerRelationsOrganizationID get id;
  String? get name;
  double? get defaultRate;
  String? get description;
  bool? get active;
  static Serializer<GCustomerRelationsOrganizationUpdateInput> get serializer =>
      _$gCustomerRelationsOrganizationUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GCustomerRelationsOrganizationUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GCustomerRelationsOrganizationUpdateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCustomerRelationsOrganizationUpdateInput.serializer,
        json,
      );
}

abstract class GDastOnDemandScanCreateInput
    implements
        Built<GDastOnDemandScanCreateInput,
            GDastOnDemandScanCreateInputBuilder> {
  GDastOnDemandScanCreateInput._();

  factory GDastOnDemandScanCreateInput(
          [Function(GDastOnDemandScanCreateInputBuilder b) updates]) =
      _$GDastOnDemandScanCreateInput;

  String? get clientMutationId;
  String get fullPath;
  GDastSiteProfileID get dastSiteProfileId;
  GDastScannerProfileID? get dastScannerProfileId;
  static Serializer<GDastOnDemandScanCreateInput> get serializer =>
      _$gDastOnDemandScanCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastOnDemandScanCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastOnDemandScanCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastOnDemandScanCreateInput.serializer,
        json,
      );
}

abstract class GDastProfileCadenceInput
    implements
        Built<GDastProfileCadenceInput, GDastProfileCadenceInputBuilder> {
  GDastProfileCadenceInput._();

  factory GDastProfileCadenceInput(
          [Function(GDastProfileCadenceInputBuilder b) updates]) =
      _$GDastProfileCadenceInput;

  GDastProfileCadenceUnit? get unit;
  int? get duration;
  static Serializer<GDastProfileCadenceInput> get serializer =>
      _$gDastProfileCadenceInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastProfileCadenceInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastProfileCadenceInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastProfileCadenceInput.serializer,
        json,
      );
}

class GDastProfileCadenceUnit extends EnumClass {
  const GDastProfileCadenceUnit._(String name) : super(name);

  static const GDastProfileCadenceUnit DAY = _$gDastProfileCadenceUnitDAY;

  static const GDastProfileCadenceUnit WEEK = _$gDastProfileCadenceUnitWEEK;

  static const GDastProfileCadenceUnit MONTH = _$gDastProfileCadenceUnitMONTH;

  static const GDastProfileCadenceUnit YEAR = _$gDastProfileCadenceUnitYEAR;

  static Serializer<GDastProfileCadenceUnit> get serializer =>
      _$gDastProfileCadenceUnitSerializer;
  static BuiltSet<GDastProfileCadenceUnit> get values =>
      _$gDastProfileCadenceUnitValues;
  static GDastProfileCadenceUnit valueOf(String name) =>
      _$gDastProfileCadenceUnitValueOf(name);
}

abstract class GDastProfileCreateInput
    implements Built<GDastProfileCreateInput, GDastProfileCreateInputBuilder> {
  GDastProfileCreateInput._();

  factory GDastProfileCreateInput(
          [Function(GDastProfileCreateInputBuilder b) updates]) =
      _$GDastProfileCreateInput;

  String? get clientMutationId;
  String get fullPath;
  GDastProfileScheduleInput? get dastProfileSchedule;
  String get name;
  String? get description;
  String? get branchName;
  GDastSiteProfileID get dastSiteProfileId;
  GDastScannerProfileID get dastScannerProfileId;
  bool? get runAfterCreate;
  static Serializer<GDastProfileCreateInput> get serializer =>
      _$gDastProfileCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastProfileCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastProfileCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastProfileCreateInput.serializer,
        json,
      );
}

abstract class GDastProfileDeleteInput
    implements Built<GDastProfileDeleteInput, GDastProfileDeleteInputBuilder> {
  GDastProfileDeleteInput._();

  factory GDastProfileDeleteInput(
          [Function(GDastProfileDeleteInputBuilder b) updates]) =
      _$GDastProfileDeleteInput;

  String? get clientMutationId;
  GDastProfileID get id;
  static Serializer<GDastProfileDeleteInput> get serializer =>
      _$gDastProfileDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastProfileDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastProfileDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastProfileDeleteInput.serializer,
        json,
      );
}

abstract class GDastProfileID
    implements Built<GDastProfileID, GDastProfileIDBuilder> {
  GDastProfileID._();

  factory GDastProfileID([String? value]) =>
      _$GDastProfileID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDastProfileID> get serializer =>
      _i2.DefaultScalarSerializer<GDastProfileID>(
          (Object serialized) => GDastProfileID((serialized as String?)));
}

abstract class GDastProfileRunInput
    implements Built<GDastProfileRunInput, GDastProfileRunInputBuilder> {
  GDastProfileRunInput._();

  factory GDastProfileRunInput(
          [Function(GDastProfileRunInputBuilder b) updates]) =
      _$GDastProfileRunInput;

  String? get clientMutationId;
  GDastProfileID get id;
  static Serializer<GDastProfileRunInput> get serializer =>
      _$gDastProfileRunInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastProfileRunInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastProfileRunInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastProfileRunInput.serializer,
        json,
      );
}

abstract class GDastProfileScheduleID
    implements Built<GDastProfileScheduleID, GDastProfileScheduleIDBuilder> {
  GDastProfileScheduleID._();

  factory GDastProfileScheduleID([String? value]) =>
      _$GDastProfileScheduleID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDastProfileScheduleID> get serializer =>
      _i2.DefaultScalarSerializer<GDastProfileScheduleID>((Object serialized) =>
          GDastProfileScheduleID((serialized as String?)));
}

abstract class GDastProfileScheduleInput
    implements
        Built<GDastProfileScheduleInput, GDastProfileScheduleInputBuilder> {
  GDastProfileScheduleInput._();

  factory GDastProfileScheduleInput(
          [Function(GDastProfileScheduleInputBuilder b) updates]) =
      _$GDastProfileScheduleInput;

  bool? get active;
  GTime? get startsAt;
  String? get timezone;
  GDastProfileCadenceInput? get cadence;
  static Serializer<GDastProfileScheduleInput> get serializer =>
      _$gDastProfileScheduleInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastProfileScheduleInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastProfileScheduleInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastProfileScheduleInput.serializer,
        json,
      );
}

abstract class GDastProfileUpdateInput
    implements Built<GDastProfileUpdateInput, GDastProfileUpdateInputBuilder> {
  GDastProfileUpdateInput._();

  factory GDastProfileUpdateInput(
          [Function(GDastProfileUpdateInputBuilder b) updates]) =
      _$GDastProfileUpdateInput;

  String? get clientMutationId;
  GDastProfileID get id;
  GDastProfileScheduleInput? get dastProfileSchedule;
  String? get name;
  String? get description;
  String? get branchName;
  GDastSiteProfileID? get dastSiteProfileId;
  GDastScannerProfileID? get dastScannerProfileId;
  bool? get runAfterUpdate;
  static Serializer<GDastProfileUpdateInput> get serializer =>
      _$gDastProfileUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastProfileUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastProfileUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastProfileUpdateInput.serializer,
        json,
      );
}

class GDastScanMethodType extends EnumClass {
  const GDastScanMethodType._(String name) : super(name);

  static const GDastScanMethodType WEBSITE = _$gDastScanMethodTypeWEBSITE;

  static const GDastScanMethodType OPENAPI = _$gDastScanMethodTypeOPENAPI;

  static const GDastScanMethodType HAR = _$gDastScanMethodTypeHAR;

  static const GDastScanMethodType POSTMAN_COLLECTION =
      _$gDastScanMethodTypePOSTMAN_COLLECTION;

  static Serializer<GDastScanMethodType> get serializer =>
      _$gDastScanMethodTypeSerializer;
  static BuiltSet<GDastScanMethodType> get values =>
      _$gDastScanMethodTypeValues;
  static GDastScanMethodType valueOf(String name) =>
      _$gDastScanMethodTypeValueOf(name);
}

abstract class GDastScannerProfileCreateInput
    implements
        Built<GDastScannerProfileCreateInput,
            GDastScannerProfileCreateInputBuilder> {
  GDastScannerProfileCreateInput._();

  factory GDastScannerProfileCreateInput(
          [Function(GDastScannerProfileCreateInputBuilder b) updates]) =
      _$GDastScannerProfileCreateInput;

  String? get clientMutationId;
  String get fullPath;
  String get profileName;
  int? get spiderTimeout;
  int? get targetTimeout;
  GDastScanTypeEnum? get scanType;
  bool? get useAjaxSpider;
  bool? get showDebugMessages;
  static Serializer<GDastScannerProfileCreateInput> get serializer =>
      _$gDastScannerProfileCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastScannerProfileCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastScannerProfileCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastScannerProfileCreateInput.serializer,
        json,
      );
}

abstract class GDastScannerProfileDeleteInput
    implements
        Built<GDastScannerProfileDeleteInput,
            GDastScannerProfileDeleteInputBuilder> {
  GDastScannerProfileDeleteInput._();

  factory GDastScannerProfileDeleteInput(
          [Function(GDastScannerProfileDeleteInputBuilder b) updates]) =
      _$GDastScannerProfileDeleteInput;

  String? get clientMutationId;
  GDastScannerProfileID get id;
  static Serializer<GDastScannerProfileDeleteInput> get serializer =>
      _$gDastScannerProfileDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastScannerProfileDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastScannerProfileDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastScannerProfileDeleteInput.serializer,
        json,
      );
}

abstract class GDastScannerProfileID
    implements Built<GDastScannerProfileID, GDastScannerProfileIDBuilder> {
  GDastScannerProfileID._();

  factory GDastScannerProfileID([String? value]) =>
      _$GDastScannerProfileID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDastScannerProfileID> get serializer =>
      _i2.DefaultScalarSerializer<GDastScannerProfileID>((Object serialized) =>
          GDastScannerProfileID((serialized as String?)));
}

abstract class GDastScannerProfileUpdateInput
    implements
        Built<GDastScannerProfileUpdateInput,
            GDastScannerProfileUpdateInputBuilder> {
  GDastScannerProfileUpdateInput._();

  factory GDastScannerProfileUpdateInput(
          [Function(GDastScannerProfileUpdateInputBuilder b) updates]) =
      _$GDastScannerProfileUpdateInput;

  String? get clientMutationId;
  GDastScannerProfileID get id;
  String get profileName;
  int get spiderTimeout;
  int get targetTimeout;
  GDastScanTypeEnum? get scanType;
  bool? get useAjaxSpider;
  bool? get showDebugMessages;
  static Serializer<GDastScannerProfileUpdateInput> get serializer =>
      _$gDastScannerProfileUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastScannerProfileUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastScannerProfileUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastScannerProfileUpdateInput.serializer,
        json,
      );
}

class GDastScanTypeEnum extends EnumClass {
  const GDastScanTypeEnum._(String name) : super(name);

  static const GDastScanTypeEnum PASSIVE = _$gDastScanTypeEnumPASSIVE;

  static const GDastScanTypeEnum ACTIVE = _$gDastScanTypeEnumACTIVE;

  static Serializer<GDastScanTypeEnum> get serializer =>
      _$gDastScanTypeEnumSerializer;
  static BuiltSet<GDastScanTypeEnum> get values => _$gDastScanTypeEnumValues;
  static GDastScanTypeEnum valueOf(String name) =>
      _$gDastScanTypeEnumValueOf(name);
}

abstract class GDastSiteProfileAuthInput
    implements
        Built<GDastSiteProfileAuthInput, GDastSiteProfileAuthInputBuilder> {
  GDastSiteProfileAuthInput._();

  factory GDastSiteProfileAuthInput(
          [Function(GDastSiteProfileAuthInputBuilder b) updates]) =
      _$GDastSiteProfileAuthInput;

  bool? get enabled;
  String? get url;
  String? get usernameField;
  String? get passwordField;
  String? get username;
  String? get password;
  String? get submitField;
  static Serializer<GDastSiteProfileAuthInput> get serializer =>
      _$gDastSiteProfileAuthInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastSiteProfileAuthInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastSiteProfileAuthInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastSiteProfileAuthInput.serializer,
        json,
      );
}

abstract class GDastSiteProfileCreateInput
    implements
        Built<GDastSiteProfileCreateInput, GDastSiteProfileCreateInputBuilder> {
  GDastSiteProfileCreateInput._();

  factory GDastSiteProfileCreateInput(
          [Function(GDastSiteProfileCreateInputBuilder b) updates]) =
      _$GDastSiteProfileCreateInput;

  String? get clientMutationId;
  String get profileName;
  String? get targetUrl;
  GDastTargetTypeEnum? get targetType;
  GDastScanMethodType? get scanMethod;
  String? get requestHeaders;
  GDastSiteProfileAuthInput? get auth;
  String get fullPath;
  BuiltList<String>? get excludedUrls;
  static Serializer<GDastSiteProfileCreateInput> get serializer =>
      _$gDastSiteProfileCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastSiteProfileCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastSiteProfileCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastSiteProfileCreateInput.serializer,
        json,
      );
}

abstract class GDastSiteProfileDeleteInput
    implements
        Built<GDastSiteProfileDeleteInput, GDastSiteProfileDeleteInputBuilder> {
  GDastSiteProfileDeleteInput._();

  factory GDastSiteProfileDeleteInput(
          [Function(GDastSiteProfileDeleteInputBuilder b) updates]) =
      _$GDastSiteProfileDeleteInput;

  String? get clientMutationId;
  GDastSiteProfileID get id;
  static Serializer<GDastSiteProfileDeleteInput> get serializer =>
      _$gDastSiteProfileDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastSiteProfileDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastSiteProfileDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastSiteProfileDeleteInput.serializer,
        json,
      );
}

abstract class GDastSiteProfileID
    implements Built<GDastSiteProfileID, GDastSiteProfileIDBuilder> {
  GDastSiteProfileID._();

  factory GDastSiteProfileID([String? value]) =>
      _$GDastSiteProfileID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDastSiteProfileID> get serializer =>
      _i2.DefaultScalarSerializer<GDastSiteProfileID>(
          (Object serialized) => GDastSiteProfileID((serialized as String?)));
}

abstract class GDastSiteProfileUpdateInput
    implements
        Built<GDastSiteProfileUpdateInput, GDastSiteProfileUpdateInputBuilder> {
  GDastSiteProfileUpdateInput._();

  factory GDastSiteProfileUpdateInput(
          [Function(GDastSiteProfileUpdateInputBuilder b) updates]) =
      _$GDastSiteProfileUpdateInput;

  String? get clientMutationId;
  String get profileName;
  String? get targetUrl;
  GDastTargetTypeEnum? get targetType;
  GDastScanMethodType? get scanMethod;
  String? get requestHeaders;
  GDastSiteProfileAuthInput? get auth;
  GDastSiteProfileID get id;
  BuiltList<String>? get excludedUrls;
  static Serializer<GDastSiteProfileUpdateInput> get serializer =>
      _$gDastSiteProfileUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastSiteProfileUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastSiteProfileUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastSiteProfileUpdateInput.serializer,
        json,
      );
}

class GDastSiteProfileValidationStatusEnum extends EnumClass {
  const GDastSiteProfileValidationStatusEnum._(String name) : super(name);

  static const GDastSiteProfileValidationStatusEnum NONE =
      _$gDastSiteProfileValidationStatusEnumNONE;

  static const GDastSiteProfileValidationStatusEnum PENDING_VALIDATION =
      _$gDastSiteProfileValidationStatusEnumPENDING_VALIDATION;

  static const GDastSiteProfileValidationStatusEnum INPROGRESS_VALIDATION =
      _$gDastSiteProfileValidationStatusEnumINPROGRESS_VALIDATION;

  static const GDastSiteProfileValidationStatusEnum PASSED_VALIDATION =
      _$gDastSiteProfileValidationStatusEnumPASSED_VALIDATION;

  static const GDastSiteProfileValidationStatusEnum FAILED_VALIDATION =
      _$gDastSiteProfileValidationStatusEnumFAILED_VALIDATION;

  static Serializer<GDastSiteProfileValidationStatusEnum> get serializer =>
      _$gDastSiteProfileValidationStatusEnumSerializer;
  static BuiltSet<GDastSiteProfileValidationStatusEnum> get values =>
      _$gDastSiteProfileValidationStatusEnumValues;
  static GDastSiteProfileValidationStatusEnum valueOf(String name) =>
      _$gDastSiteProfileValidationStatusEnumValueOf(name);
}

abstract class GDastSiteTokenCreateInput
    implements
        Built<GDastSiteTokenCreateInput, GDastSiteTokenCreateInputBuilder> {
  GDastSiteTokenCreateInput._();

  factory GDastSiteTokenCreateInput(
          [Function(GDastSiteTokenCreateInputBuilder b) updates]) =
      _$GDastSiteTokenCreateInput;

  String? get clientMutationId;
  String get fullPath;
  String? get targetUrl;
  static Serializer<GDastSiteTokenCreateInput> get serializer =>
      _$gDastSiteTokenCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastSiteTokenCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastSiteTokenCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastSiteTokenCreateInput.serializer,
        json,
      );
}

abstract class GDastSiteTokenID
    implements Built<GDastSiteTokenID, GDastSiteTokenIDBuilder> {
  GDastSiteTokenID._();

  factory GDastSiteTokenID([String? value]) =>
      _$GDastSiteTokenID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDastSiteTokenID> get serializer =>
      _i2.DefaultScalarSerializer<GDastSiteTokenID>(
          (Object serialized) => GDastSiteTokenID((serialized as String?)));
}

abstract class GDastSiteValidationCreateInput
    implements
        Built<GDastSiteValidationCreateInput,
            GDastSiteValidationCreateInputBuilder> {
  GDastSiteValidationCreateInput._();

  factory GDastSiteValidationCreateInput(
          [Function(GDastSiteValidationCreateInputBuilder b) updates]) =
      _$GDastSiteValidationCreateInput;

  String? get clientMutationId;
  String get fullPath;
  GDastSiteTokenID get dastSiteTokenId;
  String get validationPath;
  GDastSiteValidationStrategyEnum? get strategy;
  static Serializer<GDastSiteValidationCreateInput> get serializer =>
      _$gDastSiteValidationCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastSiteValidationCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastSiteValidationCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastSiteValidationCreateInput.serializer,
        json,
      );
}

abstract class GDastSiteValidationID
    implements Built<GDastSiteValidationID, GDastSiteValidationIDBuilder> {
  GDastSiteValidationID._();

  factory GDastSiteValidationID([String? value]) =>
      _$GDastSiteValidationID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDastSiteValidationID> get serializer =>
      _i2.DefaultScalarSerializer<GDastSiteValidationID>((Object serialized) =>
          GDastSiteValidationID((serialized as String?)));
}

abstract class GDastSiteValidationRevokeInput
    implements
        Built<GDastSiteValidationRevokeInput,
            GDastSiteValidationRevokeInputBuilder> {
  GDastSiteValidationRevokeInput._();

  factory GDastSiteValidationRevokeInput(
          [Function(GDastSiteValidationRevokeInputBuilder b) updates]) =
      _$GDastSiteValidationRevokeInput;

  String? get clientMutationId;
  String get fullPath;
  String get normalizedTargetUrl;
  static Serializer<GDastSiteValidationRevokeInput> get serializer =>
      _$gDastSiteValidationRevokeInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDastSiteValidationRevokeInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDastSiteValidationRevokeInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDastSiteValidationRevokeInput.serializer,
        json,
      );
}

class GDastSiteValidationStatusEnum extends EnumClass {
  const GDastSiteValidationStatusEnum._(String name) : super(name);

  static const GDastSiteValidationStatusEnum PENDING_VALIDATION =
      _$gDastSiteValidationStatusEnumPENDING_VALIDATION;

  static const GDastSiteValidationStatusEnum INPROGRESS_VALIDATION =
      _$gDastSiteValidationStatusEnumINPROGRESS_VALIDATION;

  static const GDastSiteValidationStatusEnum PASSED_VALIDATION =
      _$gDastSiteValidationStatusEnumPASSED_VALIDATION;

  static const GDastSiteValidationStatusEnum FAILED_VALIDATION =
      _$gDastSiteValidationStatusEnumFAILED_VALIDATION;

  static Serializer<GDastSiteValidationStatusEnum> get serializer =>
      _$gDastSiteValidationStatusEnumSerializer;
  static BuiltSet<GDastSiteValidationStatusEnum> get values =>
      _$gDastSiteValidationStatusEnumValues;
  static GDastSiteValidationStatusEnum valueOf(String name) =>
      _$gDastSiteValidationStatusEnumValueOf(name);
}

class GDastSiteValidationStrategyEnum extends EnumClass {
  const GDastSiteValidationStrategyEnum._(String name) : super(name);

  static const GDastSiteValidationStrategyEnum TEXT_FILE =
      _$gDastSiteValidationStrategyEnumTEXT_FILE;

  static const GDastSiteValidationStrategyEnum HEADER =
      _$gDastSiteValidationStrategyEnumHEADER;

  static const GDastSiteValidationStrategyEnum META_TAG =
      _$gDastSiteValidationStrategyEnumMETA_TAG;

  static Serializer<GDastSiteValidationStrategyEnum> get serializer =>
      _$gDastSiteValidationStrategyEnumSerializer;
  static BuiltSet<GDastSiteValidationStrategyEnum> get values =>
      _$gDastSiteValidationStrategyEnumValues;
  static GDastSiteValidationStrategyEnum valueOf(String name) =>
      _$gDastSiteValidationStrategyEnumValueOf(name);
}

class GDastTargetTypeEnum extends EnumClass {
  const GDastTargetTypeEnum._(String name) : super(name);

  static const GDastTargetTypeEnum WEBSITE = _$gDastTargetTypeEnumWEBSITE;

  static const GDastTargetTypeEnum API = _$gDastTargetTypeEnumAPI;

  static Serializer<GDastTargetTypeEnum> get serializer =>
      _$gDastTargetTypeEnumSerializer;
  static BuiltSet<GDastTargetTypeEnum> get values =>
      _$gDastTargetTypeEnumValues;
  static GDastTargetTypeEnum valueOf(String name) =>
      _$gDastTargetTypeEnumValueOf(name);
}

class GDataVisualizationColorEnum extends EnumClass {
  const GDataVisualizationColorEnum._(String name) : super(name);

  static const GDataVisualizationColorEnum BLUE =
      _$gDataVisualizationColorEnumBLUE;

  static const GDataVisualizationColorEnum ORANGE =
      _$gDataVisualizationColorEnumORANGE;

  static const GDataVisualizationColorEnum AQUA =
      _$gDataVisualizationColorEnumAQUA;

  static const GDataVisualizationColorEnum GREEN =
      _$gDataVisualizationColorEnumGREEN;

  static const GDataVisualizationColorEnum MAGENTA =
      _$gDataVisualizationColorEnumMAGENTA;

  static Serializer<GDataVisualizationColorEnum> get serializer =>
      _$gDataVisualizationColorEnumSerializer;
  static BuiltSet<GDataVisualizationColorEnum> get values =>
      _$gDataVisualizationColorEnumValues;
  static GDataVisualizationColorEnum valueOf(String name) =>
      _$gDataVisualizationColorEnumValueOf(name);
}

class GDataVisualizationWeightEnum extends EnumClass {
  const GDataVisualizationWeightEnum._(String name) : super(name);

  static const GDataVisualizationWeightEnum WEIGHT_50 =
      _$gDataVisualizationWeightEnumWEIGHT_50;

  static const GDataVisualizationWeightEnum WEIGHT_100 =
      _$gDataVisualizationWeightEnumWEIGHT_100;

  static const GDataVisualizationWeightEnum WEIGHT_200 =
      _$gDataVisualizationWeightEnumWEIGHT_200;

  static const GDataVisualizationWeightEnum WEIGHT_300 =
      _$gDataVisualizationWeightEnumWEIGHT_300;

  static const GDataVisualizationWeightEnum WEIGHT_400 =
      _$gDataVisualizationWeightEnumWEIGHT_400;

  static const GDataVisualizationWeightEnum WEIGHT_500 =
      _$gDataVisualizationWeightEnumWEIGHT_500;

  static const GDataVisualizationWeightEnum WEIGHT_600 =
      _$gDataVisualizationWeightEnumWEIGHT_600;

  static const GDataVisualizationWeightEnum WEIGHT_700 =
      _$gDataVisualizationWeightEnumWEIGHT_700;

  static const GDataVisualizationWeightEnum WEIGHT_800 =
      _$gDataVisualizationWeightEnumWEIGHT_800;

  static const GDataVisualizationWeightEnum WEIGHT_900 =
      _$gDataVisualizationWeightEnumWEIGHT_900;

  static const GDataVisualizationWeightEnum WEIGHT_950 =
      _$gDataVisualizationWeightEnumWEIGHT_950;

  static Serializer<GDataVisualizationWeightEnum> get serializer =>
      _$gDataVisualizationWeightEnumSerializer;
  static BuiltSet<GDataVisualizationWeightEnum> get values =>
      _$gDataVisualizationWeightEnumValues;
  static GDataVisualizationWeightEnum valueOf(String name) =>
      _$gDataVisualizationWeightEnumValueOf(name);
}

abstract class GDate implements Built<GDate, GDateBuilder> {
  GDate._();

  factory GDate([String? value]) =>
      _$GDate((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDate> get serializer => _i2.DefaultScalarSerializer<GDate>(
      (Object serialized) => GDate((serialized as String?)));
}

abstract class GDeleteAnnotationInput
    implements Built<GDeleteAnnotationInput, GDeleteAnnotationInputBuilder> {
  GDeleteAnnotationInput._();

  factory GDeleteAnnotationInput(
          [Function(GDeleteAnnotationInputBuilder b) updates]) =
      _$GDeleteAnnotationInput;

  String? get clientMutationId;
  GMetricsDashboardAnnotationID get id;
  static Serializer<GDeleteAnnotationInput> get serializer =>
      _$gDeleteAnnotationInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeleteAnnotationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeleteAnnotationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeleteAnnotationInput.serializer,
        json,
      );
}

abstract class GDependencyProxyManifestID
    implements
        Built<GDependencyProxyManifestID, GDependencyProxyManifestIDBuilder> {
  GDependencyProxyManifestID._();

  factory GDependencyProxyManifestID([String? value]) =>
      _$GDependencyProxyManifestID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDependencyProxyManifestID> get serializer =>
      _i2.DefaultScalarSerializer<GDependencyProxyManifestID>(
          (Object serialized) =>
              GDependencyProxyManifestID((serialized as String?)));
}

class GDependencyProxyManifestStatus extends EnumClass {
  const GDependencyProxyManifestStatus._(String name) : super(name);

  static const GDependencyProxyManifestStatus DEFAULT =
      _$gDependencyProxyManifestStatusDEFAULT;

  static const GDependencyProxyManifestStatus PENDING_DESTRUCTION =
      _$gDependencyProxyManifestStatusPENDING_DESTRUCTION;

  static const GDependencyProxyManifestStatus PROCESSING =
      _$gDependencyProxyManifestStatusPROCESSING;

  static const GDependencyProxyManifestStatus ERROR =
      _$gDependencyProxyManifestStatusERROR;

  static Serializer<GDependencyProxyManifestStatus> get serializer =>
      _$gDependencyProxyManifestStatusSerializer;
  static BuiltSet<GDependencyProxyManifestStatus> get values =>
      _$gDependencyProxyManifestStatusValues;
  static GDependencyProxyManifestStatus valueOf(String name) =>
      _$gDependencyProxyManifestStatusValueOf(name);
}

abstract class GDeploymentsOrderByInput
    implements
        Built<GDeploymentsOrderByInput, GDeploymentsOrderByInputBuilder> {
  GDeploymentsOrderByInput._();

  factory GDeploymentsOrderByInput(
          [Function(GDeploymentsOrderByInputBuilder b) updates]) =
      _$GDeploymentsOrderByInput;

  GSortDirectionEnum? get createdAt;
  GSortDirectionEnum? get finishedAt;
  static Serializer<GDeploymentsOrderByInput> get serializer =>
      _$gDeploymentsOrderByInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDeploymentsOrderByInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDeploymentsOrderByInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDeploymentsOrderByInput.serializer,
        json,
      );
}

class GDeploymentStatus extends EnumClass {
  const GDeploymentStatus._(String name) : super(name);

  static const GDeploymentStatus CREATED = _$gDeploymentStatusCREATED;

  static const GDeploymentStatus RUNNING = _$gDeploymentStatusRUNNING;

  static const GDeploymentStatus SUCCESS = _$gDeploymentStatusSUCCESS;

  static const GDeploymentStatus FAILED = _$gDeploymentStatusFAILED;

  static const GDeploymentStatus CANCELED = _$gDeploymentStatusCANCELED;

  static const GDeploymentStatus SKIPPED = _$gDeploymentStatusSKIPPED;

  static const GDeploymentStatus BLOCKED = _$gDeploymentStatusBLOCKED;

  static Serializer<GDeploymentStatus> get serializer =>
      _$gDeploymentStatusSerializer;
  static BuiltSet<GDeploymentStatus> get values => _$gDeploymentStatusValues;
  static GDeploymentStatus valueOf(String name) =>
      _$gDeploymentStatusValueOf(name);
}

class GDeploymentTier extends EnumClass {
  const GDeploymentTier._(String name) : super(name);

  static const GDeploymentTier PRODUCTION = _$gDeploymentTierPRODUCTION;

  static const GDeploymentTier STAGING = _$gDeploymentTierSTAGING;

  static const GDeploymentTier TESTING = _$gDeploymentTierTESTING;

  static const GDeploymentTier DEVELOPMENT = _$gDeploymentTierDEVELOPMENT;

  static const GDeploymentTier OTHER = _$gDeploymentTierOTHER;

  static Serializer<GDeploymentTier> get serializer =>
      _$gDeploymentTierSerializer;
  static BuiltSet<GDeploymentTier> get values => _$gDeploymentTierValues;
  static GDeploymentTier valueOf(String name) => _$gDeploymentTierValueOf(name);
}

class GDesignCollectionCopyState extends EnumClass {
  const GDesignCollectionCopyState._(String name) : super(name);

  static const GDesignCollectionCopyState READY =
      _$gDesignCollectionCopyStateREADY;

  static const GDesignCollectionCopyState IN_PROGRESS =
      _$gDesignCollectionCopyStateIN_PROGRESS;

  static const GDesignCollectionCopyState ERROR =
      _$gDesignCollectionCopyStateERROR;

  static Serializer<GDesignCollectionCopyState> get serializer =>
      _$gDesignCollectionCopyStateSerializer;
  static BuiltSet<GDesignCollectionCopyState> get values =>
      _$gDesignCollectionCopyStateValues;
  static GDesignCollectionCopyState valueOf(String name) =>
      _$gDesignCollectionCopyStateValueOf(name);
}

abstract class GDesignManagementDeleteInput
    implements
        Built<GDesignManagementDeleteInput,
            GDesignManagementDeleteInputBuilder> {
  GDesignManagementDeleteInput._();

  factory GDesignManagementDeleteInput(
          [Function(GDesignManagementDeleteInputBuilder b) updates]) =
      _$GDesignManagementDeleteInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  BuiltList<String> get filenames;
  static Serializer<GDesignManagementDeleteInput> get serializer =>
      _$gDesignManagementDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDesignManagementDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDesignManagementDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDesignManagementDeleteInput.serializer,
        json,
      );
}

abstract class GDesignManagementDesignAtVersionID
    implements
        Built<GDesignManagementDesignAtVersionID,
            GDesignManagementDesignAtVersionIDBuilder> {
  GDesignManagementDesignAtVersionID._();

  factory GDesignManagementDesignAtVersionID([String? value]) =>
      _$GDesignManagementDesignAtVersionID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDesignManagementDesignAtVersionID> get serializer =>
      _i2.DefaultScalarSerializer<GDesignManagementDesignAtVersionID>(
          (Object serialized) =>
              GDesignManagementDesignAtVersionID((serialized as String?)));
}

abstract class GDesignManagementDesignID
    implements
        Built<GDesignManagementDesignID, GDesignManagementDesignIDBuilder> {
  GDesignManagementDesignID._();

  factory GDesignManagementDesignID([String? value]) =>
      _$GDesignManagementDesignID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDesignManagementDesignID> get serializer =>
      _i2.DefaultScalarSerializer<GDesignManagementDesignID>(
          (Object serialized) =>
              GDesignManagementDesignID((serialized as String?)));
}

abstract class GDesignManagementMoveInput
    implements
        Built<GDesignManagementMoveInput, GDesignManagementMoveInputBuilder> {
  GDesignManagementMoveInput._();

  factory GDesignManagementMoveInput(
          [Function(GDesignManagementMoveInputBuilder b) updates]) =
      _$GDesignManagementMoveInput;

  String? get clientMutationId;
  GDesignManagementDesignID get id;
  GDesignManagementDesignID? get previous;
  GDesignManagementDesignID? get next;
  static Serializer<GDesignManagementMoveInput> get serializer =>
      _$gDesignManagementMoveInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDesignManagementMoveInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDesignManagementMoveInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDesignManagementMoveInput.serializer,
        json,
      );
}

abstract class GDesignManagementUploadInput
    implements
        Built<GDesignManagementUploadInput,
            GDesignManagementUploadInputBuilder> {
  GDesignManagementUploadInput._();

  factory GDesignManagementUploadInput(
          [Function(GDesignManagementUploadInputBuilder b) updates]) =
      _$GDesignManagementUploadInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  BuiltList<GUpload> get files;
  static Serializer<GDesignManagementUploadInput> get serializer =>
      _$gDesignManagementUploadInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDesignManagementUploadInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDesignManagementUploadInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDesignManagementUploadInput.serializer,
        json,
      );
}

abstract class GDesignManagementVersionID
    implements
        Built<GDesignManagementVersionID, GDesignManagementVersionIDBuilder> {
  GDesignManagementVersionID._();

  factory GDesignManagementVersionID([String? value]) =>
      _$GDesignManagementVersionID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDesignManagementVersionID> get serializer =>
      _i2.DefaultScalarSerializer<GDesignManagementVersionID>(
          (Object serialized) =>
              GDesignManagementVersionID((serialized as String?)));
}

class GDesignVersionEvent extends EnumClass {
  const GDesignVersionEvent._(String name) : super(name);

  static const GDesignVersionEvent NONE = _$gDesignVersionEventNONE;

  static const GDesignVersionEvent CREATION = _$gDesignVersionEventCREATION;

  static const GDesignVersionEvent MODIFICATION =
      _$gDesignVersionEventMODIFICATION;

  static const GDesignVersionEvent DELETION = _$gDesignVersionEventDELETION;

  static Serializer<GDesignVersionEvent> get serializer =>
      _$gDesignVersionEventSerializer;
  static BuiltSet<GDesignVersionEvent> get values =>
      _$gDesignVersionEventValues;
  static GDesignVersionEvent valueOf(String name) =>
      _$gDesignVersionEventValueOf(name);
}

abstract class GDestroyBoardInput
    implements Built<GDestroyBoardInput, GDestroyBoardInputBuilder> {
  GDestroyBoardInput._();

  factory GDestroyBoardInput([Function(GDestroyBoardInputBuilder b) updates]) =
      _$GDestroyBoardInput;

  String? get clientMutationId;
  GBoardID get id;
  static Serializer<GDestroyBoardInput> get serializer =>
      _$gDestroyBoardInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyBoardInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyBoardInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyBoardInput.serializer,
        json,
      );
}

abstract class GDestroyBoardListInput
    implements Built<GDestroyBoardListInput, GDestroyBoardListInputBuilder> {
  GDestroyBoardListInput._();

  factory GDestroyBoardListInput(
          [Function(GDestroyBoardListInputBuilder b) updates]) =
      _$GDestroyBoardListInput;

  String? get clientMutationId;
  GListID get listId;
  static Serializer<GDestroyBoardListInput> get serializer =>
      _$gDestroyBoardListInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyBoardListInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyBoardListInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyBoardListInput.serializer,
        json,
      );
}

abstract class GDestroyComplianceFrameworkInput
    implements
        Built<GDestroyComplianceFrameworkInput,
            GDestroyComplianceFrameworkInputBuilder> {
  GDestroyComplianceFrameworkInput._();

  factory GDestroyComplianceFrameworkInput(
          [Function(GDestroyComplianceFrameworkInputBuilder b) updates]) =
      _$GDestroyComplianceFrameworkInput;

  String? get clientMutationId;
  GComplianceManagementFrameworkID get id;
  static Serializer<GDestroyComplianceFrameworkInput> get serializer =>
      _$gDestroyComplianceFrameworkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyComplianceFrameworkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyComplianceFrameworkInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyComplianceFrameworkInput.serializer,
        json,
      );
}

abstract class GDestroyContainerRepositoryInput
    implements
        Built<GDestroyContainerRepositoryInput,
            GDestroyContainerRepositoryInputBuilder> {
  GDestroyContainerRepositoryInput._();

  factory GDestroyContainerRepositoryInput(
          [Function(GDestroyContainerRepositoryInputBuilder b) updates]) =
      _$GDestroyContainerRepositoryInput;

  String? get clientMutationId;
  GContainerRepositoryID get id;
  static Serializer<GDestroyContainerRepositoryInput> get serializer =>
      _$gDestroyContainerRepositoryInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyContainerRepositoryInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyContainerRepositoryInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyContainerRepositoryInput.serializer,
        json,
      );
}

abstract class GDestroyContainerRepositoryTagsInput
    implements
        Built<GDestroyContainerRepositoryTagsInput,
            GDestroyContainerRepositoryTagsInputBuilder> {
  GDestroyContainerRepositoryTagsInput._();

  factory GDestroyContainerRepositoryTagsInput(
          [Function(GDestroyContainerRepositoryTagsInputBuilder b) updates]) =
      _$GDestroyContainerRepositoryTagsInput;

  String? get clientMutationId;
  GContainerRepositoryID get id;
  BuiltList<String> get tagNames;
  static Serializer<GDestroyContainerRepositoryTagsInput> get serializer =>
      _$gDestroyContainerRepositoryTagsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyContainerRepositoryTagsInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyContainerRepositoryTagsInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyContainerRepositoryTagsInput.serializer,
        json,
      );
}

abstract class GDestroyCustomEmojiInput
    implements
        Built<GDestroyCustomEmojiInput, GDestroyCustomEmojiInputBuilder> {
  GDestroyCustomEmojiInput._();

  factory GDestroyCustomEmojiInput(
          [Function(GDestroyCustomEmojiInputBuilder b) updates]) =
      _$GDestroyCustomEmojiInput;

  String? get clientMutationId;
  GCustomEmojiID get id;
  static Serializer<GDestroyCustomEmojiInput> get serializer =>
      _$gDestroyCustomEmojiInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyCustomEmojiInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyCustomEmojiInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyCustomEmojiInput.serializer,
        json,
      );
}

abstract class GDestroyEpicBoardInput
    implements Built<GDestroyEpicBoardInput, GDestroyEpicBoardInputBuilder> {
  GDestroyEpicBoardInput._();

  factory GDestroyEpicBoardInput(
          [Function(GDestroyEpicBoardInputBuilder b) updates]) =
      _$GDestroyEpicBoardInput;

  String? get clientMutationId;
  GBoardsEpicBoardID get id;
  static Serializer<GDestroyEpicBoardInput> get serializer =>
      _$gDestroyEpicBoardInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyEpicBoardInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyEpicBoardInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyEpicBoardInput.serializer,
        json,
      );
}

abstract class GDestroyNoteInput
    implements Built<GDestroyNoteInput, GDestroyNoteInputBuilder> {
  GDestroyNoteInput._();

  factory GDestroyNoteInput([Function(GDestroyNoteInputBuilder b) updates]) =
      _$GDestroyNoteInput;

  String? get clientMutationId;
  GNoteID get id;
  static Serializer<GDestroyNoteInput> get serializer =>
      _$gDestroyNoteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyNoteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyNoteInput.serializer,
        json,
      );
}

abstract class GDestroyPackageFileInput
    implements
        Built<GDestroyPackageFileInput, GDestroyPackageFileInputBuilder> {
  GDestroyPackageFileInput._();

  factory GDestroyPackageFileInput(
          [Function(GDestroyPackageFileInputBuilder b) updates]) =
      _$GDestroyPackageFileInput;

  String? get clientMutationId;
  GPackagesPackageFileID get id;
  static Serializer<GDestroyPackageFileInput> get serializer =>
      _$gDestroyPackageFileInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyPackageFileInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyPackageFileInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyPackageFileInput.serializer,
        json,
      );
}

abstract class GDestroyPackageFilesInput
    implements
        Built<GDestroyPackageFilesInput, GDestroyPackageFilesInputBuilder> {
  GDestroyPackageFilesInput._();

  factory GDestroyPackageFilesInput(
          [Function(GDestroyPackageFilesInputBuilder b) updates]) =
      _$GDestroyPackageFilesInput;

  String? get clientMutationId;
  String get projectPath;
  BuiltList<GPackagesPackageFileID> get ids;
  static Serializer<GDestroyPackageFilesInput> get serializer =>
      _$gDestroyPackageFilesInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyPackageFilesInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyPackageFilesInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyPackageFilesInput.serializer,
        json,
      );
}

abstract class GDestroyPackageInput
    implements Built<GDestroyPackageInput, GDestroyPackageInputBuilder> {
  GDestroyPackageInput._();

  factory GDestroyPackageInput(
          [Function(GDestroyPackageInputBuilder b) updates]) =
      _$GDestroyPackageInput;

  String? get clientMutationId;
  GPackagesPackageID get id;
  static Serializer<GDestroyPackageInput> get serializer =>
      _$gDestroyPackageInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroyPackageInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroyPackageInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroyPackageInput.serializer,
        json,
      );
}

abstract class GDestroySnippetInput
    implements Built<GDestroySnippetInput, GDestroySnippetInputBuilder> {
  GDestroySnippetInput._();

  factory GDestroySnippetInput(
          [Function(GDestroySnippetInputBuilder b) updates]) =
      _$GDestroySnippetInput;

  String? get clientMutationId;
  GSnippetID get id;
  static Serializer<GDestroySnippetInput> get serializer =>
      _$gDestroySnippetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDestroySnippetInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDestroySnippetInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDestroySnippetInput.serializer,
        json,
      );
}

class GDetailedMergeStatus extends EnumClass {
  const GDetailedMergeStatus._(String name) : super(name);

  static const GDetailedMergeStatus UNCHECKED = _$gDetailedMergeStatusUNCHECKED;

  static const GDetailedMergeStatus CHECKING = _$gDetailedMergeStatusCHECKING;

  static const GDetailedMergeStatus MERGEABLE = _$gDetailedMergeStatusMERGEABLE;

  static const GDetailedMergeStatus BROKEN_STATUS =
      _$gDetailedMergeStatusBROKEN_STATUS;

  static const GDetailedMergeStatus CI_MUST_PASS =
      _$gDetailedMergeStatusCI_MUST_PASS;

  static const GDetailedMergeStatus CI_STILL_RUNNING =
      _$gDetailedMergeStatusCI_STILL_RUNNING;

  static const GDetailedMergeStatus DISCUSSIONS_NOT_RESOLVED =
      _$gDetailedMergeStatusDISCUSSIONS_NOT_RESOLVED;

  static const GDetailedMergeStatus DRAFT_STATUS =
      _$gDetailedMergeStatusDRAFT_STATUS;

  static const GDetailedMergeStatus NOT_OPEN = _$gDetailedMergeStatusNOT_OPEN;

  static const GDetailedMergeStatus NOT_APPROVED =
      _$gDetailedMergeStatusNOT_APPROVED;

  static const GDetailedMergeStatus BLOCKED_STATUS =
      _$gDetailedMergeStatusBLOCKED_STATUS;

  static const GDetailedMergeStatus POLICIES_DENIED =
      _$gDetailedMergeStatusPOLICIES_DENIED;

  static Serializer<GDetailedMergeStatus> get serializer =>
      _$gDetailedMergeStatusSerializer;
  static BuiltSet<GDetailedMergeStatus> get values =>
      _$gDetailedMergeStatusValues;
  static GDetailedMergeStatus valueOf(String name) =>
      _$gDetailedMergeStatusValueOf(name);
}

abstract class GDiffImagePositionInput
    implements Built<GDiffImagePositionInput, GDiffImagePositionInputBuilder> {
  GDiffImagePositionInput._();

  factory GDiffImagePositionInput(
          [Function(GDiffImagePositionInputBuilder b) updates]) =
      _$GDiffImagePositionInput;

  String? get baseSha;
  String get headSha;
  String get startSha;
  GDiffPathsInput get paths;
  int get height;
  int get width;
  int get x;
  int get y;
  static Serializer<GDiffImagePositionInput> get serializer =>
      _$gDiffImagePositionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDiffImagePositionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDiffImagePositionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDiffImagePositionInput.serializer,
        json,
      );
}

abstract class GDiffNoteID implements Built<GDiffNoteID, GDiffNoteIDBuilder> {
  GDiffNoteID._();

  factory GDiffNoteID([String? value]) =>
      _$GDiffNoteID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDiffNoteID> get serializer =>
      _i2.DefaultScalarSerializer<GDiffNoteID>(
          (Object serialized) => GDiffNoteID((serialized as String?)));
}

abstract class GDiffPathsInput
    implements Built<GDiffPathsInput, GDiffPathsInputBuilder> {
  GDiffPathsInput._();

  factory GDiffPathsInput([Function(GDiffPathsInputBuilder b) updates]) =
      _$GDiffPathsInput;

  String? get newPath;
  String? get oldPath;
  static Serializer<GDiffPathsInput> get serializer =>
      _$gDiffPathsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDiffPathsInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDiffPathsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDiffPathsInput.serializer,
        json,
      );
}

abstract class GDiffPositionInput
    implements Built<GDiffPositionInput, GDiffPositionInputBuilder> {
  GDiffPositionInput._();

  factory GDiffPositionInput([Function(GDiffPositionInputBuilder b) updates]) =
      _$GDiffPositionInput;

  String? get baseSha;
  String get headSha;
  String get startSha;
  GDiffPathsInput get paths;
  int? get newLine;
  int? get oldLine;
  static Serializer<GDiffPositionInput> get serializer =>
      _$gDiffPositionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDiffPositionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDiffPositionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDiffPositionInput.serializer,
        json,
      );
}

class GDiffPositionType extends EnumClass {
  const GDiffPositionType._(String name) : super(name);

  static const GDiffPositionType text = _$gDiffPositionTypetext;

  static const GDiffPositionType image = _$gDiffPositionTypeimage;

  static Serializer<GDiffPositionType> get serializer =>
      _$gDiffPositionTypeSerializer;
  static BuiltSet<GDiffPositionType> get values => _$gDiffPositionTypeValues;
  static GDiffPositionType valueOf(String name) =>
      _$gDiffPositionTypeValueOf(name);
}

abstract class GDisableDevopsAdoptionNamespaceInput
    implements
        Built<GDisableDevopsAdoptionNamespaceInput,
            GDisableDevopsAdoptionNamespaceInputBuilder> {
  GDisableDevopsAdoptionNamespaceInput._();

  factory GDisableDevopsAdoptionNamespaceInput(
          [Function(GDisableDevopsAdoptionNamespaceInputBuilder b) updates]) =
      _$GDisableDevopsAdoptionNamespaceInput;

  String? get clientMutationId;
  BuiltList<GAnalyticsDevopsAdoptionEnabledNamespaceID> get id;
  static Serializer<GDisableDevopsAdoptionNamespaceInput> get serializer =>
      _$gDisableDevopsAdoptionNamespaceInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDisableDevopsAdoptionNamespaceInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDisableDevopsAdoptionNamespaceInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDisableDevopsAdoptionNamespaceInput.serializer,
        json,
      );
}

abstract class GDiscussionID
    implements Built<GDiscussionID, GDiscussionIDBuilder> {
  GDiscussionID._();

  factory GDiscussionID([String? value]) =>
      _$GDiscussionID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDiscussionID> get serializer =>
      _i2.DefaultScalarSerializer<GDiscussionID>(
          (Object serialized) => GDiscussionID((serialized as String?)));
}

abstract class GDiscussionToggleResolveInput
    implements
        Built<GDiscussionToggleResolveInput,
            GDiscussionToggleResolveInputBuilder> {
  GDiscussionToggleResolveInput._();

  factory GDiscussionToggleResolveInput(
          [Function(GDiscussionToggleResolveInputBuilder b) updates]) =
      _$GDiscussionToggleResolveInput;

  String? get clientMutationId;
  GDiscussionID get id;
  bool get resolve;
  static Serializer<GDiscussionToggleResolveInput> get serializer =>
      _$gDiscussionToggleResolveInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDiscussionToggleResolveInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GDiscussionToggleResolveInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDiscussionToggleResolveInput.serializer,
        json,
      );
}

class GDoraMetricBucketingInterval extends EnumClass {
  const GDoraMetricBucketingInterval._(String name) : super(name);

  static const GDoraMetricBucketingInterval ALL =
      _$gDoraMetricBucketingIntervalALL;

  static const GDoraMetricBucketingInterval MONTHLY =
      _$gDoraMetricBucketingIntervalMONTHLY;

  static const GDoraMetricBucketingInterval DAILY =
      _$gDoraMetricBucketingIntervalDAILY;

  static Serializer<GDoraMetricBucketingInterval> get serializer =>
      _$gDoraMetricBucketingIntervalSerializer;
  static BuiltSet<GDoraMetricBucketingInterval> get values =>
      _$gDoraMetricBucketingIntervalValues;
  static GDoraMetricBucketingInterval valueOf(String name) =>
      _$gDoraMetricBucketingIntervalValueOf(name);
}

class GDoraMetricType extends EnumClass {
  const GDoraMetricType._(String name) : super(name);

  static const GDoraMetricType DEPLOYMENT_FREQUENCY =
      _$gDoraMetricTypeDEPLOYMENT_FREQUENCY;

  static const GDoraMetricType LEAD_TIME_FOR_CHANGES =
      _$gDoraMetricTypeLEAD_TIME_FOR_CHANGES;

  static const GDoraMetricType TIME_TO_RESTORE_SERVICE =
      _$gDoraMetricTypeTIME_TO_RESTORE_SERVICE;

  static const GDoraMetricType CHANGE_FAILURE_RATE =
      _$gDoraMetricTypeCHANGE_FAILURE_RATE;

  static Serializer<GDoraMetricType> get serializer =>
      _$gDoraMetricTypeSerializer;
  static BuiltSet<GDoraMetricType> get values => _$gDoraMetricTypeValues;
  static GDoraMetricType valueOf(String name) => _$gDoraMetricTypeValueOf(name);
}

abstract class GDuration implements Built<GDuration, GDurationBuilder> {
  GDuration._();

  factory GDuration([String? value]) =>
      _$GDuration((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GDuration> get serializer =>
      _i2.DefaultScalarSerializer<GDuration>(
          (Object serialized) => GDuration((serialized as String?)));
}

abstract class GEchoCreateInput
    implements Built<GEchoCreateInput, GEchoCreateInputBuilder> {
  GEchoCreateInput._();

  factory GEchoCreateInput([Function(GEchoCreateInputBuilder b) updates]) =
      _$GEchoCreateInput;

  String? get clientMutationId;
  BuiltList<String>? get errors;
  BuiltList<String>? get messages;
  static Serializer<GEchoCreateInput> get serializer =>
      _$gEchoCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEchoCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEchoCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEchoCreateInput.serializer,
        json,
      );
}

abstract class GEnableDevopsAdoptionNamespaceInput
    implements
        Built<GEnableDevopsAdoptionNamespaceInput,
            GEnableDevopsAdoptionNamespaceInputBuilder> {
  GEnableDevopsAdoptionNamespaceInput._();

  factory GEnableDevopsAdoptionNamespaceInput(
          [Function(GEnableDevopsAdoptionNamespaceInputBuilder b) updates]) =
      _$GEnableDevopsAdoptionNamespaceInput;

  String? get clientMutationId;
  GNamespaceID get namespaceId;
  GNamespaceID? get displayNamespaceId;
  static Serializer<GEnableDevopsAdoptionNamespaceInput> get serializer =>
      _$gEnableDevopsAdoptionNamespaceInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEnableDevopsAdoptionNamespaceInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEnableDevopsAdoptionNamespaceInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEnableDevopsAdoptionNamespaceInput.serializer,
        json,
      );
}

class GEntryType extends EnumClass {
  const GEntryType._(String name) : super(name);

  static const GEntryType tree = _$gEntryTypetree;

  static const GEntryType blob = _$gEntryTypeblob;

  static const GEntryType commit = _$gEntryTypecommit;

  static Serializer<GEntryType> get serializer => _$gEntryTypeSerializer;
  static BuiltSet<GEntryType> get values => _$gEntryTypeValues;
  static GEntryType valueOf(String name) => _$gEntryTypeValueOf(name);
}

abstract class GEnvironmentID
    implements Built<GEnvironmentID, GEnvironmentIDBuilder> {
  GEnvironmentID._();

  factory GEnvironmentID([String? value]) =>
      _$GEnvironmentID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GEnvironmentID> get serializer =>
      _i2.DefaultScalarSerializer<GEnvironmentID>(
          (Object serialized) => GEnvironmentID((serialized as String?)));
}

abstract class GEnvironmentsCanaryIngressUpdateInput
    implements
        Built<GEnvironmentsCanaryIngressUpdateInput,
            GEnvironmentsCanaryIngressUpdateInputBuilder> {
  GEnvironmentsCanaryIngressUpdateInput._();

  factory GEnvironmentsCanaryIngressUpdateInput(
          [Function(GEnvironmentsCanaryIngressUpdateInputBuilder b) updates]) =
      _$GEnvironmentsCanaryIngressUpdateInput;

  String? get clientMutationId;
  GEnvironmentID get id;
  int get weight;
  static Serializer<GEnvironmentsCanaryIngressUpdateInput> get serializer =>
      _$gEnvironmentsCanaryIngressUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEnvironmentsCanaryIngressUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEnvironmentsCanaryIngressUpdateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEnvironmentsCanaryIngressUpdateInput.serializer,
        json,
      );
}

abstract class GEpicAddIssueInput
    implements Built<GEpicAddIssueInput, GEpicAddIssueInputBuilder> {
  GEpicAddIssueInput._();

  factory GEpicAddIssueInput([Function(GEpicAddIssueInputBuilder b) updates]) =
      _$GEpicAddIssueInput;

  String get iid;
  String get groupPath;
  String? get clientMutationId;
  String get projectPath;
  String get issueIid;
  static Serializer<GEpicAddIssueInput> get serializer =>
      _$gEpicAddIssueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEpicAddIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEpicAddIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEpicAddIssueInput.serializer,
        json,
      );
}

abstract class GEpicBoardCreateInput
    implements Built<GEpicBoardCreateInput, GEpicBoardCreateInputBuilder> {
  GEpicBoardCreateInput._();

  factory GEpicBoardCreateInput(
          [Function(GEpicBoardCreateInputBuilder b) updates]) =
      _$GEpicBoardCreateInput;

  String? get clientMutationId;
  String? get name;
  bool? get hideBacklogList;
  bool? get hideClosedList;
  BuiltList<String>? get labels;
  BuiltList<GLabelID>? get labelIds;
  String? get groupPath;
  static Serializer<GEpicBoardCreateInput> get serializer =>
      _$gEpicBoardCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEpicBoardCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEpicBoardCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEpicBoardCreateInput.serializer,
        json,
      );
}

abstract class GEpicBoardListCreateInput
    implements
        Built<GEpicBoardListCreateInput, GEpicBoardListCreateInputBuilder> {
  GEpicBoardListCreateInput._();

  factory GEpicBoardListCreateInput(
          [Function(GEpicBoardListCreateInputBuilder b) updates]) =
      _$GEpicBoardListCreateInput;

  bool? get backlog;
  GLabelID? get labelId;
  String? get clientMutationId;
  GBoardsEpicBoardID get boardId;
  static Serializer<GEpicBoardListCreateInput> get serializer =>
      _$gEpicBoardListCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEpicBoardListCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEpicBoardListCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEpicBoardListCreateInput.serializer,
        json,
      );
}

abstract class GEpicBoardListDestroyInput
    implements
        Built<GEpicBoardListDestroyInput, GEpicBoardListDestroyInputBuilder> {
  GEpicBoardListDestroyInput._();

  factory GEpicBoardListDestroyInput(
          [Function(GEpicBoardListDestroyInputBuilder b) updates]) =
      _$GEpicBoardListDestroyInput;

  String? get clientMutationId;
  GBoardsEpicListID get listId;
  static Serializer<GEpicBoardListDestroyInput> get serializer =>
      _$gEpicBoardListDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEpicBoardListDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEpicBoardListDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEpicBoardListDestroyInput.serializer,
        json,
      );
}

abstract class GEpicBoardUpdateInput
    implements Built<GEpicBoardUpdateInput, GEpicBoardUpdateInputBuilder> {
  GEpicBoardUpdateInput._();

  factory GEpicBoardUpdateInput(
          [Function(GEpicBoardUpdateInputBuilder b) updates]) =
      _$GEpicBoardUpdateInput;

  String? get clientMutationId;
  String? get name;
  bool? get hideBacklogList;
  bool? get hideClosedList;
  BuiltList<String>? get labels;
  BuiltList<GLabelID>? get labelIds;
  GBoardsEpicBoardID get id;
  static Serializer<GEpicBoardUpdateInput> get serializer =>
      _$gEpicBoardUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEpicBoardUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEpicBoardUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEpicBoardUpdateInput.serializer,
        json,
      );
}

abstract class GEpicFilters
    implements Built<GEpicFilters, GEpicFiltersBuilder> {
  GEpicFilters._();

  factory GEpicFilters([Function(GEpicFiltersBuilder b) updates]) =
      _$GEpicFilters;

  BuiltList<String>? get labelName;
  String? get authorUsername;
  String? get myReactionEmoji;
  GNegatedEpicBoardIssueInput? get not;
  String? get search;
  bool? get confidential;
  static Serializer<GEpicFilters> get serializer => _$gEpicFiltersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEpicFilters.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEpicFilters? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEpicFilters.serializer,
        json,
      );
}

abstract class GEpicID implements Built<GEpicID, GEpicIDBuilder> {
  GEpicID._();

  factory GEpicID([String? value]) =>
      _$GEpicID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GEpicID> get serializer =>
      _i2.DefaultScalarSerializer<GEpicID>(
          (Object serialized) => GEpicID((serialized as String?)));
}

abstract class GEpicMoveListInput
    implements Built<GEpicMoveListInput, GEpicMoveListInputBuilder> {
  GEpicMoveListInput._();

  factory GEpicMoveListInput([Function(GEpicMoveListInputBuilder b) updates]) =
      _$GEpicMoveListInput;

  String? get clientMutationId;
  GBoardsEpicBoardID get boardId;
  GEpicID get epicId;
  GBoardsEpicListID? get fromListId;
  GBoardsEpicListID get toListId;
  GEpicID? get moveBeforeId;
  GEpicID? get moveAfterId;
  static Serializer<GEpicMoveListInput> get serializer =>
      _$gEpicMoveListInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEpicMoveListInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEpicMoveListInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEpicMoveListInput.serializer,
        json,
      );
}

abstract class GEpicSetSubscriptionInput
    implements
        Built<GEpicSetSubscriptionInput, GEpicSetSubscriptionInputBuilder> {
  GEpicSetSubscriptionInput._();

  factory GEpicSetSubscriptionInput(
          [Function(GEpicSetSubscriptionInputBuilder b) updates]) =
      _$GEpicSetSubscriptionInput;

  String get iid;
  String get groupPath;
  String? get clientMutationId;
  bool get subscribedState;
  static Serializer<GEpicSetSubscriptionInput> get serializer =>
      _$gEpicSetSubscriptionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEpicSetSubscriptionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEpicSetSubscriptionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEpicSetSubscriptionInput.serializer,
        json,
      );
}

class GEpicSort extends EnumClass {
  const GEpicSort._(String name) : super(name);

  static const GEpicSort start_date_desc = _$gEpicSortstart_date_desc;

  static const GEpicSort start_date_asc = _$gEpicSortstart_date_asc;

  static const GEpicSort end_date_desc = _$gEpicSortend_date_desc;

  static const GEpicSort end_date_asc = _$gEpicSortend_date_asc;

  static const GEpicSort START_DATE_DESC = _$gEpicSortSTART_DATE_DESC;

  static const GEpicSort START_DATE_ASC = _$gEpicSortSTART_DATE_ASC;

  static const GEpicSort END_DATE_DESC = _$gEpicSortEND_DATE_DESC;

  static const GEpicSort END_DATE_ASC = _$gEpicSortEND_DATE_ASC;

  static const GEpicSort TITLE_DESC = _$gEpicSortTITLE_DESC;

  static const GEpicSort TITLE_ASC = _$gEpicSortTITLE_ASC;

  static const GEpicSort CREATED_AT_ASC = _$gEpicSortCREATED_AT_ASC;

  static const GEpicSort CREATED_AT_DESC = _$gEpicSortCREATED_AT_DESC;

  static const GEpicSort UPDATED_AT_ASC = _$gEpicSortUPDATED_AT_ASC;

  static const GEpicSort UPDATED_AT_DESC = _$gEpicSortUPDATED_AT_DESC;

  static Serializer<GEpicSort> get serializer => _$gEpicSortSerializer;
  static BuiltSet<GEpicSort> get values => _$gEpicSortValues;
  static GEpicSort valueOf(String name) => _$gEpicSortValueOf(name);
}

class GEpicState extends EnumClass {
  const GEpicState._(String name) : super(name);

  static const GEpicState all = _$gEpicStateall;

  static const GEpicState opened = _$gEpicStateopened;

  static const GEpicState closed = _$gEpicStateclosed;

  static Serializer<GEpicState> get serializer => _$gEpicStateSerializer;
  static BuiltSet<GEpicState> get values => _$gEpicStateValues;
  static GEpicState valueOf(String name) => _$gEpicStateValueOf(name);
}

class GEpicStateEvent extends EnumClass {
  const GEpicStateEvent._(String name) : super(name);

  static const GEpicStateEvent REOPEN = _$gEpicStateEventREOPEN;

  static const GEpicStateEvent CLOSE = _$gEpicStateEventCLOSE;

  static Serializer<GEpicStateEvent> get serializer =>
      _$gEpicStateEventSerializer;
  static BuiltSet<GEpicStateEvent> get values => _$gEpicStateEventValues;
  static GEpicStateEvent valueOf(String name) => _$gEpicStateEventValueOf(name);
}

abstract class GEpicTreeNodeFieldsInputType
    implements
        Built<GEpicTreeNodeFieldsInputType,
            GEpicTreeNodeFieldsInputTypeBuilder> {
  GEpicTreeNodeFieldsInputType._();

  factory GEpicTreeNodeFieldsInputType(
          [Function(GEpicTreeNodeFieldsInputTypeBuilder b) updates]) =
      _$GEpicTreeNodeFieldsInputType;

  GEpicTreeSortingID get id;
  GEpicTreeSortingID? get adjacentReferenceId;
  GMoveType? get relativePosition;
  GEpicID? get newParentId;
  static Serializer<GEpicTreeNodeFieldsInputType> get serializer =>
      _$gEpicTreeNodeFieldsInputTypeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEpicTreeNodeFieldsInputType.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEpicTreeNodeFieldsInputType? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEpicTreeNodeFieldsInputType.serializer,
        json,
      );
}

abstract class GEpicTreeReorderInput
    implements Built<GEpicTreeReorderInput, GEpicTreeReorderInputBuilder> {
  GEpicTreeReorderInput._();

  factory GEpicTreeReorderInput(
          [Function(GEpicTreeReorderInputBuilder b) updates]) =
      _$GEpicTreeReorderInput;

  String? get clientMutationId;
  GEpicID get baseEpicId;
  GEpicTreeNodeFieldsInputType get moved;
  static Serializer<GEpicTreeReorderInput> get serializer =>
      _$gEpicTreeReorderInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEpicTreeReorderInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEpicTreeReorderInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEpicTreeReorderInput.serializer,
        json,
      );
}

abstract class GEpicTreeSortingID
    implements Built<GEpicTreeSortingID, GEpicTreeSortingIDBuilder> {
  GEpicTreeSortingID._();

  factory GEpicTreeSortingID([String? value]) =>
      _$GEpicTreeSortingID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GEpicTreeSortingID> get serializer =>
      _i2.DefaultScalarSerializer<GEpicTreeSortingID>(
          (Object serialized) => GEpicTreeSortingID((serialized as String?)));
}

class GEpicWildcardId extends EnumClass {
  const GEpicWildcardId._(String name) : super(name);

  static const GEpicWildcardId NONE = _$gEpicWildcardIdNONE;

  static const GEpicWildcardId ANY = _$gEpicWildcardIdANY;

  static Serializer<GEpicWildcardId> get serializer =>
      _$gEpicWildcardIdSerializer;
  static BuiltSet<GEpicWildcardId> get values => _$gEpicWildcardIdValues;
  static GEpicWildcardId valueOf(String name) => _$gEpicWildcardIdValueOf(name);
}

abstract class GEscalationPolicyCreateInput
    implements
        Built<GEscalationPolicyCreateInput,
            GEscalationPolicyCreateInputBuilder> {
  GEscalationPolicyCreateInput._();

  factory GEscalationPolicyCreateInput(
          [Function(GEscalationPolicyCreateInputBuilder b) updates]) =
      _$GEscalationPolicyCreateInput;

  String? get clientMutationId;
  String get projectPath;
  String get name;
  String? get description;
  BuiltList<GEscalationRuleInput> get rules;
  static Serializer<GEscalationPolicyCreateInput> get serializer =>
      _$gEscalationPolicyCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEscalationPolicyCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEscalationPolicyCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEscalationPolicyCreateInput.serializer,
        json,
      );
}

abstract class GEscalationPolicyDestroyInput
    implements
        Built<GEscalationPolicyDestroyInput,
            GEscalationPolicyDestroyInputBuilder> {
  GEscalationPolicyDestroyInput._();

  factory GEscalationPolicyDestroyInput(
          [Function(GEscalationPolicyDestroyInputBuilder b) updates]) =
      _$GEscalationPolicyDestroyInput;

  String? get clientMutationId;
  GIncidentManagementEscalationPolicyID get id;
  static Serializer<GEscalationPolicyDestroyInput> get serializer =>
      _$gEscalationPolicyDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEscalationPolicyDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEscalationPolicyDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEscalationPolicyDestroyInput.serializer,
        json,
      );
}

abstract class GEscalationPolicyUpdateInput
    implements
        Built<GEscalationPolicyUpdateInput,
            GEscalationPolicyUpdateInputBuilder> {
  GEscalationPolicyUpdateInput._();

  factory GEscalationPolicyUpdateInput(
          [Function(GEscalationPolicyUpdateInputBuilder b) updates]) =
      _$GEscalationPolicyUpdateInput;

  String? get clientMutationId;
  GIncidentManagementEscalationPolicyID get id;
  String? get name;
  String? get description;
  BuiltList<GEscalationRuleInput>? get rules;
  static Serializer<GEscalationPolicyUpdateInput> get serializer =>
      _$gEscalationPolicyUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEscalationPolicyUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEscalationPolicyUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEscalationPolicyUpdateInput.serializer,
        json,
      );
}

abstract class GEscalationRuleInput
    implements Built<GEscalationRuleInput, GEscalationRuleInputBuilder> {
  GEscalationRuleInput._();

  factory GEscalationRuleInput(
          [Function(GEscalationRuleInputBuilder b) updates]) =
      _$GEscalationRuleInput;

  String? get oncallScheduleIid;
  String? get username;
  int get elapsedTimeSeconds;
  GEscalationRuleStatus get status;
  static Serializer<GEscalationRuleInput> get serializer =>
      _$gEscalationRuleInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GEscalationRuleInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GEscalationRuleInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GEscalationRuleInput.serializer,
        json,
      );
}

class GEscalationRuleStatus extends EnumClass {
  const GEscalationRuleStatus._(String name) : super(name);

  static const GEscalationRuleStatus ACKNOWLEDGED =
      _$gEscalationRuleStatusACKNOWLEDGED;

  static const GEscalationRuleStatus RESOLVED = _$gEscalationRuleStatusRESOLVED;

  static Serializer<GEscalationRuleStatus> get serializer =>
      _$gEscalationRuleStatusSerializer;
  static BuiltSet<GEscalationRuleStatus> get values =>
      _$gEscalationRuleStatusValues;
  static GEscalationRuleStatus valueOf(String name) =>
      _$gEscalationRuleStatusValueOf(name);
}

class GEventAction extends EnumClass {
  const GEventAction._(String name) : super(name);

  static const GEventAction CREATED = _$gEventActionCREATED;

  static const GEventAction UPDATED = _$gEventActionUPDATED;

  static const GEventAction CLOSED = _$gEventActionCLOSED;

  static const GEventAction REOPENED = _$gEventActionREOPENED;

  static const GEventAction PUSHED = _$gEventActionPUSHED;

  static const GEventAction COMMENTED = _$gEventActionCOMMENTED;

  static const GEventAction MERGED = _$gEventActionMERGED;

  static const GEventAction JOINED = _$gEventActionJOINED;

  static const GEventAction LEFT = _$gEventActionLEFT;

  static const GEventAction DESTROYED = _$gEventActionDESTROYED;

  static const GEventAction EXPIRED = _$gEventActionEXPIRED;

  static const GEventAction APPROVED = _$gEventActionAPPROVED;

  static Serializer<GEventAction> get serializer => _$gEventActionSerializer;
  static BuiltSet<GEventAction> get values => _$gEventActionValues;
  static GEventAction valueOf(String name) => _$gEventActionValueOf(name);
}

abstract class GExportRequirementsInput
    implements
        Built<GExportRequirementsInput, GExportRequirementsInputBuilder> {
  GExportRequirementsInput._();

  factory GExportRequirementsInput(
          [Function(GExportRequirementsInputBuilder b) updates]) =
      _$GExportRequirementsInput;

  String? get clientMutationId;
  GSort? get sort;
  GRequirementState? get state;
  String? get search;
  BuiltList<String>? get authorUsername;
  String get projectPath;
  BuiltList<String>? get selectedFields;
  static Serializer<GExportRequirementsInput> get serializer =>
      _$gExportRequirementsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GExportRequirementsInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GExportRequirementsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GExportRequirementsInput.serializer,
        json,
      );
}

abstract class GExternalAuditEventDestinationCreateInput
    implements
        Built<GExternalAuditEventDestinationCreateInput,
            GExternalAuditEventDestinationCreateInputBuilder> {
  GExternalAuditEventDestinationCreateInput._();

  factory GExternalAuditEventDestinationCreateInput(
      [Function(GExternalAuditEventDestinationCreateInputBuilder b)
          updates]) = _$GExternalAuditEventDestinationCreateInput;

  String? get clientMutationId;
  String get destinationUrl;
  String get groupPath;
  String? get verificationToken;
  static Serializer<GExternalAuditEventDestinationCreateInput> get serializer =>
      _$gExternalAuditEventDestinationCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GExternalAuditEventDestinationCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GExternalAuditEventDestinationCreateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GExternalAuditEventDestinationCreateInput.serializer,
        json,
      );
}

abstract class GExternalAuditEventDestinationDestroyInput
    implements
        Built<GExternalAuditEventDestinationDestroyInput,
            GExternalAuditEventDestinationDestroyInputBuilder> {
  GExternalAuditEventDestinationDestroyInput._();

  factory GExternalAuditEventDestinationDestroyInput(
      [Function(GExternalAuditEventDestinationDestroyInputBuilder b)
          updates]) = _$GExternalAuditEventDestinationDestroyInput;

  String? get clientMutationId;
  GAuditEventsExternalAuditEventDestinationID get id;
  static Serializer<GExternalAuditEventDestinationDestroyInput>
      get serializer => _$gExternalAuditEventDestinationDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GExternalAuditEventDestinationDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GExternalAuditEventDestinationDestroyInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GExternalAuditEventDestinationDestroyInput.serializer,
        json,
      );
}

abstract class GExternalAuditEventDestinationUpdateInput
    implements
        Built<GExternalAuditEventDestinationUpdateInput,
            GExternalAuditEventDestinationUpdateInputBuilder> {
  GExternalAuditEventDestinationUpdateInput._();

  factory GExternalAuditEventDestinationUpdateInput(
      [Function(GExternalAuditEventDestinationUpdateInputBuilder b)
          updates]) = _$GExternalAuditEventDestinationUpdateInput;

  String? get clientMutationId;
  GAuditEventsExternalAuditEventDestinationID get id;
  String? get destinationUrl;
  static Serializer<GExternalAuditEventDestinationUpdateInput> get serializer =>
      _$gExternalAuditEventDestinationUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GExternalAuditEventDestinationUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GExternalAuditEventDestinationUpdateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GExternalAuditEventDestinationUpdateInput.serializer,
        json,
      );
}

abstract class GGitlabErrorTrackingDetailedErrorID
    implements
        Built<GGitlabErrorTrackingDetailedErrorID,
            GGitlabErrorTrackingDetailedErrorIDBuilder> {
  GGitlabErrorTrackingDetailedErrorID._();

  factory GGitlabErrorTrackingDetailedErrorID([String? value]) =>
      _$GGitlabErrorTrackingDetailedErrorID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GGitlabErrorTrackingDetailedErrorID> get serializer =>
      _i2.DefaultScalarSerializer<GGitlabErrorTrackingDetailedErrorID>(
          (Object serialized) =>
              GGitlabErrorTrackingDetailedErrorID((serialized as String?)));
}

abstract class GGitlabSubscriptionActivateInput
    implements
        Built<GGitlabSubscriptionActivateInput,
            GGitlabSubscriptionActivateInputBuilder> {
  GGitlabSubscriptionActivateInput._();

  factory GGitlabSubscriptionActivateInput(
          [Function(GGitlabSubscriptionActivateInputBuilder b) updates]) =
      _$GGitlabSubscriptionActivateInput;

  String? get clientMutationId;
  String get activationCode;
  static Serializer<GGitlabSubscriptionActivateInput> get serializer =>
      _$gGitlabSubscriptionActivateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGitlabSubscriptionActivateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGitlabSubscriptionActivateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGitlabSubscriptionActivateInput.serializer,
        json,
      );
}

abstract class GGlobalID implements Built<GGlobalID, GGlobalIDBuilder> {
  GGlobalID._();

  factory GGlobalID([String? value]) =>
      _$GGlobalID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GGlobalID> get serializer =>
      _i2.DefaultScalarSerializer<GGlobalID>(
          (Object serialized) => GGlobalID((serialized as String?)));
}

abstract class GGroupID implements Built<GGroupID, GGroupIDBuilder> {
  GGroupID._();

  factory GGroupID([String? value]) =>
      _$GGroupID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GGroupID> get serializer =>
      _i2.DefaultScalarSerializer<GGroupID>(
          (Object serialized) => GGroupID((serialized as String?)));
}

class GGroupMemberRelation extends EnumClass {
  const GGroupMemberRelation._(String name) : super(name);

  static const GGroupMemberRelation DIRECT = _$gGroupMemberRelationDIRECT;

  static const GGroupMemberRelation INHERITED = _$gGroupMemberRelationINHERITED;

  static const GGroupMemberRelation DESCENDANTS =
      _$gGroupMemberRelationDESCENDANTS;

  static const GGroupMemberRelation SHARED_FROM_GROUPS =
      _$gGroupMemberRelationSHARED_FROM_GROUPS;

  static Serializer<GGroupMemberRelation> get serializer =>
      _$gGroupMemberRelationSerializer;
  static BuiltSet<GGroupMemberRelation> get values =>
      _$gGroupMemberRelationValues;
  static GGroupMemberRelation valueOf(String name) =>
      _$gGroupMemberRelationValueOf(name);
}

class GGroupPermission extends EnumClass {
  const GGroupPermission._(String name) : super(name);

  static const GGroupPermission CREATE_PROJECTS =
      _$gGroupPermissionCREATE_PROJECTS;

  static const GGroupPermission TRANSFER_PROJECTS =
      _$gGroupPermissionTRANSFER_PROJECTS;

  static Serializer<GGroupPermission> get serializer =>
      _$gGroupPermissionSerializer;
  static BuiltSet<GGroupPermission> get values => _$gGroupPermissionValues;
  static GGroupPermission valueOf(String name) =>
      _$gGroupPermissionValueOf(name);
}

abstract class GGroupUpdateInput
    implements Built<GGroupUpdateInput, GGroupUpdateInputBuilder> {
  GGroupUpdateInput._();

  factory GGroupUpdateInput([Function(GGroupUpdateInputBuilder b) updates]) =
      _$GGroupUpdateInput;

  String? get clientMutationId;
  String get fullPath;
  GSharedRunnersSetting get sharedRunnersSetting;
  static Serializer<GGroupUpdateInput> get serializer =>
      _$gGroupUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGroupUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GGroupUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGroupUpdateInput.serializer,
        json,
      );
}

class GHealthStatus extends EnumClass {
  const GHealthStatus._(String name) : super(name);

  static const GHealthStatus onTrack = _$gHealthStatusonTrack;

  static const GHealthStatus needsAttention = _$gHealthStatusneedsAttention;

  static const GHealthStatus atRisk = _$gHealthStatusatRisk;

  static Serializer<GHealthStatus> get serializer => _$gHealthStatusSerializer;
  static BuiltSet<GHealthStatus> get values => _$gHealthStatusValues;
  static GHealthStatus valueOf(String name) => _$gHealthStatusValueOf(name);
}

class GHealthStatusFilter extends EnumClass {
  const GHealthStatusFilter._(String name) : super(name);

  static const GHealthStatusFilter NONE = _$gHealthStatusFilterNONE;

  static const GHealthStatusFilter ANY = _$gHealthStatusFilterANY;

  static const GHealthStatusFilter onTrack = _$gHealthStatusFilteronTrack;

  static const GHealthStatusFilter needsAttention =
      _$gHealthStatusFilterneedsAttention;

  static const GHealthStatusFilter atRisk = _$gHealthStatusFilteratRisk;

  static Serializer<GHealthStatusFilter> get serializer =>
      _$gHealthStatusFilterSerializer;
  static BuiltSet<GHealthStatusFilter> get values =>
      _$gHealthStatusFilterValues;
  static GHealthStatusFilter valueOf(String name) =>
      _$gHealthStatusFilterValueOf(name);
}

abstract class GHttpIntegrationCreateInput
    implements
        Built<GHttpIntegrationCreateInput, GHttpIntegrationCreateInputBuilder> {
  GHttpIntegrationCreateInput._();

  factory GHttpIntegrationCreateInput(
          [Function(GHttpIntegrationCreateInputBuilder b) updates]) =
      _$GHttpIntegrationCreateInput;

  String? get clientMutationId;
  String get projectPath;
  String get name;
  bool get active;
  GJsonString? get payloadExample;
  BuiltList<GAlertManagementPayloadAlertFieldInput>?
      get payloadAttributeMappings;
  static Serializer<GHttpIntegrationCreateInput> get serializer =>
      _$gHttpIntegrationCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHttpIntegrationCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHttpIntegrationCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHttpIntegrationCreateInput.serializer,
        json,
      );
}

abstract class GHttpIntegrationDestroyInput
    implements
        Built<GHttpIntegrationDestroyInput,
            GHttpIntegrationDestroyInputBuilder> {
  GHttpIntegrationDestroyInput._();

  factory GHttpIntegrationDestroyInput(
          [Function(GHttpIntegrationDestroyInputBuilder b) updates]) =
      _$GHttpIntegrationDestroyInput;

  String? get clientMutationId;
  GAlertManagementHttpIntegrationID get id;
  static Serializer<GHttpIntegrationDestroyInput> get serializer =>
      _$gHttpIntegrationDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHttpIntegrationDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHttpIntegrationDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHttpIntegrationDestroyInput.serializer,
        json,
      );
}

abstract class GHttpIntegrationResetTokenInput
    implements
        Built<GHttpIntegrationResetTokenInput,
            GHttpIntegrationResetTokenInputBuilder> {
  GHttpIntegrationResetTokenInput._();

  factory GHttpIntegrationResetTokenInput(
          [Function(GHttpIntegrationResetTokenInputBuilder b) updates]) =
      _$GHttpIntegrationResetTokenInput;

  String? get clientMutationId;
  GAlertManagementHttpIntegrationID get id;
  static Serializer<GHttpIntegrationResetTokenInput> get serializer =>
      _$gHttpIntegrationResetTokenInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHttpIntegrationResetTokenInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHttpIntegrationResetTokenInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHttpIntegrationResetTokenInput.serializer,
        json,
      );
}

abstract class GHttpIntegrationUpdateInput
    implements
        Built<GHttpIntegrationUpdateInput, GHttpIntegrationUpdateInputBuilder> {
  GHttpIntegrationUpdateInput._();

  factory GHttpIntegrationUpdateInput(
          [Function(GHttpIntegrationUpdateInputBuilder b) updates]) =
      _$GHttpIntegrationUpdateInput;

  String? get clientMutationId;
  GAlertManagementHttpIntegrationID get id;
  String? get name;
  bool? get active;
  GJsonString? get payloadExample;
  BuiltList<GAlertManagementPayloadAlertFieldInput>?
      get payloadAttributeMappings;
  static Serializer<GHttpIntegrationUpdateInput> get serializer =>
      _$gHttpIntegrationUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHttpIntegrationUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHttpIntegrationUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHttpIntegrationUpdateInput.serializer,
        json,
      );
}

abstract class GIncidentManagementEscalationPolicyID
    implements
        Built<GIncidentManagementEscalationPolicyID,
            GIncidentManagementEscalationPolicyIDBuilder> {
  GIncidentManagementEscalationPolicyID._();

  factory GIncidentManagementEscalationPolicyID([String? value]) =>
      _$GIncidentManagementEscalationPolicyID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIncidentManagementEscalationPolicyID> get serializer =>
      _i2.DefaultScalarSerializer<GIncidentManagementEscalationPolicyID>(
          (Object serialized) =>
              GIncidentManagementEscalationPolicyID((serialized as String?)));
}

abstract class GIncidentManagementEscalationRuleID
    implements
        Built<GIncidentManagementEscalationRuleID,
            GIncidentManagementEscalationRuleIDBuilder> {
  GIncidentManagementEscalationRuleID._();

  factory GIncidentManagementEscalationRuleID([String? value]) =>
      _$GIncidentManagementEscalationRuleID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIncidentManagementEscalationRuleID> get serializer =>
      _i2.DefaultScalarSerializer<GIncidentManagementEscalationRuleID>(
          (Object serialized) =>
              GIncidentManagementEscalationRuleID((serialized as String?)));
}

abstract class GIncidentManagementIssuableResourceLinkID
    implements
        Built<GIncidentManagementIssuableResourceLinkID,
            GIncidentManagementIssuableResourceLinkIDBuilder> {
  GIncidentManagementIssuableResourceLinkID._();

  factory GIncidentManagementIssuableResourceLinkID([String? value]) =>
      _$GIncidentManagementIssuableResourceLinkID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIncidentManagementIssuableResourceLinkID> get serializer =>
      _i2.DefaultScalarSerializer<GIncidentManagementIssuableResourceLinkID>(
          (Object serialized) => GIncidentManagementIssuableResourceLinkID(
              (serialized as String?)));
}

abstract class GIncidentManagementOncallParticipantID
    implements
        Built<GIncidentManagementOncallParticipantID,
            GIncidentManagementOncallParticipantIDBuilder> {
  GIncidentManagementOncallParticipantID._();

  factory GIncidentManagementOncallParticipantID([String? value]) =>
      _$GIncidentManagementOncallParticipantID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIncidentManagementOncallParticipantID> get serializer =>
      _i2.DefaultScalarSerializer<GIncidentManagementOncallParticipantID>(
          (Object serialized) =>
              GIncidentManagementOncallParticipantID((serialized as String?)));
}

abstract class GIncidentManagementOncallRotationID
    implements
        Built<GIncidentManagementOncallRotationID,
            GIncidentManagementOncallRotationIDBuilder> {
  GIncidentManagementOncallRotationID._();

  factory GIncidentManagementOncallRotationID([String? value]) =>
      _$GIncidentManagementOncallRotationID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIncidentManagementOncallRotationID> get serializer =>
      _i2.DefaultScalarSerializer<GIncidentManagementOncallRotationID>(
          (Object serialized) =>
              GIncidentManagementOncallRotationID((serialized as String?)));
}

abstract class GIncidentManagementTimelineEventID
    implements
        Built<GIncidentManagementTimelineEventID,
            GIncidentManagementTimelineEventIDBuilder> {
  GIncidentManagementTimelineEventID._();

  factory GIncidentManagementTimelineEventID([String? value]) =>
      _$GIncidentManagementTimelineEventID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIncidentManagementTimelineEventID> get serializer =>
      _i2.DefaultScalarSerializer<GIncidentManagementTimelineEventID>(
          (Object serialized) =>
              GIncidentManagementTimelineEventID((serialized as String?)));
}

abstract class GIntegrationsPrometheusID
    implements
        Built<GIntegrationsPrometheusID, GIntegrationsPrometheusIDBuilder> {
  GIntegrationsPrometheusID._();

  factory GIntegrationsPrometheusID([String? value]) =>
      _$GIntegrationsPrometheusID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIntegrationsPrometheusID> get serializer =>
      _i2.DefaultScalarSerializer<GIntegrationsPrometheusID>(
          (Object serialized) =>
              GIntegrationsPrometheusID((serialized as String?)));
}

abstract class GISO8601Date
    implements Built<GISO8601Date, GISO8601DateBuilder> {
  GISO8601Date._();

  factory GISO8601Date([String? value]) =>
      _$GISO8601Date((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GISO8601Date> get serializer =>
      _i2.DefaultScalarSerializer<GISO8601Date>(
          (Object serialized) => GISO8601Date((serialized as String?)));
}

abstract class GIssuableID implements Built<GIssuableID, GIssuableIDBuilder> {
  GIssuableID._();

  factory GIssuableID([String? value]) =>
      _$GIssuableID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIssuableID> get serializer =>
      _i2.DefaultScalarSerializer<GIssuableID>(
          (Object serialized) => GIssuableID((serialized as String?)));
}

abstract class GIssuableResourceLinkCreateInput
    implements
        Built<GIssuableResourceLinkCreateInput,
            GIssuableResourceLinkCreateInputBuilder> {
  GIssuableResourceLinkCreateInput._();

  factory GIssuableResourceLinkCreateInput(
          [Function(GIssuableResourceLinkCreateInputBuilder b) updates]) =
      _$GIssuableResourceLinkCreateInput;

  String? get clientMutationId;
  GIssueID get id;
  String get link;
  String? get linkText;
  GIssuableResourceLinkType? get linkType;
  static Serializer<GIssuableResourceLinkCreateInput> get serializer =>
      _$gIssuableResourceLinkCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssuableResourceLinkCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssuableResourceLinkCreateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssuableResourceLinkCreateInput.serializer,
        json,
      );
}

abstract class GIssuableResourceLinkDestroyInput
    implements
        Built<GIssuableResourceLinkDestroyInput,
            GIssuableResourceLinkDestroyInputBuilder> {
  GIssuableResourceLinkDestroyInput._();

  factory GIssuableResourceLinkDestroyInput(
          [Function(GIssuableResourceLinkDestroyInputBuilder b) updates]) =
      _$GIssuableResourceLinkDestroyInput;

  String? get clientMutationId;
  GIncidentManagementIssuableResourceLinkID get id;
  static Serializer<GIssuableResourceLinkDestroyInput> get serializer =>
      _$gIssuableResourceLinkDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssuableResourceLinkDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssuableResourceLinkDestroyInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssuableResourceLinkDestroyInput.serializer,
        json,
      );
}

class GIssuableResourceLinkType extends EnumClass {
  const GIssuableResourceLinkType._(String name) : super(name);

  static const GIssuableResourceLinkType general =
      _$gIssuableResourceLinkTypegeneral;

  static const GIssuableResourceLinkType zoom = _$gIssuableResourceLinkTypezoom;

  static const GIssuableResourceLinkType slack =
      _$gIssuableResourceLinkTypeslack;

  static Serializer<GIssuableResourceLinkType> get serializer =>
      _$gIssuableResourceLinkTypeSerializer;
  static BuiltSet<GIssuableResourceLinkType> get values =>
      _$gIssuableResourceLinkTypeValues;
  static GIssuableResourceLinkType valueOf(String name) =>
      _$gIssuableResourceLinkTypeValueOf(name);
}

class GIssuableSearchableField extends EnumClass {
  const GIssuableSearchableField._(String name) : super(name);

  static const GIssuableSearchableField TITLE = _$gIssuableSearchableFieldTITLE;

  static const GIssuableSearchableField DESCRIPTION =
      _$gIssuableSearchableFieldDESCRIPTION;

  static Serializer<GIssuableSearchableField> get serializer =>
      _$gIssuableSearchableFieldSerializer;
  static BuiltSet<GIssuableSearchableField> get values =>
      _$gIssuableSearchableFieldValues;
  static GIssuableSearchableField valueOf(String name) =>
      _$gIssuableSearchableFieldValueOf(name);
}

class GIssuableSeverity extends EnumClass {
  const GIssuableSeverity._(String name) : super(name);

  static const GIssuableSeverity UNKNOWN = _$gIssuableSeverityUNKNOWN;

  static const GIssuableSeverity LOW = _$gIssuableSeverityLOW;

  static const GIssuableSeverity MEDIUM = _$gIssuableSeverityMEDIUM;

  static const GIssuableSeverity HIGH = _$gIssuableSeverityHIGH;

  static const GIssuableSeverity CRITICAL = _$gIssuableSeverityCRITICAL;

  static Serializer<GIssuableSeverity> get serializer =>
      _$gIssuableSeveritySerializer;
  static BuiltSet<GIssuableSeverity> get values => _$gIssuableSeverityValues;
  static GIssuableSeverity valueOf(String name) =>
      _$gIssuableSeverityValueOf(name);
}

class GIssuableState extends EnumClass {
  const GIssuableState._(String name) : super(name);

  static const GIssuableState opened = _$gIssuableStateopened;

  static const GIssuableState closed = _$gIssuableStateclosed;

  static const GIssuableState locked = _$gIssuableStatelocked;

  static const GIssuableState all = _$gIssuableStateall;

  static Serializer<GIssuableState> get serializer =>
      _$gIssuableStateSerializer;
  static BuiltSet<GIssuableState> get values => _$gIssuableStateValues;
  static GIssuableState valueOf(String name) => _$gIssuableStateValueOf(name);
}

class GIssueCreationIterationWildcardId extends EnumClass {
  const GIssueCreationIterationWildcardId._(String name) : super(name);

  static const GIssueCreationIterationWildcardId CURRENT =
      _$gIssueCreationIterationWildcardIdCURRENT;

  static Serializer<GIssueCreationIterationWildcardId> get serializer =>
      _$gIssueCreationIterationWildcardIdSerializer;
  static BuiltSet<GIssueCreationIterationWildcardId> get values =>
      _$gIssueCreationIterationWildcardIdValues;
  static GIssueCreationIterationWildcardId valueOf(String name) =>
      _$gIssueCreationIterationWildcardIdValueOf(name);
}

class GIssueEscalationStatus extends EnumClass {
  const GIssueEscalationStatus._(String name) : super(name);

  static const GIssueEscalationStatus TRIGGERED =
      _$gIssueEscalationStatusTRIGGERED;

  static const GIssueEscalationStatus ACKNOWLEDGED =
      _$gIssueEscalationStatusACKNOWLEDGED;

  static const GIssueEscalationStatus RESOLVED =
      _$gIssueEscalationStatusRESOLVED;

  static const GIssueEscalationStatus IGNORED = _$gIssueEscalationStatusIGNORED;

  static Serializer<GIssueEscalationStatus> get serializer =>
      _$gIssueEscalationStatusSerializer;
  static BuiltSet<GIssueEscalationStatus> get values =>
      _$gIssueEscalationStatusValues;
  static GIssueEscalationStatus valueOf(String name) =>
      _$gIssueEscalationStatusValueOf(name);
}

abstract class GIssueID implements Built<GIssueID, GIssueIDBuilder> {
  GIssueID._();

  factory GIssueID([String? value]) =>
      _$GIssueID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIssueID> get serializer =>
      _i2.DefaultScalarSerializer<GIssueID>(
          (Object serialized) => GIssueID((serialized as String?)));
}

abstract class GIssueMoveInput
    implements Built<GIssueMoveInput, GIssueMoveInputBuilder> {
  GIssueMoveInput._();

  factory GIssueMoveInput([Function(GIssueMoveInputBuilder b) updates]) =
      _$GIssueMoveInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  String get targetProjectPath;
  static Serializer<GIssueMoveInput> get serializer =>
      _$gIssueMoveInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueMoveInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueMoveInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueMoveInput.serializer,
        json,
      );
}

abstract class GIssueMoveListInput
    implements Built<GIssueMoveListInput, GIssueMoveListInputBuilder> {
  GIssueMoveListInput._();

  factory GIssueMoveListInput(
      [Function(GIssueMoveListInputBuilder b) updates]) = _$GIssueMoveListInput;

  String? get clientMutationId;
  GBoardID get boardId;
  String get projectPath;
  String get iid;
  String? get fromListId;
  String? get toListId;
  String? get moveBeforeId;
  String? get moveAfterId;
  int? get positionInList;
  GEpicID? get epicId;
  static Serializer<GIssueMoveListInput> get serializer =>
      _$gIssueMoveListInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueMoveListInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueMoveListInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueMoveListInput.serializer,
        json,
      );
}

abstract class GIssueSetAssigneesInput
    implements Built<GIssueSetAssigneesInput, GIssueSetAssigneesInputBuilder> {
  GIssueSetAssigneesInput._();

  factory GIssueSetAssigneesInput(
          [Function(GIssueSetAssigneesInputBuilder b) updates]) =
      _$GIssueSetAssigneesInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  BuiltList<String> get assigneeUsernames;
  GMutationOperationMode? get operationMode;
  static Serializer<GIssueSetAssigneesInput> get serializer =>
      _$gIssueSetAssigneesInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetAssigneesInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetAssigneesInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetAssigneesInput.serializer,
        json,
      );
}

abstract class GIssueSetConfidentialInput
    implements
        Built<GIssueSetConfidentialInput, GIssueSetConfidentialInputBuilder> {
  GIssueSetConfidentialInput._();

  factory GIssueSetConfidentialInput(
          [Function(GIssueSetConfidentialInputBuilder b) updates]) =
      _$GIssueSetConfidentialInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  bool get confidential;
  static Serializer<GIssueSetConfidentialInput> get serializer =>
      _$gIssueSetConfidentialInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetConfidentialInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetConfidentialInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetConfidentialInput.serializer,
        json,
      );
}

abstract class GIssueSetCrmContactsInput
    implements
        Built<GIssueSetCrmContactsInput, GIssueSetCrmContactsInputBuilder> {
  GIssueSetCrmContactsInput._();

  factory GIssueSetCrmContactsInput(
          [Function(GIssueSetCrmContactsInputBuilder b) updates]) =
      _$GIssueSetCrmContactsInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  BuiltList<GCustomerRelationsContactID> get contactIds;
  GMutationOperationMode? get operationMode;
  static Serializer<GIssueSetCrmContactsInput> get serializer =>
      _$gIssueSetCrmContactsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetCrmContactsInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetCrmContactsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetCrmContactsInput.serializer,
        json,
      );
}

abstract class GIssueSetDueDateInput
    implements Built<GIssueSetDueDateInput, GIssueSetDueDateInputBuilder> {
  GIssueSetDueDateInput._();

  factory GIssueSetDueDateInput(
          [Function(GIssueSetDueDateInputBuilder b) updates]) =
      _$GIssueSetDueDateInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  GTime? get dueDate;
  static Serializer<GIssueSetDueDateInput> get serializer =>
      _$gIssueSetDueDateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetDueDateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetDueDateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetDueDateInput.serializer,
        json,
      );
}

abstract class GIssueSetEpicInput
    implements Built<GIssueSetEpicInput, GIssueSetEpicInputBuilder> {
  GIssueSetEpicInput._();

  factory GIssueSetEpicInput([Function(GIssueSetEpicInputBuilder b) updates]) =
      _$GIssueSetEpicInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  GEpicID? get epicId;
  static Serializer<GIssueSetEpicInput> get serializer =>
      _$gIssueSetEpicInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetEpicInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetEpicInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetEpicInput.serializer,
        json,
      );
}

abstract class GIssueSetEscalationPolicyInput
    implements
        Built<GIssueSetEscalationPolicyInput,
            GIssueSetEscalationPolicyInputBuilder> {
  GIssueSetEscalationPolicyInput._();

  factory GIssueSetEscalationPolicyInput(
          [Function(GIssueSetEscalationPolicyInputBuilder b) updates]) =
      _$GIssueSetEscalationPolicyInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  GIncidentManagementEscalationPolicyID? get escalationPolicyId;
  static Serializer<GIssueSetEscalationPolicyInput> get serializer =>
      _$gIssueSetEscalationPolicyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetEscalationPolicyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetEscalationPolicyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetEscalationPolicyInput.serializer,
        json,
      );
}

abstract class GIssueSetEscalationStatusInput
    implements
        Built<GIssueSetEscalationStatusInput,
            GIssueSetEscalationStatusInputBuilder> {
  GIssueSetEscalationStatusInput._();

  factory GIssueSetEscalationStatusInput(
          [Function(GIssueSetEscalationStatusInputBuilder b) updates]) =
      _$GIssueSetEscalationStatusInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  GIssueEscalationStatus get status;
  static Serializer<GIssueSetEscalationStatusInput> get serializer =>
      _$gIssueSetEscalationStatusInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetEscalationStatusInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetEscalationStatusInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetEscalationStatusInput.serializer,
        json,
      );
}

abstract class GIssueSetIterationInput
    implements Built<GIssueSetIterationInput, GIssueSetIterationInputBuilder> {
  GIssueSetIterationInput._();

  factory GIssueSetIterationInput(
          [Function(GIssueSetIterationInputBuilder b) updates]) =
      _$GIssueSetIterationInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  GIterationID? get iterationId;
  static Serializer<GIssueSetIterationInput> get serializer =>
      _$gIssueSetIterationInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetIterationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetIterationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetIterationInput.serializer,
        json,
      );
}

abstract class GIssueSetLockedInput
    implements Built<GIssueSetLockedInput, GIssueSetLockedInputBuilder> {
  GIssueSetLockedInput._();

  factory GIssueSetLockedInput(
          [Function(GIssueSetLockedInputBuilder b) updates]) =
      _$GIssueSetLockedInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  bool get locked;
  static Serializer<GIssueSetLockedInput> get serializer =>
      _$gIssueSetLockedInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetLockedInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetLockedInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetLockedInput.serializer,
        json,
      );
}

abstract class GIssueSetSeverityInput
    implements Built<GIssueSetSeverityInput, GIssueSetSeverityInputBuilder> {
  GIssueSetSeverityInput._();

  factory GIssueSetSeverityInput(
          [Function(GIssueSetSeverityInputBuilder b) updates]) =
      _$GIssueSetSeverityInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  GIssuableSeverity get severity;
  static Serializer<GIssueSetSeverityInput> get serializer =>
      _$gIssueSetSeverityInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetSeverityInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetSeverityInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetSeverityInput.serializer,
        json,
      );
}

abstract class GIssueSetSubscriptionInput
    implements
        Built<GIssueSetSubscriptionInput, GIssueSetSubscriptionInputBuilder> {
  GIssueSetSubscriptionInput._();

  factory GIssueSetSubscriptionInput(
          [Function(GIssueSetSubscriptionInputBuilder b) updates]) =
      _$GIssueSetSubscriptionInput;

  String? get clientMutationId;
  bool get subscribedState;
  String get projectPath;
  String get iid;
  static Serializer<GIssueSetSubscriptionInput> get serializer =>
      _$gIssueSetSubscriptionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetSubscriptionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetSubscriptionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetSubscriptionInput.serializer,
        json,
      );
}

abstract class GIssueSetWeightInput
    implements Built<GIssueSetWeightInput, GIssueSetWeightInputBuilder> {
  GIssueSetWeightInput._();

  factory GIssueSetWeightInput(
          [Function(GIssueSetWeightInputBuilder b) updates]) =
      _$GIssueSetWeightInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  int? get weight;
  static Serializer<GIssueSetWeightInput> get serializer =>
      _$gIssueSetWeightInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIssueSetWeightInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIssueSetWeightInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIssueSetWeightInput.serializer,
        json,
      );
}

class GIssueSort extends EnumClass {
  const GIssueSort._(String name) : super(name);

  static const GIssueSort DUE_DATE_ASC = _$gIssueSortDUE_DATE_ASC;

  static const GIssueSort DUE_DATE_DESC = _$gIssueSortDUE_DATE_DESC;

  static const GIssueSort RELATIVE_POSITION_ASC =
      _$gIssueSortRELATIVE_POSITION_ASC;

  static const GIssueSort SEVERITY_ASC = _$gIssueSortSEVERITY_ASC;

  static const GIssueSort SEVERITY_DESC = _$gIssueSortSEVERITY_DESC;

  static const GIssueSort TITLE_ASC = _$gIssueSortTITLE_ASC;

  static const GIssueSort TITLE_DESC = _$gIssueSortTITLE_DESC;

  static const GIssueSort POPULARITY_ASC = _$gIssueSortPOPULARITY_ASC;

  static const GIssueSort POPULARITY_DESC = _$gIssueSortPOPULARITY_DESC;

  static const GIssueSort ESCALATION_STATUS_ASC =
      _$gIssueSortESCALATION_STATUS_ASC;

  static const GIssueSort ESCALATION_STATUS_DESC =
      _$gIssueSortESCALATION_STATUS_DESC;

  static const GIssueSort CLOSED_AT_ASC = _$gIssueSortCLOSED_AT_ASC;

  static const GIssueSort CLOSED_AT_DESC = _$gIssueSortCLOSED_AT_DESC;

  static const GIssueSort WEIGHT_ASC = _$gIssueSortWEIGHT_ASC;

  static const GIssueSort WEIGHT_DESC = _$gIssueSortWEIGHT_DESC;

  static const GIssueSort PUBLISHED_ASC = _$gIssueSortPUBLISHED_ASC;

  static const GIssueSort PUBLISHED_DESC = _$gIssueSortPUBLISHED_DESC;

  static const GIssueSort SLA_DUE_AT_ASC = _$gIssueSortSLA_DUE_AT_ASC;

  static const GIssueSort SLA_DUE_AT_DESC = _$gIssueSortSLA_DUE_AT_DESC;

  static const GIssueSort BLOCKING_ISSUES_ASC = _$gIssueSortBLOCKING_ISSUES_ASC;

  static const GIssueSort BLOCKING_ISSUES_DESC =
      _$gIssueSortBLOCKING_ISSUES_DESC;

  static const GIssueSort PRIORITY_ASC = _$gIssueSortPRIORITY_ASC;

  static const GIssueSort PRIORITY_DESC = _$gIssueSortPRIORITY_DESC;

  static const GIssueSort LABEL_PRIORITY_ASC = _$gIssueSortLABEL_PRIORITY_ASC;

  static const GIssueSort LABEL_PRIORITY_DESC = _$gIssueSortLABEL_PRIORITY_DESC;

  static const GIssueSort MILESTONE_DUE_ASC = _$gIssueSortMILESTONE_DUE_ASC;

  static const GIssueSort MILESTONE_DUE_DESC = _$gIssueSortMILESTONE_DUE_DESC;

  static const GIssueSort updated_desc = _$gIssueSortupdated_desc;

  static const GIssueSort updated_asc = _$gIssueSortupdated_asc;

  static const GIssueSort created_desc = _$gIssueSortcreated_desc;

  static const GIssueSort created_asc = _$gIssueSortcreated_asc;

  static const GIssueSort UPDATED_DESC = _$gIssueSortUPDATED_DESC;

  static const GIssueSort UPDATED_ASC = _$gIssueSortUPDATED_ASC;

  static const GIssueSort CREATED_DESC = _$gIssueSortCREATED_DESC;

  static const GIssueSort CREATED_ASC = _$gIssueSortCREATED_ASC;

  static Serializer<GIssueSort> get serializer => _$gIssueSortSerializer;
  static BuiltSet<GIssueSort> get values => _$gIssueSortValues;
  static GIssueSort valueOf(String name) => _$gIssueSortValueOf(name);
}

class GIssueState extends EnumClass {
  const GIssueState._(String name) : super(name);

  static const GIssueState opened = _$gIssueStateopened;

  static const GIssueState closed = _$gIssueStateclosed;

  static const GIssueState locked = _$gIssueStatelocked;

  static const GIssueState all = _$gIssueStateall;

  static Serializer<GIssueState> get serializer => _$gIssueStateSerializer;
  static BuiltSet<GIssueState> get values => _$gIssueStateValues;
  static GIssueState valueOf(String name) => _$gIssueStateValueOf(name);
}

class GIssueStateEvent extends EnumClass {
  const GIssueStateEvent._(String name) : super(name);

  static const GIssueStateEvent REOPEN = _$gIssueStateEventREOPEN;

  static const GIssueStateEvent CLOSE = _$gIssueStateEventCLOSE;

  static Serializer<GIssueStateEvent> get serializer =>
      _$gIssueStateEventSerializer;
  static BuiltSet<GIssueStateEvent> get values => _$gIssueStateEventValues;
  static GIssueStateEvent valueOf(String name) =>
      _$gIssueStateEventValueOf(name);
}

class GIssueType extends EnumClass {
  const GIssueType._(String name) : super(name);

  static const GIssueType ISSUE = _$gIssueTypeISSUE;

  static const GIssueType INCIDENT = _$gIssueTypeINCIDENT;

  static const GIssueType TEST_CASE = _$gIssueTypeTEST_CASE;

  static const GIssueType REQUIREMENT = _$gIssueTypeREQUIREMENT;

  static const GIssueType TASK = _$gIssueTypeTASK;

  static Serializer<GIssueType> get serializer => _$gIssueTypeSerializer;
  static BuiltSet<GIssueType> get values => _$gIssueTypeValues;
  static GIssueType valueOf(String name) => _$gIssueTypeValueOf(name);
}

abstract class GIterationCadenceCreateInput
    implements
        Built<GIterationCadenceCreateInput,
            GIterationCadenceCreateInputBuilder> {
  GIterationCadenceCreateInput._();

  factory GIterationCadenceCreateInput(
          [Function(GIterationCadenceCreateInputBuilder b) updates]) =
      _$GIterationCadenceCreateInput;

  String? get clientMutationId;
  String get groupPath;
  String? get title;
  int? get durationInWeeks;
  int? get iterationsInAdvance;
  GTime? get startDate;
  bool get automatic;
  bool get active;
  bool? get rollOver;
  String? get description;
  static Serializer<GIterationCadenceCreateInput> get serializer =>
      _$gIterationCadenceCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIterationCadenceCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIterationCadenceCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIterationCadenceCreateInput.serializer,
        json,
      );
}

abstract class GIterationCadenceDestroyInput
    implements
        Built<GIterationCadenceDestroyInput,
            GIterationCadenceDestroyInputBuilder> {
  GIterationCadenceDestroyInput._();

  factory GIterationCadenceDestroyInput(
          [Function(GIterationCadenceDestroyInputBuilder b) updates]) =
      _$GIterationCadenceDestroyInput;

  String? get clientMutationId;
  GIterationsCadenceID get id;
  static Serializer<GIterationCadenceDestroyInput> get serializer =>
      _$gIterationCadenceDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIterationCadenceDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIterationCadenceDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIterationCadenceDestroyInput.serializer,
        json,
      );
}

abstract class GIterationCadenceUpdateInput
    implements
        Built<GIterationCadenceUpdateInput,
            GIterationCadenceUpdateInputBuilder> {
  GIterationCadenceUpdateInput._();

  factory GIterationCadenceUpdateInput(
          [Function(GIterationCadenceUpdateInputBuilder b) updates]) =
      _$GIterationCadenceUpdateInput;

  String? get clientMutationId;
  GIterationsCadenceID get id;
  String? get title;
  int? get durationInWeeks;
  int? get iterationsInAdvance;
  GTime? get startDate;
  bool? get automatic;
  bool? get active;
  bool? get rollOver;
  String? get description;
  static Serializer<GIterationCadenceUpdateInput> get serializer =>
      _$gIterationCadenceUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIterationCadenceUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIterationCadenceUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIterationCadenceUpdateInput.serializer,
        json,
      );
}

abstract class GiterationCreateInput
    implements Built<GiterationCreateInput, GiterationCreateInputBuilder> {
  GiterationCreateInput._();

  factory GiterationCreateInput(
          [Function(GiterationCreateInputBuilder b) updates]) =
      _$GiterationCreateInput;

  String? get clientMutationId;
  String? get projectPath;
  String? get groupPath;
  GIterationsCadenceID? get iterationsCadenceId;
  String? get title;
  String? get description;
  String? get startDate;
  String? get dueDate;
  static Serializer<GiterationCreateInput> get serializer =>
      _$giterationCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GiterationCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GiterationCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GiterationCreateInput.serializer,
        json,
      );
}

abstract class GIterationDeleteInput
    implements Built<GIterationDeleteInput, GIterationDeleteInputBuilder> {
  GIterationDeleteInput._();

  factory GIterationDeleteInput(
          [Function(GIterationDeleteInputBuilder b) updates]) =
      _$GIterationDeleteInput;

  String? get clientMutationId;
  GIterationID get id;
  static Serializer<GIterationDeleteInput> get serializer =>
      _$gIterationDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GIterationDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GIterationDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GIterationDeleteInput.serializer,
        json,
      );
}

abstract class GIterationID
    implements Built<GIterationID, GIterationIDBuilder> {
  GIterationID._();

  factory GIterationID([String? value]) =>
      _$GIterationID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIterationID> get serializer =>
      _i2.DefaultScalarSerializer<GIterationID>(
          (Object serialized) => GIterationID((serialized as String?)));
}

abstract class GIterationsCadenceID
    implements Built<GIterationsCadenceID, GIterationsCadenceIDBuilder> {
  GIterationsCadenceID._();

  factory GIterationsCadenceID([String? value]) =>
      _$GIterationsCadenceID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GIterationsCadenceID> get serializer =>
      _i2.DefaultScalarSerializer<GIterationsCadenceID>(
          (Object serialized) => GIterationsCadenceID((serialized as String?)));
}

class GIterationSearchableField extends EnumClass {
  const GIterationSearchableField._(String name) : super(name);

  static const GIterationSearchableField TITLE =
      _$gIterationSearchableFieldTITLE;

  static const GIterationSearchableField CADENCE_TITLE =
      _$gIterationSearchableFieldCADENCE_TITLE;

  static Serializer<GIterationSearchableField> get serializer =>
      _$gIterationSearchableFieldSerializer;
  static BuiltSet<GIterationSearchableField> get values =>
      _$gIterationSearchableFieldValues;
  static GIterationSearchableField valueOf(String name) =>
      _$gIterationSearchableFieldValueOf(name);
}

class GIterationSort extends EnumClass {
  const GIterationSort._(String name) : super(name);

  static const GIterationSort CADENCE_AND_DUE_DATE_ASC =
      _$gIterationSortCADENCE_AND_DUE_DATE_ASC;

  static Serializer<GIterationSort> get serializer =>
      _$gIterationSortSerializer;
  static BuiltSet<GIterationSort> get values => _$gIterationSortValues;
  static GIterationSort valueOf(String name) => _$gIterationSortValueOf(name);
}

class GIterationState extends EnumClass {
  const GIterationState._(String name) : super(name);

  static const GIterationState upcoming = _$gIterationStateupcoming;

  static const GIterationState started = _$gIterationStatestarted;

  static const GIterationState current = _$gIterationStatecurrent;

  static const GIterationState opened = _$gIterationStateopened;

  static const GIterationState closed = _$gIterationStateclosed;

  static const GIterationState all = _$gIterationStateall;

  static Serializer<GIterationState> get serializer =>
      _$gIterationStateSerializer;
  static BuiltSet<GIterationState> get values => _$gIterationStateValues;
  static GIterationState valueOf(String name) => _$gIterationStateValueOf(name);
}

class GIterationWildcardId extends EnumClass {
  const GIterationWildcardId._(String name) : super(name);

  static const GIterationWildcardId NONE = _$gIterationWildcardIdNONE;

  static const GIterationWildcardId ANY = _$gIterationWildcardIdANY;

  static const GIterationWildcardId CURRENT = _$gIterationWildcardIdCURRENT;

  static Serializer<GIterationWildcardId> get serializer =>
      _$gIterationWildcardIdSerializer;
  static BuiltSet<GIterationWildcardId> get values =>
      _$gIterationWildcardIdValues;
  static GIterationWildcardId valueOf(String name) =>
      _$gIterationWildcardIdValueOf(name);
}

abstract class GJiraImportStartInput
    implements Built<GJiraImportStartInput, GJiraImportStartInputBuilder> {
  GJiraImportStartInput._();

  factory GJiraImportStartInput(
          [Function(GJiraImportStartInputBuilder b) updates]) =
      _$GJiraImportStartInput;

  String? get clientMutationId;
  String get jiraProjectKey;
  String? get jiraProjectName;
  String get projectPath;
  BuiltList<GJiraUsersMappingInputType>? get usersMapping;
  static Serializer<GJiraImportStartInput> get serializer =>
      _$gJiraImportStartInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GJiraImportStartInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GJiraImportStartInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GJiraImportStartInput.serializer,
        json,
      );
}

abstract class GJiraImportUsersInput
    implements Built<GJiraImportUsersInput, GJiraImportUsersInputBuilder> {
  GJiraImportUsersInput._();

  factory GJiraImportUsersInput(
          [Function(GJiraImportUsersInputBuilder b) updates]) =
      _$GJiraImportUsersInput;

  String? get clientMutationId;
  String get projectPath;
  int? get startAt;
  static Serializer<GJiraImportUsersInput> get serializer =>
      _$gJiraImportUsersInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GJiraImportUsersInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GJiraImportUsersInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GJiraImportUsersInput.serializer,
        json,
      );
}

abstract class GJiraUsersMappingInputType
    implements
        Built<GJiraUsersMappingInputType, GJiraUsersMappingInputTypeBuilder> {
  GJiraUsersMappingInputType._();

  factory GJiraUsersMappingInputType(
          [Function(GJiraUsersMappingInputTypeBuilder b) updates]) =
      _$GJiraUsersMappingInputType;

  int? get gitlabId;
  String get jiraAccountId;
  static Serializer<GJiraUsersMappingInputType> get serializer =>
      _$gJiraUsersMappingInputTypeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GJiraUsersMappingInputType.serializer,
        this,
      ) as Map<String, dynamic>);
  static GJiraUsersMappingInputType? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GJiraUsersMappingInputType.serializer,
        json,
      );
}

class GJobArtifactFileType extends EnumClass {
  const GJobArtifactFileType._(String name) : super(name);

  static const GJobArtifactFileType ARCHIVE = _$gJobArtifactFileTypeARCHIVE;

  static const GJobArtifactFileType METADATA = _$gJobArtifactFileTypeMETADATA;

  static const GJobArtifactFileType TRACE = _$gJobArtifactFileTypeTRACE;

  static const GJobArtifactFileType JUNIT = _$gJobArtifactFileTypeJUNIT;

  static const GJobArtifactFileType METRICS = _$gJobArtifactFileTypeMETRICS;

  static const GJobArtifactFileType METRICS_REFEREE =
      _$gJobArtifactFileTypeMETRICS_REFEREE;

  static const GJobArtifactFileType NETWORK_REFEREE =
      _$gJobArtifactFileTypeNETWORK_REFEREE;

  static const GJobArtifactFileType DOTENV = _$gJobArtifactFileTypeDOTENV;

  static const GJobArtifactFileType COBERTURA = _$gJobArtifactFileTypeCOBERTURA;

  static const GJobArtifactFileType CLUSTER_APPLICATIONS =
      _$gJobArtifactFileTypeCLUSTER_APPLICATIONS;

  static const GJobArtifactFileType LSIF = _$gJobArtifactFileTypeLSIF;

  static const GJobArtifactFileType CYCLONEDX = _$gJobArtifactFileTypeCYCLONEDX;

  static const GJobArtifactFileType SAST = _$gJobArtifactFileTypeSAST;

  static const GJobArtifactFileType SECRET_DETECTION =
      _$gJobArtifactFileTypeSECRET_DETECTION;

  static const GJobArtifactFileType DEPENDENCY_SCANNING =
      _$gJobArtifactFileTypeDEPENDENCY_SCANNING;

  static const GJobArtifactFileType CONTAINER_SCANNING =
      _$gJobArtifactFileTypeCONTAINER_SCANNING;

  static const GJobArtifactFileType CLUSTER_IMAGE_SCANNING =
      _$gJobArtifactFileTypeCLUSTER_IMAGE_SCANNING;

  static const GJobArtifactFileType DAST = _$gJobArtifactFileTypeDAST;

  static const GJobArtifactFileType LICENSE_SCANNING =
      _$gJobArtifactFileTypeLICENSE_SCANNING;

  static const GJobArtifactFileType ACCESSIBILITY =
      _$gJobArtifactFileTypeACCESSIBILITY;

  static const GJobArtifactFileType CODEQUALITY =
      _$gJobArtifactFileTypeCODEQUALITY;

  static const GJobArtifactFileType PERFORMANCE =
      _$gJobArtifactFileTypePERFORMANCE;

  static const GJobArtifactFileType BROWSER_PERFORMANCE =
      _$gJobArtifactFileTypeBROWSER_PERFORMANCE;

  static const GJobArtifactFileType LOAD_PERFORMANCE =
      _$gJobArtifactFileTypeLOAD_PERFORMANCE;

  static const GJobArtifactFileType TERRAFORM = _$gJobArtifactFileTypeTERRAFORM;

  static const GJobArtifactFileType REQUIREMENTS =
      _$gJobArtifactFileTypeREQUIREMENTS;

  static const GJobArtifactFileType COVERAGE_FUZZING =
      _$gJobArtifactFileTypeCOVERAGE_FUZZING;

  static const GJobArtifactFileType API_FUZZING =
      _$gJobArtifactFileTypeAPI_FUZZING;

  static Serializer<GJobArtifactFileType> get serializer =>
      _$gJobArtifactFileTypeSerializer;
  static BuiltSet<GJobArtifactFileType> get values =>
      _$gJobArtifactFileTypeValues;
  static GJobArtifactFileType valueOf(String name) =>
      _$gJobArtifactFileTypeValueOf(name);
}

abstract class GJobArtifactsDestroyInput
    implements
        Built<GJobArtifactsDestroyInput, GJobArtifactsDestroyInputBuilder> {
  GJobArtifactsDestroyInput._();

  factory GJobArtifactsDestroyInput(
          [Function(GJobArtifactsDestroyInputBuilder b) updates]) =
      _$GJobArtifactsDestroyInput;

  GCiBuildID get id;
  String? get clientMutationId;
  static Serializer<GJobArtifactsDestroyInput> get serializer =>
      _$gJobArtifactsDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GJobArtifactsDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GJobArtifactsDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GJobArtifactsDestroyInput.serializer,
        json,
      );
}

abstract class GJobCancelInput
    implements Built<GJobCancelInput, GJobCancelInputBuilder> {
  GJobCancelInput._();

  factory GJobCancelInput([Function(GJobCancelInputBuilder b) updates]) =
      _$GJobCancelInput;

  GCiBuildID get id;
  String? get clientMutationId;
  static Serializer<GJobCancelInput> get serializer =>
      _$gJobCancelInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GJobCancelInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GJobCancelInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GJobCancelInput.serializer,
        json,
      );
}

abstract class GJobID implements Built<GJobID, GJobIDBuilder> {
  GJobID._();

  factory GJobID([String? value]) =>
      _$GJobID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GJobID> get serializer =>
      _i2.DefaultScalarSerializer<GJobID>(
          (Object serialized) => GJobID((serialized as String?)));
}

abstract class GJobPlayInput
    implements Built<GJobPlayInput, GJobPlayInputBuilder> {
  GJobPlayInput._();

  factory GJobPlayInput([Function(GJobPlayInputBuilder b) updates]) =
      _$GJobPlayInput;

  GCiBuildID get id;
  String? get clientMutationId;
  static Serializer<GJobPlayInput> get serializer => _$gJobPlayInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GJobPlayInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GJobPlayInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GJobPlayInput.serializer,
        json,
      );
}

abstract class GJobRetryInput
    implements Built<GJobRetryInput, GJobRetryInputBuilder> {
  GJobRetryInput._();

  factory GJobRetryInput([Function(GJobRetryInputBuilder b) updates]) =
      _$GJobRetryInput;

  GCiBuildID get id;
  String? get clientMutationId;
  BuiltList<GCiVariableInput>? get variables;
  static Serializer<GJobRetryInput> get serializer =>
      _$gJobRetryInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GJobRetryInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GJobRetryInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GJobRetryInput.serializer,
        json,
      );
}

abstract class GJobUnscheduleInput
    implements Built<GJobUnscheduleInput, GJobUnscheduleInputBuilder> {
  GJobUnscheduleInput._();

  factory GJobUnscheduleInput(
      [Function(GJobUnscheduleInputBuilder b) updates]) = _$GJobUnscheduleInput;

  GCiBuildID get id;
  String? get clientMutationId;
  static Serializer<GJobUnscheduleInput> get serializer =>
      _$gJobUnscheduleInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GJobUnscheduleInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GJobUnscheduleInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GJobUnscheduleInput.serializer,
        json,
      );
}

abstract class GJSON implements Built<GJSON, GJSONBuilder> {
  GJSON._();

  factory GJSON([String? value]) =>
      _$GJSON((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GJSON> get serializer => _i2.DefaultScalarSerializer<GJSON>(
      (Object serialized) => GJSON((serialized as String?)));
}

abstract class GJsonString implements Built<GJsonString, GJsonStringBuilder> {
  GJsonString._();

  factory GJsonString([String? value]) =>
      _$GJsonString((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GJsonString> get serializer =>
      _i2.DefaultScalarSerializer<GJsonString>(
          (Object serialized) => GJsonString((serialized as String?)));
}

abstract class GLabelCreateInput
    implements Built<GLabelCreateInput, GLabelCreateInputBuilder> {
  GLabelCreateInput._();

  factory GLabelCreateInput([Function(GLabelCreateInputBuilder b) updates]) =
      _$GLabelCreateInput;

  String? get clientMutationId;
  String? get projectPath;
  String? get groupPath;
  String get title;
  String? get description;
  String? get color;
  static Serializer<GLabelCreateInput> get serializer =>
      _$gLabelCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GLabelCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GLabelCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GLabelCreateInput.serializer,
        json,
      );
}

abstract class GLabelID implements Built<GLabelID, GLabelIDBuilder> {
  GLabelID._();

  factory GLabelID([String? value]) =>
      _$GLabelID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GLabelID> get serializer =>
      _i2.DefaultScalarSerializer<GLabelID>(
          (Object serialized) => GLabelID((serialized as String?)));
}

abstract class GListID implements Built<GListID, GListIDBuilder> {
  GListID._();

  factory GListID([String? value]) =>
      _$GListID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GListID> get serializer =>
      _i2.DefaultScalarSerializer<GListID>(
          (Object serialized) => GListID((serialized as String?)));
}

class GListLimitMetric extends EnumClass {
  const GListLimitMetric._(String name) : super(name);

  static const GListLimitMetric all_metrics = _$gListLimitMetricall_metrics;

  static const GListLimitMetric issue_count = _$gListLimitMetricissue_count;

  static const GListLimitMetric issue_weights = _$gListLimitMetricissue_weights;

  static Serializer<GListLimitMetric> get serializer =>
      _$gListLimitMetricSerializer;
  static BuiltSet<GListLimitMetric> get values => _$gListLimitMetricValues;
  static GListLimitMetric valueOf(String name) =>
      _$gListLimitMetricValueOf(name);
}

abstract class GMarkAsSpamSnippetInput
    implements Built<GMarkAsSpamSnippetInput, GMarkAsSpamSnippetInputBuilder> {
  GMarkAsSpamSnippetInput._();

  factory GMarkAsSpamSnippetInput(
          [Function(GMarkAsSpamSnippetInputBuilder b) updates]) =
      _$GMarkAsSpamSnippetInput;

  String? get clientMutationId;
  GSnippetID get id;
  static Serializer<GMarkAsSpamSnippetInput> get serializer =>
      _$gMarkAsSpamSnippetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMarkAsSpamSnippetInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMarkAsSpamSnippetInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMarkAsSpamSnippetInput.serializer,
        json,
      );
}

class GMeasurementIdentifier extends EnumClass {
  const GMeasurementIdentifier._(String name) : super(name);

  static const GMeasurementIdentifier PROJECTS =
      _$gMeasurementIdentifierPROJECTS;

  static const GMeasurementIdentifier USERS = _$gMeasurementIdentifierUSERS;

  static const GMeasurementIdentifier ISSUES = _$gMeasurementIdentifierISSUES;

  static const GMeasurementIdentifier MERGE_REQUESTS =
      _$gMeasurementIdentifierMERGE_REQUESTS;

  static const GMeasurementIdentifier GROUPS = _$gMeasurementIdentifierGROUPS;

  static const GMeasurementIdentifier PIPELINES =
      _$gMeasurementIdentifierPIPELINES;

  static const GMeasurementIdentifier PIPELINES_SUCCEEDED =
      _$gMeasurementIdentifierPIPELINES_SUCCEEDED;

  static const GMeasurementIdentifier PIPELINES_FAILED =
      _$gMeasurementIdentifierPIPELINES_FAILED;

  static const GMeasurementIdentifier PIPELINES_CANCELED =
      _$gMeasurementIdentifierPIPELINES_CANCELED;

  static const GMeasurementIdentifier PIPELINES_SKIPPED =
      _$gMeasurementIdentifierPIPELINES_SKIPPED;

  static Serializer<GMeasurementIdentifier> get serializer =>
      _$gMeasurementIdentifierSerializer;
  static BuiltSet<GMeasurementIdentifier> get values =>
      _$gMeasurementIdentifierValues;
  static GMeasurementIdentifier valueOf(String name) =>
      _$gMeasurementIdentifierValueOf(name);
}

class GMemberSort extends EnumClass {
  const GMemberSort._(String name) : super(name);

  static const GMemberSort ACCESS_LEVEL_ASC = _$gMemberSortACCESS_LEVEL_ASC;

  static const GMemberSort ACCESS_LEVEL_DESC = _$gMemberSortACCESS_LEVEL_DESC;

  static const GMemberSort USER_FULL_NAME_ASC = _$gMemberSortUSER_FULL_NAME_ASC;

  static const GMemberSort USER_FULL_NAME_DESC =
      _$gMemberSortUSER_FULL_NAME_DESC;

  static const GMemberSort updated_desc = _$gMemberSortupdated_desc;

  static const GMemberSort updated_asc = _$gMemberSortupdated_asc;

  static const GMemberSort created_desc = _$gMemberSortcreated_desc;

  static const GMemberSort created_asc = _$gMemberSortcreated_asc;

  static const GMemberSort UPDATED_DESC = _$gMemberSortUPDATED_DESC;

  static const GMemberSort UPDATED_ASC = _$gMemberSortUPDATED_ASC;

  static const GMemberSort CREATED_DESC = _$gMemberSortCREATED_DESC;

  static const GMemberSort CREATED_ASC = _$gMemberSortCREATED_ASC;

  static Serializer<GMemberSort> get serializer => _$gMemberSortSerializer;
  static BuiltSet<GMemberSort> get values => _$gMemberSortValues;
  static GMemberSort valueOf(String name) => _$gMemberSortValueOf(name);
}

abstract class GMergeRequestAcceptInput
    implements
        Built<GMergeRequestAcceptInput, GMergeRequestAcceptInputBuilder> {
  GMergeRequestAcceptInput._();

  factory GMergeRequestAcceptInput(
          [Function(GMergeRequestAcceptInputBuilder b) updates]) =
      _$GMergeRequestAcceptInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  GMergeStrategyEnum? get strategy;
  String? get commitMessage;
  String get sha;
  String? get squashCommitMessage;
  bool? get shouldRemoveSourceBranch;
  bool? get squash;
  static Serializer<GMergeRequestAcceptInput> get serializer =>
      _$gMergeRequestAcceptInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestAcceptInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestAcceptInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestAcceptInput.serializer,
        json,
      );
}

abstract class GMergeRequestCreateInput
    implements
        Built<GMergeRequestCreateInput, GMergeRequestCreateInputBuilder> {
  GMergeRequestCreateInput._();

  factory GMergeRequestCreateInput(
          [Function(GMergeRequestCreateInputBuilder b) updates]) =
      _$GMergeRequestCreateInput;

  String? get clientMutationId;
  String get projectPath;
  String get title;
  String get sourceBranch;
  String get targetBranch;
  String? get description;
  BuiltList<String>? get labels;
  static Serializer<GMergeRequestCreateInput> get serializer =>
      _$gMergeRequestCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestCreateInput.serializer,
        json,
      );
}

abstract class GMergeRequestID
    implements Built<GMergeRequestID, GMergeRequestIDBuilder> {
  GMergeRequestID._();

  factory GMergeRequestID([String? value]) =>
      _$GMergeRequestID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GMergeRequestID> get serializer =>
      _i2.DefaultScalarSerializer<GMergeRequestID>(
          (Object serialized) => GMergeRequestID((serialized as String?)));
}

class GMergeRequestNewState extends EnumClass {
  const GMergeRequestNewState._(String name) : super(name);

  static const GMergeRequestNewState OPEN = _$gMergeRequestNewStateOPEN;

  static const GMergeRequestNewState CLOSED = _$gMergeRequestNewStateCLOSED;

  static Serializer<GMergeRequestNewState> get serializer =>
      _$gMergeRequestNewStateSerializer;
  static BuiltSet<GMergeRequestNewState> get values =>
      _$gMergeRequestNewStateValues;
  static GMergeRequestNewState valueOf(String name) =>
      _$gMergeRequestNewStateValueOf(name);
}

abstract class GMergeRequestReviewerRereviewInput
    implements
        Built<GMergeRequestReviewerRereviewInput,
            GMergeRequestReviewerRereviewInputBuilder> {
  GMergeRequestReviewerRereviewInput._();

  factory GMergeRequestReviewerRereviewInput(
          [Function(GMergeRequestReviewerRereviewInputBuilder b) updates]) =
      _$GMergeRequestReviewerRereviewInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  GUserID get userId;
  static Serializer<GMergeRequestReviewerRereviewInput> get serializer =>
      _$gMergeRequestReviewerRereviewInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestReviewerRereviewInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestReviewerRereviewInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestReviewerRereviewInput.serializer,
        json,
      );
}

class GMergeRequestReviewState extends EnumClass {
  const GMergeRequestReviewState._(String name) : super(name);

  static const GMergeRequestReviewState UNREVIEWED =
      _$gMergeRequestReviewStateUNREVIEWED;

  static const GMergeRequestReviewState REVIEWED =
      _$gMergeRequestReviewStateREVIEWED;

  static Serializer<GMergeRequestReviewState> get serializer =>
      _$gMergeRequestReviewStateSerializer;
  static BuiltSet<GMergeRequestReviewState> get values =>
      _$gMergeRequestReviewStateValues;
  static GMergeRequestReviewState valueOf(String name) =>
      _$gMergeRequestReviewStateValueOf(name);
}

abstract class GMergeRequestSetAssigneesInput
    implements
        Built<GMergeRequestSetAssigneesInput,
            GMergeRequestSetAssigneesInputBuilder> {
  GMergeRequestSetAssigneesInput._();

  factory GMergeRequestSetAssigneesInput(
          [Function(GMergeRequestSetAssigneesInputBuilder b) updates]) =
      _$GMergeRequestSetAssigneesInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  BuiltList<String> get assigneeUsernames;
  GMutationOperationMode? get operationMode;
  static Serializer<GMergeRequestSetAssigneesInput> get serializer =>
      _$gMergeRequestSetAssigneesInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestSetAssigneesInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestSetAssigneesInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestSetAssigneesInput.serializer,
        json,
      );
}

abstract class GMergeRequestSetDraftInput
    implements
        Built<GMergeRequestSetDraftInput, GMergeRequestSetDraftInputBuilder> {
  GMergeRequestSetDraftInput._();

  factory GMergeRequestSetDraftInput(
          [Function(GMergeRequestSetDraftInputBuilder b) updates]) =
      _$GMergeRequestSetDraftInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  bool get draft;
  static Serializer<GMergeRequestSetDraftInput> get serializer =>
      _$gMergeRequestSetDraftInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestSetDraftInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestSetDraftInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestSetDraftInput.serializer,
        json,
      );
}

abstract class GMergeRequestSetLabelsInput
    implements
        Built<GMergeRequestSetLabelsInput, GMergeRequestSetLabelsInputBuilder> {
  GMergeRequestSetLabelsInput._();

  factory GMergeRequestSetLabelsInput(
          [Function(GMergeRequestSetLabelsInputBuilder b) updates]) =
      _$GMergeRequestSetLabelsInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  BuiltList<GLabelID> get labelIds;
  GMutationOperationMode? get operationMode;
  static Serializer<GMergeRequestSetLabelsInput> get serializer =>
      _$gMergeRequestSetLabelsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestSetLabelsInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestSetLabelsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestSetLabelsInput.serializer,
        json,
      );
}

abstract class GMergeRequestSetLockedInput
    implements
        Built<GMergeRequestSetLockedInput, GMergeRequestSetLockedInputBuilder> {
  GMergeRequestSetLockedInput._();

  factory GMergeRequestSetLockedInput(
          [Function(GMergeRequestSetLockedInputBuilder b) updates]) =
      _$GMergeRequestSetLockedInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  bool get locked;
  static Serializer<GMergeRequestSetLockedInput> get serializer =>
      _$gMergeRequestSetLockedInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestSetLockedInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestSetLockedInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestSetLockedInput.serializer,
        json,
      );
}

abstract class GMergeRequestSetMilestoneInput
    implements
        Built<GMergeRequestSetMilestoneInput,
            GMergeRequestSetMilestoneInputBuilder> {
  GMergeRequestSetMilestoneInput._();

  factory GMergeRequestSetMilestoneInput(
          [Function(GMergeRequestSetMilestoneInputBuilder b) updates]) =
      _$GMergeRequestSetMilestoneInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  GMilestoneID? get milestoneId;
  static Serializer<GMergeRequestSetMilestoneInput> get serializer =>
      _$gMergeRequestSetMilestoneInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestSetMilestoneInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestSetMilestoneInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestSetMilestoneInput.serializer,
        json,
      );
}

abstract class GMergeRequestSetReviewersInput
    implements
        Built<GMergeRequestSetReviewersInput,
            GMergeRequestSetReviewersInputBuilder> {
  GMergeRequestSetReviewersInput._();

  factory GMergeRequestSetReviewersInput(
          [Function(GMergeRequestSetReviewersInputBuilder b) updates]) =
      _$GMergeRequestSetReviewersInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  BuiltList<String> get reviewerUsernames;
  GMutationOperationMode? get operationMode;
  static Serializer<GMergeRequestSetReviewersInput> get serializer =>
      _$gMergeRequestSetReviewersInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestSetReviewersInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestSetReviewersInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestSetReviewersInput.serializer,
        json,
      );
}

abstract class GMergeRequestSetSubscriptionInput
    implements
        Built<GMergeRequestSetSubscriptionInput,
            GMergeRequestSetSubscriptionInputBuilder> {
  GMergeRequestSetSubscriptionInput._();

  factory GMergeRequestSetSubscriptionInput(
          [Function(GMergeRequestSetSubscriptionInputBuilder b) updates]) =
      _$GMergeRequestSetSubscriptionInput;

  String? get clientMutationId;
  bool get subscribedState;
  String get projectPath;
  String get iid;
  static Serializer<GMergeRequestSetSubscriptionInput> get serializer =>
      _$gMergeRequestSetSubscriptionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestSetSubscriptionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestSetSubscriptionInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestSetSubscriptionInput.serializer,
        json,
      );
}

class GMergeRequestSort extends EnumClass {
  const GMergeRequestSort._(String name) : super(name);

  static const GMergeRequestSort MERGED_AT_ASC =
      _$gMergeRequestSortMERGED_AT_ASC;

  static const GMergeRequestSort MERGED_AT_DESC =
      _$gMergeRequestSortMERGED_AT_DESC;

  static const GMergeRequestSort CLOSED_AT_ASC =
      _$gMergeRequestSortCLOSED_AT_ASC;

  static const GMergeRequestSort CLOSED_AT_DESC =
      _$gMergeRequestSortCLOSED_AT_DESC;

  static const GMergeRequestSort TITLE_ASC = _$gMergeRequestSortTITLE_ASC;

  static const GMergeRequestSort TITLE_DESC = _$gMergeRequestSortTITLE_DESC;

  static const GMergeRequestSort PRIORITY_ASC = _$gMergeRequestSortPRIORITY_ASC;

  static const GMergeRequestSort PRIORITY_DESC =
      _$gMergeRequestSortPRIORITY_DESC;

  static const GMergeRequestSort LABEL_PRIORITY_ASC =
      _$gMergeRequestSortLABEL_PRIORITY_ASC;

  static const GMergeRequestSort LABEL_PRIORITY_DESC =
      _$gMergeRequestSortLABEL_PRIORITY_DESC;

  static const GMergeRequestSort MILESTONE_DUE_ASC =
      _$gMergeRequestSortMILESTONE_DUE_ASC;

  static const GMergeRequestSort MILESTONE_DUE_DESC =
      _$gMergeRequestSortMILESTONE_DUE_DESC;

  static const GMergeRequestSort updated_desc = _$gMergeRequestSortupdated_desc;

  static const GMergeRequestSort updated_asc = _$gMergeRequestSortupdated_asc;

  static const GMergeRequestSort created_desc = _$gMergeRequestSortcreated_desc;

  static const GMergeRequestSort created_asc = _$gMergeRequestSortcreated_asc;

  static const GMergeRequestSort UPDATED_DESC = _$gMergeRequestSortUPDATED_DESC;

  static const GMergeRequestSort UPDATED_ASC = _$gMergeRequestSortUPDATED_ASC;

  static const GMergeRequestSort CREATED_DESC = _$gMergeRequestSortCREATED_DESC;

  static const GMergeRequestSort CREATED_ASC = _$gMergeRequestSortCREATED_ASC;

  static Serializer<GMergeRequestSort> get serializer =>
      _$gMergeRequestSortSerializer;
  static BuiltSet<GMergeRequestSort> get values => _$gMergeRequestSortValues;
  static GMergeRequestSort valueOf(String name) =>
      _$gMergeRequestSortValueOf(name);
}

abstract class GMergeRequestsResolverNegatedParams
    implements
        Built<GMergeRequestsResolverNegatedParams,
            GMergeRequestsResolverNegatedParamsBuilder> {
  GMergeRequestsResolverNegatedParams._();

  factory GMergeRequestsResolverNegatedParams(
          [Function(GMergeRequestsResolverNegatedParamsBuilder b) updates]) =
      _$GMergeRequestsResolverNegatedParams;

  BuiltList<String>? get labels;
  String? get milestoneTitle;
  static Serializer<GMergeRequestsResolverNegatedParams> get serializer =>
      _$gMergeRequestsResolverNegatedParamsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestsResolverNegatedParams.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestsResolverNegatedParams? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestsResolverNegatedParams.serializer,
        json,
      );
}

class GMergeRequestState extends EnumClass {
  const GMergeRequestState._(String name) : super(name);

  static const GMergeRequestState merged = _$gMergeRequestStatemerged;

  static const GMergeRequestState opened = _$gMergeRequestStateopened;

  static const GMergeRequestState closed = _$gMergeRequestStateclosed;

  static const GMergeRequestState locked = _$gMergeRequestStatelocked;

  static const GMergeRequestState all = _$gMergeRequestStateall;

  static Serializer<GMergeRequestState> get serializer =>
      _$gMergeRequestStateSerializer;
  static BuiltSet<GMergeRequestState> get values => _$gMergeRequestStateValues;
  static GMergeRequestState valueOf(String name) =>
      _$gMergeRequestStateValueOf(name);
}

abstract class GMergeRequestUpdateInput
    implements
        Built<GMergeRequestUpdateInput, GMergeRequestUpdateInputBuilder> {
  GMergeRequestUpdateInput._();

  factory GMergeRequestUpdateInput(
          [Function(GMergeRequestUpdateInputBuilder b) updates]) =
      _$GMergeRequestUpdateInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  String? get title;
  String? get targetBranch;
  String? get description;
  GMergeRequestNewState? get state;
  static Serializer<GMergeRequestUpdateInput> get serializer =>
      _$gMergeRequestUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GMergeRequestUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GMergeRequestUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GMergeRequestUpdateInput.serializer,
        json,
      );
}

class GMergeStatus extends EnumClass {
  const GMergeStatus._(String name) : super(name);

  static const GMergeStatus UNCHECKED = _$gMergeStatusUNCHECKED;

  static const GMergeStatus CHECKING = _$gMergeStatusCHECKING;

  static const GMergeStatus CAN_BE_MERGED = _$gMergeStatusCAN_BE_MERGED;

  static const GMergeStatus CANNOT_BE_MERGED = _$gMergeStatusCANNOT_BE_MERGED;

  static const GMergeStatus CANNOT_BE_MERGED_RECHECK =
      _$gMergeStatusCANNOT_BE_MERGED_RECHECK;

  static Serializer<GMergeStatus> get serializer => _$gMergeStatusSerializer;
  static BuiltSet<GMergeStatus> get values => _$gMergeStatusValues;
  static GMergeStatus valueOf(String name) => _$gMergeStatusValueOf(name);
}

class GMergeStrategyEnum extends EnumClass {
  const GMergeStrategyEnum._(String name) : super(name);

  static const GMergeStrategyEnum MERGE_TRAIN = _$gMergeStrategyEnumMERGE_TRAIN;

  static const GMergeStrategyEnum ADD_TO_MERGE_TRAIN_WHEN_PIPELINE_SUCCEEDS =
      _$gMergeStrategyEnumADD_TO_MERGE_TRAIN_WHEN_PIPELINE_SUCCEEDS;

  static const GMergeStrategyEnum MERGE_WHEN_PIPELINE_SUCCEEDS =
      _$gMergeStrategyEnumMERGE_WHEN_PIPELINE_SUCCEEDS;

  static Serializer<GMergeStrategyEnum> get serializer =>
      _$gMergeStrategyEnumSerializer;
  static BuiltSet<GMergeStrategyEnum> get values => _$gMergeStrategyEnumValues;
  static GMergeStrategyEnum valueOf(String name) =>
      _$gMergeStrategyEnumValueOf(name);
}

abstract class GMetricsDashboardAnnotationID
    implements
        Built<GMetricsDashboardAnnotationID,
            GMetricsDashboardAnnotationIDBuilder> {
  GMetricsDashboardAnnotationID._();

  factory GMetricsDashboardAnnotationID([String? value]) =>
      _$GMetricsDashboardAnnotationID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GMetricsDashboardAnnotationID> get serializer =>
      _i2.DefaultScalarSerializer<GMetricsDashboardAnnotationID>(
          (Object serialized) =>
              GMetricsDashboardAnnotationID((serialized as String?)));
}

abstract class GMilestoneID
    implements Built<GMilestoneID, GMilestoneIDBuilder> {
  GMilestoneID._();

  factory GMilestoneID([String? value]) =>
      _$GMilestoneID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GMilestoneID> get serializer =>
      _i2.DefaultScalarSerializer<GMilestoneID>(
          (Object serialized) => GMilestoneID((serialized as String?)));
}

class GMilestoneSort extends EnumClass {
  const GMilestoneSort._(String name) : super(name);

  static const GMilestoneSort DUE_DATE_ASC = _$gMilestoneSortDUE_DATE_ASC;

  static const GMilestoneSort DUE_DATE_DESC = _$gMilestoneSortDUE_DATE_DESC;

  static const GMilestoneSort EXPIRED_LAST_DUE_DATE_ASC =
      _$gMilestoneSortEXPIRED_LAST_DUE_DATE_ASC;

  static const GMilestoneSort EXPIRED_LAST_DUE_DATE_DESC =
      _$gMilestoneSortEXPIRED_LAST_DUE_DATE_DESC;

  static const GMilestoneSort updated_desc = _$gMilestoneSortupdated_desc;

  static const GMilestoneSort updated_asc = _$gMilestoneSortupdated_asc;

  static const GMilestoneSort created_desc = _$gMilestoneSortcreated_desc;

  static const GMilestoneSort created_asc = _$gMilestoneSortcreated_asc;

  static const GMilestoneSort UPDATED_DESC = _$gMilestoneSortUPDATED_DESC;

  static const GMilestoneSort UPDATED_ASC = _$gMilestoneSortUPDATED_ASC;

  static const GMilestoneSort CREATED_DESC = _$gMilestoneSortCREATED_DESC;

  static const GMilestoneSort CREATED_ASC = _$gMilestoneSortCREATED_ASC;

  static Serializer<GMilestoneSort> get serializer =>
      _$gMilestoneSortSerializer;
  static BuiltSet<GMilestoneSort> get values => _$gMilestoneSortValues;
  static GMilestoneSort valueOf(String name) => _$gMilestoneSortValueOf(name);
}

class GMilestoneStateEnum extends EnumClass {
  const GMilestoneStateEnum._(String name) : super(name);

  static const GMilestoneStateEnum active = _$gMilestoneStateEnumactive;

  static const GMilestoneStateEnum closed = _$gMilestoneStateEnumclosed;

  static Serializer<GMilestoneStateEnum> get serializer =>
      _$gMilestoneStateEnumSerializer;
  static BuiltSet<GMilestoneStateEnum> get values =>
      _$gMilestoneStateEnumValues;
  static GMilestoneStateEnum valueOf(String name) =>
      _$gMilestoneStateEnumValueOf(name);
}

class GMilestoneWildcardId extends EnumClass {
  const GMilestoneWildcardId._(String name) : super(name);

  static const GMilestoneWildcardId NONE = _$gMilestoneWildcardIdNONE;

  static const GMilestoneWildcardId ANY = _$gMilestoneWildcardIdANY;

  static const GMilestoneWildcardId STARTED = _$gMilestoneWildcardIdSTARTED;

  static const GMilestoneWildcardId UPCOMING = _$gMilestoneWildcardIdUPCOMING;

  static Serializer<GMilestoneWildcardId> get serializer =>
      _$gMilestoneWildcardIdSerializer;
  static BuiltSet<GMilestoneWildcardId> get values =>
      _$gMilestoneWildcardIdValues;
  static GMilestoneWildcardId valueOf(String name) =>
      _$gMilestoneWildcardIdValueOf(name);
}

class GMoveType extends EnumClass {
  const GMoveType._(String name) : super(name);

  static const GMoveType before = _$gMoveTypebefore;

  static const GMoveType after = _$gMoveTypeafter;

  static Serializer<GMoveType> get serializer => _$gMoveTypeSerializer;
  static BuiltSet<GMoveType> get values => _$gMoveTypeValues;
  static GMoveType valueOf(String name) => _$gMoveTypeValueOf(name);
}

class GMutationOperationMode extends EnumClass {
  const GMutationOperationMode._(String name) : super(name);

  static const GMutationOperationMode REPLACE = _$gMutationOperationModeREPLACE;

  static const GMutationOperationMode APPEND = _$gMutationOperationModeAPPEND;

  static const GMutationOperationMode REMOVE = _$gMutationOperationModeREMOVE;

  static Serializer<GMutationOperationMode> get serializer =>
      _$gMutationOperationModeSerializer;
  static BuiltSet<GMutationOperationMode> get values =>
      _$gMutationOperationModeValues;
  static GMutationOperationMode valueOf(String name) =>
      _$gMutationOperationModeValueOf(name);
}

abstract class GNamespaceBanDestroyInput
    implements
        Built<GNamespaceBanDestroyInput, GNamespaceBanDestroyInputBuilder> {
  GNamespaceBanDestroyInput._();

  factory GNamespaceBanDestroyInput(
          [Function(GNamespaceBanDestroyInputBuilder b) updates]) =
      _$GNamespaceBanDestroyInput;

  String? get clientMutationId;
  GNamespacesNamespaceBanID get id;
  static Serializer<GNamespaceBanDestroyInput> get serializer =>
      _$gNamespaceBanDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNamespaceBanDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GNamespaceBanDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNamespaceBanDestroyInput.serializer,
        json,
      );
}

abstract class GNamespaceCiCdSettingsUpdateInput
    implements
        Built<GNamespaceCiCdSettingsUpdateInput,
            GNamespaceCiCdSettingsUpdateInputBuilder> {
  GNamespaceCiCdSettingsUpdateInput._();

  factory GNamespaceCiCdSettingsUpdateInput(
          [Function(GNamespaceCiCdSettingsUpdateInputBuilder b) updates]) =
      _$GNamespaceCiCdSettingsUpdateInput;

  String? get clientMutationId;
  bool? get allowStaleRunnerPruning;
  String get fullPath;
  static Serializer<GNamespaceCiCdSettingsUpdateInput> get serializer =>
      _$gNamespaceCiCdSettingsUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNamespaceCiCdSettingsUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GNamespaceCiCdSettingsUpdateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNamespaceCiCdSettingsUpdateInput.serializer,
        json,
      );
}

abstract class GNamespaceID
    implements Built<GNamespaceID, GNamespaceIDBuilder> {
  GNamespaceID._();

  factory GNamespaceID([String? value]) =>
      _$GNamespaceID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GNamespaceID> get serializer =>
      _i2.DefaultScalarSerializer<GNamespaceID>(
          (Object serialized) => GNamespaceID((serialized as String?)));
}

abstract class GNamespaceIncreaseStorageTemporarilyInput
    implements
        Built<GNamespaceIncreaseStorageTemporarilyInput,
            GNamespaceIncreaseStorageTemporarilyInputBuilder> {
  GNamespaceIncreaseStorageTemporarilyInput._();

  factory GNamespaceIncreaseStorageTemporarilyInput(
      [Function(GNamespaceIncreaseStorageTemporarilyInputBuilder b)
          updates]) = _$GNamespaceIncreaseStorageTemporarilyInput;

  GNamespaceID get id;
  String? get clientMutationId;
  static Serializer<GNamespaceIncreaseStorageTemporarilyInput> get serializer =>
      _$gNamespaceIncreaseStorageTemporarilyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNamespaceIncreaseStorageTemporarilyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GNamespaceIncreaseStorageTemporarilyInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNamespaceIncreaseStorageTemporarilyInput.serializer,
        json,
      );
}

class GNamespaceProjectSort extends EnumClass {
  const GNamespaceProjectSort._(String name) : super(name);

  static const GNamespaceProjectSort SIMILARITY =
      _$gNamespaceProjectSortSIMILARITY;

  static const GNamespaceProjectSort STORAGE = _$gNamespaceProjectSortSTORAGE;

  static Serializer<GNamespaceProjectSort> get serializer =>
      _$gNamespaceProjectSortSerializer;
  static BuiltSet<GNamespaceProjectSort> get values =>
      _$gNamespaceProjectSortValues;
  static GNamespaceProjectSort valueOf(String name) =>
      _$gNamespaceProjectSortValueOf(name);
}

abstract class GNamespacesNamespaceBanID
    implements
        Built<GNamespacesNamespaceBanID, GNamespacesNamespaceBanIDBuilder> {
  GNamespacesNamespaceBanID._();

  factory GNamespacesNamespaceBanID([String? value]) =>
      _$GNamespacesNamespaceBanID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GNamespacesNamespaceBanID> get serializer =>
      _i2.DefaultScalarSerializer<GNamespacesNamespaceBanID>(
          (Object serialized) =>
              GNamespacesNamespaceBanID((serialized as String?)));
}

abstract class GNegatedBoardIssueInput
    implements Built<GNegatedBoardIssueInput, GNegatedBoardIssueInputBuilder> {
  GNegatedBoardIssueInput._();

  factory GNegatedBoardIssueInput(
          [Function(GNegatedBoardIssueInputBuilder b) updates]) =
      _$GNegatedBoardIssueInput;

  BuiltList<String>? get labelName;
  String? get authorUsername;
  String? get myReactionEmoji;
  BuiltList<String>? get iids;
  String? get milestoneTitle;
  BuiltList<String>? get assigneeUsername;
  String? get releaseTag;
  BuiltList<GIssueType>? get types;
  GMilestoneWildcardId? get milestoneWildcardId;
  GEpicID? get epicId;
  String? get iterationTitle;
  String? get weight;
  BuiltList<GIterationID>? get iterationId;
  GNegatedIterationWildcardId? get iterationWildcardId;
  static Serializer<GNegatedBoardIssueInput> get serializer =>
      _$gNegatedBoardIssueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNegatedBoardIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GNegatedBoardIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNegatedBoardIssueInput.serializer,
        json,
      );
}

abstract class GNegatedEpicBoardIssueInput
    implements
        Built<GNegatedEpicBoardIssueInput, GNegatedEpicBoardIssueInputBuilder> {
  GNegatedEpicBoardIssueInput._();

  factory GNegatedEpicBoardIssueInput(
          [Function(GNegatedEpicBoardIssueInputBuilder b) updates]) =
      _$GNegatedEpicBoardIssueInput;

  BuiltList<String>? get labelName;
  String? get authorUsername;
  String? get myReactionEmoji;
  static Serializer<GNegatedEpicBoardIssueInput> get serializer =>
      _$gNegatedEpicBoardIssueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNegatedEpicBoardIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GNegatedEpicBoardIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNegatedEpicBoardIssueInput.serializer,
        json,
      );
}

abstract class GNegatedEpicFilterInput
    implements Built<GNegatedEpicFilterInput, GNegatedEpicFilterInputBuilder> {
  GNegatedEpicFilterInput._();

  factory GNegatedEpicFilterInput(
          [Function(GNegatedEpicFilterInputBuilder b) updates]) =
      _$GNegatedEpicFilterInput;

  BuiltList<String>? get labelName;
  String? get authorUsername;
  String? get myReactionEmoji;
  static Serializer<GNegatedEpicFilterInput> get serializer =>
      _$gNegatedEpicFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNegatedEpicFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GNegatedEpicFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNegatedEpicFilterInput.serializer,
        json,
      );
}

abstract class GNegatedIssueFilterInput
    implements
        Built<GNegatedIssueFilterInput, GNegatedIssueFilterInputBuilder> {
  GNegatedIssueFilterInput._();

  factory GNegatedIssueFilterInput(
          [Function(GNegatedIssueFilterInputBuilder b) updates]) =
      _$GNegatedIssueFilterInput;

  String? get assigneeId;
  BuiltList<String>? get assigneeUsernames;
  String? get authorUsername;
  BuiltList<String>? get iids;
  BuiltList<String>? get labelName;
  BuiltList<String>? get milestoneTitle;
  GNegatedMilestoneWildcardId? get milestoneWildcardId;
  String? get myReactionEmoji;
  BuiltList<String>? get releaseTag;
  BuiltList<GIssueType>? get types;
  String? get epicId;
  String? get weight;
  BuiltList<String>? get iterationId;
  GIterationWildcardId? get iterationWildcardId;
  static Serializer<GNegatedIssueFilterInput> get serializer =>
      _$gNegatedIssueFilterInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GNegatedIssueFilterInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GNegatedIssueFilterInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GNegatedIssueFilterInput.serializer,
        json,
      );
}

class GNegatedIterationWildcardId extends EnumClass {
  const GNegatedIterationWildcardId._(String name) : super(name);

  static const GNegatedIterationWildcardId CURRENT =
      _$gNegatedIterationWildcardIdCURRENT;

  static Serializer<GNegatedIterationWildcardId> get serializer =>
      _$gNegatedIterationWildcardIdSerializer;
  static BuiltSet<GNegatedIterationWildcardId> get values =>
      _$gNegatedIterationWildcardIdValues;
  static GNegatedIterationWildcardId valueOf(String name) =>
      _$gNegatedIterationWildcardIdValueOf(name);
}

class GNegatedMilestoneWildcardId extends EnumClass {
  const GNegatedMilestoneWildcardId._(String name) : super(name);

  static const GNegatedMilestoneWildcardId STARTED =
      _$gNegatedMilestoneWildcardIdSTARTED;

  static const GNegatedMilestoneWildcardId UPCOMING =
      _$gNegatedMilestoneWildcardIdUPCOMING;

  static Serializer<GNegatedMilestoneWildcardId> get serializer =>
      _$gNegatedMilestoneWildcardIdSerializer;
  static BuiltSet<GNegatedMilestoneWildcardId> get values =>
      _$gNegatedMilestoneWildcardIdValues;
  static GNegatedMilestoneWildcardId valueOf(String name) =>
      _$gNegatedMilestoneWildcardIdValueOf(name);
}

class GNetworkPolicyKind extends EnumClass {
  const GNetworkPolicyKind._(String name) : super(name);

  static const GNetworkPolicyKind CiliumNetworkPolicy =
      _$gNetworkPolicyKindCiliumNetworkPolicy;

  static const GNetworkPolicyKind NetworkPolicy =
      _$gNetworkPolicyKindNetworkPolicy;

  static Serializer<GNetworkPolicyKind> get serializer =>
      _$gNetworkPolicyKindSerializer;
  static BuiltSet<GNetworkPolicyKind> get values => _$gNetworkPolicyKindValues;
  static GNetworkPolicyKind valueOf(String name) =>
      _$gNetworkPolicyKindValueOf(name);
}

abstract class GNoteableID implements Built<GNoteableID, GNoteableIDBuilder> {
  GNoteableID._();

  factory GNoteableID([String? value]) =>
      _$GNoteableID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GNoteableID> get serializer =>
      _i2.DefaultScalarSerializer<GNoteableID>(
          (Object serialized) => GNoteableID((serialized as String?)));
}

abstract class GNoteID implements Built<GNoteID, GNoteIDBuilder> {
  GNoteID._();

  factory GNoteID([String? value]) =>
      _$GNoteID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GNoteID> get serializer =>
      _i2.DefaultScalarSerializer<GNoteID>(
          (Object serialized) => GNoteID((serialized as String?)));
}

abstract class GOncallRotationActivePeriodInputType
    implements
        Built<GOncallRotationActivePeriodInputType,
            GOncallRotationActivePeriodInputTypeBuilder> {
  GOncallRotationActivePeriodInputType._();

  factory GOncallRotationActivePeriodInputType(
          [Function(GOncallRotationActivePeriodInputTypeBuilder b) updates]) =
      _$GOncallRotationActivePeriodInputType;

  String get startTime;
  String get endTime;
  static Serializer<GOncallRotationActivePeriodInputType> get serializer =>
      _$gOncallRotationActivePeriodInputTypeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOncallRotationActivePeriodInputType.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOncallRotationActivePeriodInputType? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOncallRotationActivePeriodInputType.serializer,
        json,
      );
}

abstract class GOncallRotationCreateInput
    implements
        Built<GOncallRotationCreateInput, GOncallRotationCreateInputBuilder> {
  GOncallRotationCreateInput._();

  factory GOncallRotationCreateInput(
          [Function(GOncallRotationCreateInputBuilder b) updates]) =
      _$GOncallRotationCreateInput;

  String? get clientMutationId;
  String get projectPath;
  String get scheduleIid;
  String get name;
  GOncallRotationDateInputType get startsAt;
  GOncallRotationDateInputType? get endsAt;
  GOncallRotationLengthInputType get rotationLength;
  GOncallRotationActivePeriodInputType? get activePeriod;
  BuiltList<GOncallUserInputType> get participants;
  static Serializer<GOncallRotationCreateInput> get serializer =>
      _$gOncallRotationCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOncallRotationCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOncallRotationCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOncallRotationCreateInput.serializer,
        json,
      );
}

abstract class GOncallRotationDateInputType
    implements
        Built<GOncallRotationDateInputType,
            GOncallRotationDateInputTypeBuilder> {
  GOncallRotationDateInputType._();

  factory GOncallRotationDateInputType(
          [Function(GOncallRotationDateInputTypeBuilder b) updates]) =
      _$GOncallRotationDateInputType;

  String get date;
  String get time;
  static Serializer<GOncallRotationDateInputType> get serializer =>
      _$gOncallRotationDateInputTypeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOncallRotationDateInputType.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOncallRotationDateInputType? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOncallRotationDateInputType.serializer,
        json,
      );
}

abstract class GOncallRotationDestroyInput
    implements
        Built<GOncallRotationDestroyInput, GOncallRotationDestroyInputBuilder> {
  GOncallRotationDestroyInput._();

  factory GOncallRotationDestroyInput(
          [Function(GOncallRotationDestroyInputBuilder b) updates]) =
      _$GOncallRotationDestroyInput;

  String? get clientMutationId;
  String get projectPath;
  String get scheduleIid;
  GIncidentManagementOncallRotationID get id;
  static Serializer<GOncallRotationDestroyInput> get serializer =>
      _$gOncallRotationDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOncallRotationDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOncallRotationDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOncallRotationDestroyInput.serializer,
        json,
      );
}

abstract class GOncallRotationLengthInputType
    implements
        Built<GOncallRotationLengthInputType,
            GOncallRotationLengthInputTypeBuilder> {
  GOncallRotationLengthInputType._();

  factory GOncallRotationLengthInputType(
          [Function(GOncallRotationLengthInputTypeBuilder b) updates]) =
      _$GOncallRotationLengthInputType;

  int get length;
  GOncallRotationUnitEnum get unit;
  static Serializer<GOncallRotationLengthInputType> get serializer =>
      _$gOncallRotationLengthInputTypeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOncallRotationLengthInputType.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOncallRotationLengthInputType? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOncallRotationLengthInputType.serializer,
        json,
      );
}

class GOncallRotationUnitEnum extends EnumClass {
  const GOncallRotationUnitEnum._(String name) : super(name);

  static const GOncallRotationUnitEnum HOURS = _$gOncallRotationUnitEnumHOURS;

  static const GOncallRotationUnitEnum DAYS = _$gOncallRotationUnitEnumDAYS;

  static const GOncallRotationUnitEnum WEEKS = _$gOncallRotationUnitEnumWEEKS;

  static Serializer<GOncallRotationUnitEnum> get serializer =>
      _$gOncallRotationUnitEnumSerializer;
  static BuiltSet<GOncallRotationUnitEnum> get values =>
      _$gOncallRotationUnitEnumValues;
  static GOncallRotationUnitEnum valueOf(String name) =>
      _$gOncallRotationUnitEnumValueOf(name);
}

abstract class GOncallRotationUpdateInput
    implements
        Built<GOncallRotationUpdateInput, GOncallRotationUpdateInputBuilder> {
  GOncallRotationUpdateInput._();

  factory GOncallRotationUpdateInput(
          [Function(GOncallRotationUpdateInputBuilder b) updates]) =
      _$GOncallRotationUpdateInput;

  String? get clientMutationId;
  GIncidentManagementOncallRotationID get id;
  String? get name;
  GOncallRotationDateInputType? get startsAt;
  GOncallRotationDateInputType? get endsAt;
  GOncallRotationLengthInputType? get rotationLength;
  GOncallRotationActivePeriodInputType? get activePeriod;
  BuiltList<GOncallUserInputType>? get participants;
  static Serializer<GOncallRotationUpdateInput> get serializer =>
      _$gOncallRotationUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOncallRotationUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOncallRotationUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOncallRotationUpdateInput.serializer,
        json,
      );
}

abstract class GOncallScheduleCreateInput
    implements
        Built<GOncallScheduleCreateInput, GOncallScheduleCreateInputBuilder> {
  GOncallScheduleCreateInput._();

  factory GOncallScheduleCreateInput(
          [Function(GOncallScheduleCreateInputBuilder b) updates]) =
      _$GOncallScheduleCreateInput;

  String? get clientMutationId;
  String get projectPath;
  String get name;
  String? get description;
  String get timezone;
  static Serializer<GOncallScheduleCreateInput> get serializer =>
      _$gOncallScheduleCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOncallScheduleCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOncallScheduleCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOncallScheduleCreateInput.serializer,
        json,
      );
}

abstract class GOncallScheduleDestroyInput
    implements
        Built<GOncallScheduleDestroyInput, GOncallScheduleDestroyInputBuilder> {
  GOncallScheduleDestroyInput._();

  factory GOncallScheduleDestroyInput(
          [Function(GOncallScheduleDestroyInputBuilder b) updates]) =
      _$GOncallScheduleDestroyInput;

  String? get clientMutationId;
  String get projectPath;
  String get iid;
  static Serializer<GOncallScheduleDestroyInput> get serializer =>
      _$gOncallScheduleDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOncallScheduleDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOncallScheduleDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOncallScheduleDestroyInput.serializer,
        json,
      );
}

abstract class GOncallScheduleUpdateInput
    implements
        Built<GOncallScheduleUpdateInput, GOncallScheduleUpdateInputBuilder> {
  GOncallScheduleUpdateInput._();

  factory GOncallScheduleUpdateInput(
          [Function(GOncallScheduleUpdateInputBuilder b) updates]) =
      _$GOncallScheduleUpdateInput;

  String? get clientMutationId;
  String get projectPath;
  String get iid;
  String? get name;
  String? get description;
  String? get timezone;
  static Serializer<GOncallScheduleUpdateInput> get serializer =>
      _$gOncallScheduleUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOncallScheduleUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOncallScheduleUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOncallScheduleUpdateInput.serializer,
        json,
      );
}

abstract class GOncallUserInputType
    implements Built<GOncallUserInputType, GOncallUserInputTypeBuilder> {
  GOncallUserInputType._();

  factory GOncallUserInputType(
          [Function(GOncallUserInputTypeBuilder b) updates]) =
      _$GOncallUserInputType;

  String get username;
  GDataVisualizationColorEnum? get colorPalette;
  GDataVisualizationWeightEnum? get colorWeight;
  static Serializer<GOncallUserInputType> get serializer =>
      _$gOncallUserInputTypeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GOncallUserInputType.serializer,
        this,
      ) as Map<String, dynamic>);
  static GOncallUserInputType? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GOncallUserInputType.serializer,
        json,
      );
}

class GOrganizationSort extends EnumClass {
  const GOrganizationSort._(String name) : super(name);

  static const GOrganizationSort NAME_ASC = _$gOrganizationSortNAME_ASC;

  static const GOrganizationSort NAME_DESC = _$gOrganizationSortNAME_DESC;

  static const GOrganizationSort DESCRIPTION_ASC =
      _$gOrganizationSortDESCRIPTION_ASC;

  static const GOrganizationSort DESCRIPTION_DESC =
      _$gOrganizationSortDESCRIPTION_DESC;

  static const GOrganizationSort DEFAULT_RATE_ASC =
      _$gOrganizationSortDEFAULT_RATE_ASC;

  static const GOrganizationSort DEFAULT_RATE_DESC =
      _$gOrganizationSortDEFAULT_RATE_DESC;

  static const GOrganizationSort updated_desc = _$gOrganizationSortupdated_desc;

  static const GOrganizationSort updated_asc = _$gOrganizationSortupdated_asc;

  static const GOrganizationSort created_desc = _$gOrganizationSortcreated_desc;

  static const GOrganizationSort created_asc = _$gOrganizationSortcreated_asc;

  static const GOrganizationSort UPDATED_DESC = _$gOrganizationSortUPDATED_DESC;

  static const GOrganizationSort UPDATED_ASC = _$gOrganizationSortUPDATED_ASC;

  static const GOrganizationSort CREATED_DESC = _$gOrganizationSortCREATED_DESC;

  static const GOrganizationSort CREATED_ASC = _$gOrganizationSortCREATED_ASC;

  static Serializer<GOrganizationSort> get serializer =>
      _$gOrganizationSortSerializer;
  static BuiltSet<GOrganizationSort> get values => _$gOrganizationSortValues;
  static GOrganizationSort valueOf(String name) =>
      _$gOrganizationSortValueOf(name);
}

class GPackageDependencyType extends EnumClass {
  const GPackageDependencyType._(String name) : super(name);

  static const GPackageDependencyType DEPENDENCIES =
      _$gPackageDependencyTypeDEPENDENCIES;

  static const GPackageDependencyType DEV_DEPENDENCIES =
      _$gPackageDependencyTypeDEV_DEPENDENCIES;

  static const GPackageDependencyType BUNDLE_DEPENDENCIES =
      _$gPackageDependencyTypeBUNDLE_DEPENDENCIES;

  static const GPackageDependencyType PEER_DEPENDENCIES =
      _$gPackageDependencyTypePEER_DEPENDENCIES;

  static Serializer<GPackageDependencyType> get serializer =>
      _$gPackageDependencyTypeSerializer;
  static BuiltSet<GPackageDependencyType> get values =>
      _$gPackageDependencyTypeValues;
  static GPackageDependencyType valueOf(String name) =>
      _$gPackageDependencyTypeValueOf(name);
}

class GPackageGroupSort extends EnumClass {
  const GPackageGroupSort._(String name) : super(name);

  static const GPackageGroupSort PROJECT_PATH_DESC =
      _$gPackageGroupSortPROJECT_PATH_DESC;

  static const GPackageGroupSort PROJECT_PATH_ASC =
      _$gPackageGroupSortPROJECT_PATH_ASC;

  static const GPackageGroupSort CREATED_DESC = _$gPackageGroupSortCREATED_DESC;

  static const GPackageGroupSort CREATED_ASC = _$gPackageGroupSortCREATED_ASC;

  static const GPackageGroupSort NAME_DESC = _$gPackageGroupSortNAME_DESC;

  static const GPackageGroupSort NAME_ASC = _$gPackageGroupSortNAME_ASC;

  static const GPackageGroupSort VERSION_DESC = _$gPackageGroupSortVERSION_DESC;

  static const GPackageGroupSort VERSION_ASC = _$gPackageGroupSortVERSION_ASC;

  static const GPackageGroupSort TYPE_DESC = _$gPackageGroupSortTYPE_DESC;

  static const GPackageGroupSort TYPE_ASC = _$gPackageGroupSortTYPE_ASC;

  static Serializer<GPackageGroupSort> get serializer =>
      _$gPackageGroupSortSerializer;
  static BuiltSet<GPackageGroupSort> get values => _$gPackageGroupSortValues;
  static GPackageGroupSort valueOf(String name) =>
      _$gPackageGroupSortValueOf(name);
}

class GPackagesCleanupKeepDuplicatedPackageFilesEnum extends EnumClass {
  const GPackagesCleanupKeepDuplicatedPackageFilesEnum._(String name)
      : super(name);

  static const GPackagesCleanupKeepDuplicatedPackageFilesEnum
      ALL_PACKAGE_FILES =
      _$gPackagesCleanupKeepDuplicatedPackageFilesEnumALL_PACKAGE_FILES;

  static const GPackagesCleanupKeepDuplicatedPackageFilesEnum ONE_PACKAGE_FILE =
      _$gPackagesCleanupKeepDuplicatedPackageFilesEnumONE_PACKAGE_FILE;

  static const GPackagesCleanupKeepDuplicatedPackageFilesEnum
      TEN_PACKAGE_FILES =
      _$gPackagesCleanupKeepDuplicatedPackageFilesEnumTEN_PACKAGE_FILES;

  static const GPackagesCleanupKeepDuplicatedPackageFilesEnum
      TWENTY_PACKAGE_FILES =
      _$gPackagesCleanupKeepDuplicatedPackageFilesEnumTWENTY_PACKAGE_FILES;

  static const GPackagesCleanupKeepDuplicatedPackageFilesEnum
      THIRTY_PACKAGE_FILES =
      _$gPackagesCleanupKeepDuplicatedPackageFilesEnumTHIRTY_PACKAGE_FILES;

  static const GPackagesCleanupKeepDuplicatedPackageFilesEnum
      FORTY_PACKAGE_FILES =
      _$gPackagesCleanupKeepDuplicatedPackageFilesEnumFORTY_PACKAGE_FILES;

  static const GPackagesCleanupKeepDuplicatedPackageFilesEnum
      FIFTY_PACKAGE_FILES =
      _$gPackagesCleanupKeepDuplicatedPackageFilesEnumFIFTY_PACKAGE_FILES;

  static Serializer<GPackagesCleanupKeepDuplicatedPackageFilesEnum>
      get serializer =>
          _$gPackagesCleanupKeepDuplicatedPackageFilesEnumSerializer;
  static BuiltSet<GPackagesCleanupKeepDuplicatedPackageFilesEnum> get values =>
      _$gPackagesCleanupKeepDuplicatedPackageFilesEnumValues;
  static GPackagesCleanupKeepDuplicatedPackageFilesEnum valueOf(String name) =>
      _$gPackagesCleanupKeepDuplicatedPackageFilesEnumValueOf(name);
}

abstract class GPackagesConanFileMetadatumID
    implements
        Built<GPackagesConanFileMetadatumID,
            GPackagesConanFileMetadatumIDBuilder> {
  GPackagesConanFileMetadatumID._();

  factory GPackagesConanFileMetadatumID([String? value]) =>
      _$GPackagesConanFileMetadatumID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPackagesConanFileMetadatumID> get serializer =>
      _i2.DefaultScalarSerializer<GPackagesConanFileMetadatumID>(
          (Object serialized) =>
              GPackagesConanFileMetadatumID((serialized as String?)));
}

abstract class GPackagesConanMetadatumID
    implements
        Built<GPackagesConanMetadatumID, GPackagesConanMetadatumIDBuilder> {
  GPackagesConanMetadatumID._();

  factory GPackagesConanMetadatumID([String? value]) =>
      _$GPackagesConanMetadatumID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPackagesConanMetadatumID> get serializer =>
      _i2.DefaultScalarSerializer<GPackagesConanMetadatumID>(
          (Object serialized) =>
              GPackagesConanMetadatumID((serialized as String?)));
}

abstract class GPackagesDependencyID
    implements Built<GPackagesDependencyID, GPackagesDependencyIDBuilder> {
  GPackagesDependencyID._();

  factory GPackagesDependencyID([String? value]) =>
      _$GPackagesDependencyID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPackagesDependencyID> get serializer =>
      _i2.DefaultScalarSerializer<GPackagesDependencyID>((Object serialized) =>
          GPackagesDependencyID((serialized as String?)));
}

abstract class GPackagesDependencyLinkID
    implements
        Built<GPackagesDependencyLinkID, GPackagesDependencyLinkIDBuilder> {
  GPackagesDependencyLinkID._();

  factory GPackagesDependencyLinkID([String? value]) =>
      _$GPackagesDependencyLinkID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPackagesDependencyLinkID> get serializer =>
      _i2.DefaultScalarSerializer<GPackagesDependencyLinkID>(
          (Object serialized) =>
              GPackagesDependencyLinkID((serialized as String?)));
}

abstract class GPackagesMavenMetadatumID
    implements
        Built<GPackagesMavenMetadatumID, GPackagesMavenMetadatumIDBuilder> {
  GPackagesMavenMetadatumID._();

  factory GPackagesMavenMetadatumID([String? value]) =>
      _$GPackagesMavenMetadatumID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPackagesMavenMetadatumID> get serializer =>
      _i2.DefaultScalarSerializer<GPackagesMavenMetadatumID>(
          (Object serialized) =>
              GPackagesMavenMetadatumID((serialized as String?)));
}

abstract class GPackagesNugetDependencyLinkMetadatumID
    implements
        Built<GPackagesNugetDependencyLinkMetadatumID,
            GPackagesNugetDependencyLinkMetadatumIDBuilder> {
  GPackagesNugetDependencyLinkMetadatumID._();

  factory GPackagesNugetDependencyLinkMetadatumID([String? value]) =>
      _$GPackagesNugetDependencyLinkMetadatumID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPackagesNugetDependencyLinkMetadatumID> get serializer =>
      _i2.DefaultScalarSerializer<GPackagesNugetDependencyLinkMetadatumID>(
          (Object serialized) =>
              GPackagesNugetDependencyLinkMetadatumID((serialized as String?)));
}

abstract class GPackagesNugetMetadatumID
    implements
        Built<GPackagesNugetMetadatumID, GPackagesNugetMetadatumIDBuilder> {
  GPackagesNugetMetadatumID._();

  factory GPackagesNugetMetadatumID([String? value]) =>
      _$GPackagesNugetMetadatumID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPackagesNugetMetadatumID> get serializer =>
      _i2.DefaultScalarSerializer<GPackagesNugetMetadatumID>(
          (Object serialized) =>
              GPackagesNugetMetadatumID((serialized as String?)));
}

class GPackageSort extends EnumClass {
  const GPackageSort._(String name) : super(name);

  static const GPackageSort CREATED_DESC = _$gPackageSortCREATED_DESC;

  static const GPackageSort CREATED_ASC = _$gPackageSortCREATED_ASC;

  static const GPackageSort NAME_DESC = _$gPackageSortNAME_DESC;

  static const GPackageSort NAME_ASC = _$gPackageSortNAME_ASC;

  static const GPackageSort VERSION_DESC = _$gPackageSortVERSION_DESC;

  static const GPackageSort VERSION_ASC = _$gPackageSortVERSION_ASC;

  static const GPackageSort TYPE_DESC = _$gPackageSortTYPE_DESC;

  static const GPackageSort TYPE_ASC = _$gPackageSortTYPE_ASC;

  static Serializer<GPackageSort> get serializer => _$gPackageSortSerializer;
  static BuiltSet<GPackageSort> get values => _$gPackageSortValues;
  static GPackageSort valueOf(String name) => _$gPackageSortValueOf(name);
}

abstract class GPackagesPackageFileID
    implements Built<GPackagesPackageFileID, GPackagesPackageFileIDBuilder> {
  GPackagesPackageFileID._();

  factory GPackagesPackageFileID([String? value]) =>
      _$GPackagesPackageFileID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPackagesPackageFileID> get serializer =>
      _i2.DefaultScalarSerializer<GPackagesPackageFileID>((Object serialized) =>
          GPackagesPackageFileID((serialized as String?)));
}

abstract class GPackagesPackageID
    implements Built<GPackagesPackageID, GPackagesPackageIDBuilder> {
  GPackagesPackageID._();

  factory GPackagesPackageID([String? value]) =>
      _$GPackagesPackageID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPackagesPackageID> get serializer =>
      _i2.DefaultScalarSerializer<GPackagesPackageID>(
          (Object serialized) => GPackagesPackageID((serialized as String?)));
}

abstract class GPackagesPypiMetadatumID
    implements
        Built<GPackagesPypiMetadatumID, GPackagesPypiMetadatumIDBuilder> {
  GPackagesPypiMetadatumID._();

  factory GPackagesPypiMetadatumID([String? value]) =>
      _$GPackagesPypiMetadatumID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPackagesPypiMetadatumID> get serializer =>
      _i2.DefaultScalarSerializer<GPackagesPypiMetadatumID>(
          (Object serialized) =>
              GPackagesPypiMetadatumID((serialized as String?)));
}

class GPackageStatus extends EnumClass {
  const GPackageStatus._(String name) : super(name);

  static const GPackageStatus DEFAULT = _$gPackageStatusDEFAULT;

  static const GPackageStatus HIDDEN = _$gPackageStatusHIDDEN;

  static const GPackageStatus PROCESSING = _$gPackageStatusPROCESSING;

  static const GPackageStatus ERROR = _$gPackageStatusERROR;

  static const GPackageStatus PENDING_DESTRUCTION =
      _$gPackageStatusPENDING_DESTRUCTION;

  static Serializer<GPackageStatus> get serializer =>
      _$gPackageStatusSerializer;
  static BuiltSet<GPackageStatus> get values => _$gPackageStatusValues;
  static GPackageStatus valueOf(String name) => _$gPackageStatusValueOf(name);
}

class GPackageTypeEnum extends EnumClass {
  const GPackageTypeEnum._(String name) : super(name);

  static const GPackageTypeEnum MAVEN = _$gPackageTypeEnumMAVEN;

  static const GPackageTypeEnum NPM = _$gPackageTypeEnumNPM;

  static const GPackageTypeEnum CONAN = _$gPackageTypeEnumCONAN;

  static const GPackageTypeEnum NUGET = _$gPackageTypeEnumNUGET;

  static const GPackageTypeEnum PYPI = _$gPackageTypeEnumPYPI;

  static const GPackageTypeEnum COMPOSER = _$gPackageTypeEnumCOMPOSER;

  static const GPackageTypeEnum GENERIC = _$gPackageTypeEnumGENERIC;

  static const GPackageTypeEnum GOLANG = _$gPackageTypeEnumGOLANG;

  static const GPackageTypeEnum DEBIAN = _$gPackageTypeEnumDEBIAN;

  static const GPackageTypeEnum RUBYGEMS = _$gPackageTypeEnumRUBYGEMS;

  static const GPackageTypeEnum HELM = _$gPackageTypeEnumHELM;

  static const GPackageTypeEnum TERRAFORM_MODULE =
      _$gPackageTypeEnumTERRAFORM_MODULE;

  static const GPackageTypeEnum RPM = _$gPackageTypeEnumRPM;

  static Serializer<GPackageTypeEnum> get serializer =>
      _$gPackageTypeEnumSerializer;
  static BuiltSet<GPackageTypeEnum> get values => _$gPackageTypeEnumValues;
  static GPackageTypeEnum valueOf(String name) =>
      _$gPackageTypeEnumValueOf(name);
}

abstract class GPagesMarkOnboardingCompleteInput
    implements
        Built<GPagesMarkOnboardingCompleteInput,
            GPagesMarkOnboardingCompleteInputBuilder> {
  GPagesMarkOnboardingCompleteInput._();

  factory GPagesMarkOnboardingCompleteInput(
          [Function(GPagesMarkOnboardingCompleteInputBuilder b) updates]) =
      _$GPagesMarkOnboardingCompleteInput;

  String get projectPath;
  String? get clientMutationId;
  static Serializer<GPagesMarkOnboardingCompleteInput> get serializer =>
      _$gPagesMarkOnboardingCompleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPagesMarkOnboardingCompleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPagesMarkOnboardingCompleteInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPagesMarkOnboardingCompleteInput.serializer,
        json,
      );
}

abstract class GPathLockID implements Built<GPathLockID, GPathLockIDBuilder> {
  GPathLockID._();

  factory GPathLockID([String? value]) =>
      _$GPathLockID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPathLockID> get serializer =>
      _i2.DefaultScalarSerializer<GPathLockID>(
          (Object serialized) => GPathLockID((serialized as String?)));
}

abstract class GPayloadAlertFieldPathSegment
    implements
        Built<GPayloadAlertFieldPathSegment,
            GPayloadAlertFieldPathSegmentBuilder> {
  GPayloadAlertFieldPathSegment._();

  factory GPayloadAlertFieldPathSegment([String? value]) =>
      _$GPayloadAlertFieldPathSegment(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GPayloadAlertFieldPathSegment> get serializer =>
      _i2.DefaultScalarSerializer<GPayloadAlertFieldPathSegment>(
          (Object serialized) =>
              GPayloadAlertFieldPathSegment((serialized as String?)));
}

abstract class GPipelineCancelInput
    implements Built<GPipelineCancelInput, GPipelineCancelInputBuilder> {
  GPipelineCancelInput._();

  factory GPipelineCancelInput(
          [Function(GPipelineCancelInputBuilder b) updates]) =
      _$GPipelineCancelInput;

  GCiPipelineID get id;
  String? get clientMutationId;
  static Serializer<GPipelineCancelInput> get serializer =>
      _$gPipelineCancelInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPipelineCancelInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPipelineCancelInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPipelineCancelInput.serializer,
        json,
      );
}

class GPipelineConfigSourceEnum extends EnumClass {
  const GPipelineConfigSourceEnum._(String name) : super(name);

  static const GPipelineConfigSourceEnum UNKNOWN_SOURCE =
      _$gPipelineConfigSourceEnumUNKNOWN_SOURCE;

  static const GPipelineConfigSourceEnum REPOSITORY_SOURCE =
      _$gPipelineConfigSourceEnumREPOSITORY_SOURCE;

  static const GPipelineConfigSourceEnum AUTO_DEVOPS_SOURCE =
      _$gPipelineConfigSourceEnumAUTO_DEVOPS_SOURCE;

  static const GPipelineConfigSourceEnum WEBIDE_SOURCE =
      _$gPipelineConfigSourceEnumWEBIDE_SOURCE;

  static const GPipelineConfigSourceEnum REMOTE_SOURCE =
      _$gPipelineConfigSourceEnumREMOTE_SOURCE;

  static const GPipelineConfigSourceEnum EXTERNAL_PROJECT_SOURCE =
      _$gPipelineConfigSourceEnumEXTERNAL_PROJECT_SOURCE;

  static const GPipelineConfigSourceEnum BRIDGE_SOURCE =
      _$gPipelineConfigSourceEnumBRIDGE_SOURCE;

  static const GPipelineConfigSourceEnum PARAMETER_SOURCE =
      _$gPipelineConfigSourceEnumPARAMETER_SOURCE;

  static const GPipelineConfigSourceEnum COMPLIANCE_SOURCE =
      _$gPipelineConfigSourceEnumCOMPLIANCE_SOURCE;

  static Serializer<GPipelineConfigSourceEnum> get serializer =>
      _$gPipelineConfigSourceEnumSerializer;
  static BuiltSet<GPipelineConfigSourceEnum> get values =>
      _$gPipelineConfigSourceEnumValues;
  static GPipelineConfigSourceEnum valueOf(String name) =>
      _$gPipelineConfigSourceEnumValueOf(name);
}

abstract class GPipelineDestroyInput
    implements Built<GPipelineDestroyInput, GPipelineDestroyInputBuilder> {
  GPipelineDestroyInput._();

  factory GPipelineDestroyInput(
          [Function(GPipelineDestroyInputBuilder b) updates]) =
      _$GPipelineDestroyInput;

  GCiPipelineID get id;
  String? get clientMutationId;
  static Serializer<GPipelineDestroyInput> get serializer =>
      _$gPipelineDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPipelineDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPipelineDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPipelineDestroyInput.serializer,
        json,
      );
}

class GPipelineMergeRequestEventType extends EnumClass {
  const GPipelineMergeRequestEventType._(String name) : super(name);

  static const GPipelineMergeRequestEventType MERGED_RESULT =
      _$gPipelineMergeRequestEventTypeMERGED_RESULT;

  static const GPipelineMergeRequestEventType DETACHED =
      _$gPipelineMergeRequestEventTypeDETACHED;

  static const GPipelineMergeRequestEventType MERGE_TRAIN =
      _$gPipelineMergeRequestEventTypeMERGE_TRAIN;

  static Serializer<GPipelineMergeRequestEventType> get serializer =>
      _$gPipelineMergeRequestEventTypeSerializer;
  static BuiltSet<GPipelineMergeRequestEventType> get values =>
      _$gPipelineMergeRequestEventTypeValues;
  static GPipelineMergeRequestEventType valueOf(String name) =>
      _$gPipelineMergeRequestEventTypeValueOf(name);
}

abstract class GPipelineRetryInput
    implements Built<GPipelineRetryInput, GPipelineRetryInputBuilder> {
  GPipelineRetryInput._();

  factory GPipelineRetryInput(
      [Function(GPipelineRetryInputBuilder b) updates]) = _$GPipelineRetryInput;

  GCiPipelineID get id;
  String? get clientMutationId;
  static Serializer<GPipelineRetryInput> get serializer =>
      _$gPipelineRetryInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPipelineRetryInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPipelineRetryInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPipelineRetryInput.serializer,
        json,
      );
}

class GPipelineScheduleStatus extends EnumClass {
  const GPipelineScheduleStatus._(String name) : super(name);

  static const GPipelineScheduleStatus ACTIVE = _$gPipelineScheduleStatusACTIVE;

  static const GPipelineScheduleStatus INACTIVE =
      _$gPipelineScheduleStatusINACTIVE;

  static Serializer<GPipelineScheduleStatus> get serializer =>
      _$gPipelineScheduleStatusSerializer;
  static BuiltSet<GPipelineScheduleStatus> get values =>
      _$gPipelineScheduleStatusValues;
  static GPipelineScheduleStatus valueOf(String name) =>
      _$gPipelineScheduleStatusValueOf(name);
}

class GPipelineScopeEnum extends EnumClass {
  const GPipelineScopeEnum._(String name) : super(name);

  static const GPipelineScopeEnum RUNNING = _$gPipelineScopeEnumRUNNING;

  static const GPipelineScopeEnum PENDING = _$gPipelineScopeEnumPENDING;

  static const GPipelineScopeEnum FINISHED = _$gPipelineScopeEnumFINISHED;

  static const GPipelineScopeEnum BRANCHES = _$gPipelineScopeEnumBRANCHES;

  static const GPipelineScopeEnum TAGS = _$gPipelineScopeEnumTAGS;

  static Serializer<GPipelineScopeEnum> get serializer =>
      _$gPipelineScopeEnumSerializer;
  static BuiltSet<GPipelineScopeEnum> get values => _$gPipelineScopeEnumValues;
  static GPipelineScopeEnum valueOf(String name) =>
      _$gPipelineScopeEnumValueOf(name);
}

class GPipelineStatusEnum extends EnumClass {
  const GPipelineStatusEnum._(String name) : super(name);

  static const GPipelineStatusEnum CREATED = _$gPipelineStatusEnumCREATED;

  static const GPipelineStatusEnum WAITING_FOR_RESOURCE =
      _$gPipelineStatusEnumWAITING_FOR_RESOURCE;

  static const GPipelineStatusEnum PREPARING = _$gPipelineStatusEnumPREPARING;

  static const GPipelineStatusEnum PENDING = _$gPipelineStatusEnumPENDING;

  static const GPipelineStatusEnum RUNNING = _$gPipelineStatusEnumRUNNING;

  static const GPipelineStatusEnum FAILED = _$gPipelineStatusEnumFAILED;

  static const GPipelineStatusEnum SUCCESS = _$gPipelineStatusEnumSUCCESS;

  static const GPipelineStatusEnum CANCELED = _$gPipelineStatusEnumCANCELED;

  static const GPipelineStatusEnum SKIPPED = _$gPipelineStatusEnumSKIPPED;

  static const GPipelineStatusEnum MANUAL = _$gPipelineStatusEnumMANUAL;

  static const GPipelineStatusEnum SCHEDULED = _$gPipelineStatusEnumSCHEDULED;

  static Serializer<GPipelineStatusEnum> get serializer =>
      _$gPipelineStatusEnumSerializer;
  static BuiltSet<GPipelineStatusEnum> get values =>
      _$gPipelineStatusEnumValues;
  static GPipelineStatusEnum valueOf(String name) =>
      _$gPipelineStatusEnumValueOf(name);
}

abstract class GProjectCiCdSettingsUpdateInput
    implements
        Built<GProjectCiCdSettingsUpdateInput,
            GProjectCiCdSettingsUpdateInputBuilder> {
  GProjectCiCdSettingsUpdateInput._();

  factory GProjectCiCdSettingsUpdateInput(
          [Function(GProjectCiCdSettingsUpdateInputBuilder b) updates]) =
      _$GProjectCiCdSettingsUpdateInput;

  String? get clientMutationId;
  String get fullPath;
  bool? get keepLatestArtifact;
  bool? get jobTokenScopeEnabled;
  bool? get mergePipelinesEnabled;
  bool? get mergeTrainsEnabled;
  static Serializer<GProjectCiCdSettingsUpdateInput> get serializer =>
      _$gProjectCiCdSettingsUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GProjectCiCdSettingsUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GProjectCiCdSettingsUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GProjectCiCdSettingsUpdateInput.serializer,
        json,
      );
}

abstract class GProjectID implements Built<GProjectID, GProjectIDBuilder> {
  GProjectID._();

  factory GProjectID([String? value]) =>
      _$GProjectID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GProjectID> get serializer =>
      _i2.DefaultScalarSerializer<GProjectID>(
          (Object serialized) => GProjectID((serialized as String?)));
}

class GProjectMemberRelation extends EnumClass {
  const GProjectMemberRelation._(String name) : super(name);

  static const GProjectMemberRelation DIRECT = _$gProjectMemberRelationDIRECT;

  static const GProjectMemberRelation INHERITED =
      _$gProjectMemberRelationINHERITED;

  static const GProjectMemberRelation DESCENDANTS =
      _$gProjectMemberRelationDESCENDANTS;

  static const GProjectMemberRelation INVITED_GROUPS =
      _$gProjectMemberRelationINVITED_GROUPS;

  static Serializer<GProjectMemberRelation> get serializer =>
      _$gProjectMemberRelationSerializer;
  static BuiltSet<GProjectMemberRelation> get values =>
      _$gProjectMemberRelationValues;
  static GProjectMemberRelation valueOf(String name) =>
      _$gProjectMemberRelationValueOf(name);
}

abstract class GProjectSetComplianceFrameworkInput
    implements
        Built<GProjectSetComplianceFrameworkInput,
            GProjectSetComplianceFrameworkInputBuilder> {
  GProjectSetComplianceFrameworkInput._();

  factory GProjectSetComplianceFrameworkInput(
          [Function(GProjectSetComplianceFrameworkInputBuilder b) updates]) =
      _$GProjectSetComplianceFrameworkInput;

  String? get clientMutationId;
  GProjectID get projectId;
  GComplianceManagementFrameworkID? get complianceFrameworkId;
  static Serializer<GProjectSetComplianceFrameworkInput> get serializer =>
      _$gProjectSetComplianceFrameworkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GProjectSetComplianceFrameworkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GProjectSetComplianceFrameworkInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GProjectSetComplianceFrameworkInput.serializer,
        json,
      );
}

abstract class GProjectSetLockedInput
    implements Built<GProjectSetLockedInput, GProjectSetLockedInputBuilder> {
  GProjectSetLockedInput._();

  factory GProjectSetLockedInput(
          [Function(GProjectSetLockedInputBuilder b) updates]) =
      _$GProjectSetLockedInput;

  String? get clientMutationId;
  String get projectPath;
  String get filePath;
  bool get lock;
  static Serializer<GProjectSetLockedInput> get serializer =>
      _$gProjectSetLockedInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GProjectSetLockedInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GProjectSetLockedInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GProjectSetLockedInput.serializer,
        json,
      );
}

abstract class GPrometheusIntegrationCreateInput
    implements
        Built<GPrometheusIntegrationCreateInput,
            GPrometheusIntegrationCreateInputBuilder> {
  GPrometheusIntegrationCreateInput._();

  factory GPrometheusIntegrationCreateInput(
          [Function(GPrometheusIntegrationCreateInputBuilder b) updates]) =
      _$GPrometheusIntegrationCreateInput;

  String? get clientMutationId;
  String get projectPath;
  bool get active;
  String get apiUrl;
  static Serializer<GPrometheusIntegrationCreateInput> get serializer =>
      _$gPrometheusIntegrationCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPrometheusIntegrationCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPrometheusIntegrationCreateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPrometheusIntegrationCreateInput.serializer,
        json,
      );
}

abstract class GPrometheusIntegrationResetTokenInput
    implements
        Built<GPrometheusIntegrationResetTokenInput,
            GPrometheusIntegrationResetTokenInputBuilder> {
  GPrometheusIntegrationResetTokenInput._();

  factory GPrometheusIntegrationResetTokenInput(
          [Function(GPrometheusIntegrationResetTokenInputBuilder b) updates]) =
      _$GPrometheusIntegrationResetTokenInput;

  String? get clientMutationId;
  GIntegrationsPrometheusID get id;
  static Serializer<GPrometheusIntegrationResetTokenInput> get serializer =>
      _$gPrometheusIntegrationResetTokenInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPrometheusIntegrationResetTokenInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPrometheusIntegrationResetTokenInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPrometheusIntegrationResetTokenInput.serializer,
        json,
      );
}

abstract class GPrometheusIntegrationUpdateInput
    implements
        Built<GPrometheusIntegrationUpdateInput,
            GPrometheusIntegrationUpdateInputBuilder> {
  GPrometheusIntegrationUpdateInput._();

  factory GPrometheusIntegrationUpdateInput(
          [Function(GPrometheusIntegrationUpdateInputBuilder b) updates]) =
      _$GPrometheusIntegrationUpdateInput;

  String? get clientMutationId;
  GIntegrationsPrometheusID get id;
  bool? get active;
  String? get apiUrl;
  static Serializer<GPrometheusIntegrationUpdateInput> get serializer =>
      _$gPrometheusIntegrationUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPrometheusIntegrationUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPrometheusIntegrationUpdateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPrometheusIntegrationUpdateInput.serializer,
        json,
      );
}

abstract class GPromoteToEpicInput
    implements Built<GPromoteToEpicInput, GPromoteToEpicInputBuilder> {
  GPromoteToEpicInput._();

  factory GPromoteToEpicInput(
      [Function(GPromoteToEpicInputBuilder b) updates]) = _$GPromoteToEpicInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  String? get groupPath;
  static Serializer<GPromoteToEpicInput> get serializer =>
      _$gPromoteToEpicInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPromoteToEpicInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPromoteToEpicInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPromoteToEpicInput.serializer,
        json,
      );
}

class GRegistryState extends EnumClass {
  const GRegistryState._(String name) : super(name);

  static const GRegistryState PENDING = _$gRegistryStatePENDING;

  static const GRegistryState STARTED = _$gRegistryStateSTARTED;

  static const GRegistryState SYNCED = _$gRegistryStateSYNCED;

  static const GRegistryState FAILED = _$gRegistryStateFAILED;

  static Serializer<GRegistryState> get serializer =>
      _$gRegistryStateSerializer;
  static BuiltSet<GRegistryState> get values => _$gRegistryStateValues;
  static GRegistryState valueOf(String name) => _$gRegistryStateValueOf(name);
}

abstract class GReleaseAssetLinkCreateInput
    implements
        Built<GReleaseAssetLinkCreateInput,
            GReleaseAssetLinkCreateInputBuilder> {
  GReleaseAssetLinkCreateInput._();

  factory GReleaseAssetLinkCreateInput(
          [Function(GReleaseAssetLinkCreateInputBuilder b) updates]) =
      _$GReleaseAssetLinkCreateInput;

  String? get clientMutationId;
  String get name;
  String get url;
  String? get directAssetPath;
  GReleaseAssetLinkType? get linkType;
  String get projectPath;
  String get tagName;
  static Serializer<GReleaseAssetLinkCreateInput> get serializer =>
      _$gReleaseAssetLinkCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReleaseAssetLinkCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReleaseAssetLinkCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReleaseAssetLinkCreateInput.serializer,
        json,
      );
}

abstract class GReleaseAssetLinkDeleteInput
    implements
        Built<GReleaseAssetLinkDeleteInput,
            GReleaseAssetLinkDeleteInputBuilder> {
  GReleaseAssetLinkDeleteInput._();

  factory GReleaseAssetLinkDeleteInput(
          [Function(GReleaseAssetLinkDeleteInputBuilder b) updates]) =
      _$GReleaseAssetLinkDeleteInput;

  String? get clientMutationId;
  GReleasesLinkID get id;
  static Serializer<GReleaseAssetLinkDeleteInput> get serializer =>
      _$gReleaseAssetLinkDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReleaseAssetLinkDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReleaseAssetLinkDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReleaseAssetLinkDeleteInput.serializer,
        json,
      );
}

abstract class GReleaseAssetLinkInput
    implements Built<GReleaseAssetLinkInput, GReleaseAssetLinkInputBuilder> {
  GReleaseAssetLinkInput._();

  factory GReleaseAssetLinkInput(
          [Function(GReleaseAssetLinkInputBuilder b) updates]) =
      _$GReleaseAssetLinkInput;

  String get name;
  String get url;
  String? get directAssetPath;
  GReleaseAssetLinkType? get linkType;
  static Serializer<GReleaseAssetLinkInput> get serializer =>
      _$gReleaseAssetLinkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReleaseAssetLinkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReleaseAssetLinkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReleaseAssetLinkInput.serializer,
        json,
      );
}

class GReleaseAssetLinkType extends EnumClass {
  const GReleaseAssetLinkType._(String name) : super(name);

  static const GReleaseAssetLinkType OTHER = _$gReleaseAssetLinkTypeOTHER;

  static const GReleaseAssetLinkType RUNBOOK = _$gReleaseAssetLinkTypeRUNBOOK;

  static const GReleaseAssetLinkType PACKAGE = _$gReleaseAssetLinkTypePACKAGE;

  static const GReleaseAssetLinkType IMAGE = _$gReleaseAssetLinkTypeIMAGE;

  static Serializer<GReleaseAssetLinkType> get serializer =>
      _$gReleaseAssetLinkTypeSerializer;
  static BuiltSet<GReleaseAssetLinkType> get values =>
      _$gReleaseAssetLinkTypeValues;
  static GReleaseAssetLinkType valueOf(String name) =>
      _$gReleaseAssetLinkTypeValueOf(name);
}

abstract class GReleaseAssetLinkUpdateInput
    implements
        Built<GReleaseAssetLinkUpdateInput,
            GReleaseAssetLinkUpdateInputBuilder> {
  GReleaseAssetLinkUpdateInput._();

  factory GReleaseAssetLinkUpdateInput(
          [Function(GReleaseAssetLinkUpdateInputBuilder b) updates]) =
      _$GReleaseAssetLinkUpdateInput;

  String? get clientMutationId;
  GReleasesLinkID get id;
  String? get name;
  String? get url;
  String? get directAssetPath;
  GReleaseAssetLinkType? get linkType;
  static Serializer<GReleaseAssetLinkUpdateInput> get serializer =>
      _$gReleaseAssetLinkUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReleaseAssetLinkUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReleaseAssetLinkUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReleaseAssetLinkUpdateInput.serializer,
        json,
      );
}

abstract class GReleaseAssetsInput
    implements Built<GReleaseAssetsInput, GReleaseAssetsInputBuilder> {
  GReleaseAssetsInput._();

  factory GReleaseAssetsInput(
      [Function(GReleaseAssetsInputBuilder b) updates]) = _$GReleaseAssetsInput;

  BuiltList<GReleaseAssetLinkInput>? get links;
  static Serializer<GReleaseAssetsInput> get serializer =>
      _$gReleaseAssetsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReleaseAssetsInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReleaseAssetsInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReleaseAssetsInput.serializer,
        json,
      );
}

abstract class GReleaseCreateInput
    implements Built<GReleaseCreateInput, GReleaseCreateInputBuilder> {
  GReleaseCreateInput._();

  factory GReleaseCreateInput(
      [Function(GReleaseCreateInputBuilder b) updates]) = _$GReleaseCreateInput;

  String get projectPath;
  String? get clientMutationId;
  String get tagName;
  String? get tagMessage;
  String? get ref;
  String? get name;
  String? get description;
  GTime? get releasedAt;
  BuiltList<String>? get milestones;
  GReleaseAssetsInput? get assets;
  static Serializer<GReleaseCreateInput> get serializer =>
      _$gReleaseCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReleaseCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReleaseCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReleaseCreateInput.serializer,
        json,
      );
}

abstract class GReleaseDeleteInput
    implements Built<GReleaseDeleteInput, GReleaseDeleteInputBuilder> {
  GReleaseDeleteInput._();

  factory GReleaseDeleteInput(
      [Function(GReleaseDeleteInputBuilder b) updates]) = _$GReleaseDeleteInput;

  String get projectPath;
  String? get clientMutationId;
  String get tagName;
  static Serializer<GReleaseDeleteInput> get serializer =>
      _$gReleaseDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReleaseDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReleaseDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReleaseDeleteInput.serializer,
        json,
      );
}

abstract class GReleaseID implements Built<GReleaseID, GReleaseIDBuilder> {
  GReleaseID._();

  factory GReleaseID([String? value]) =>
      _$GReleaseID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GReleaseID> get serializer =>
      _i2.DefaultScalarSerializer<GReleaseID>(
          (Object serialized) => GReleaseID((serialized as String?)));
}

abstract class GReleasesLinkID
    implements Built<GReleasesLinkID, GReleasesLinkIDBuilder> {
  GReleasesLinkID._();

  factory GReleasesLinkID([String? value]) =>
      _$GReleasesLinkID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GReleasesLinkID> get serializer =>
      _i2.DefaultScalarSerializer<GReleasesLinkID>(
          (Object serialized) => GReleasesLinkID((serialized as String?)));
}

class GReleaseSort extends EnumClass {
  const GReleaseSort._(String name) : super(name);

  static const GReleaseSort CREATED_DESC = _$gReleaseSortCREATED_DESC;

  static const GReleaseSort CREATED_ASC = _$gReleaseSortCREATED_ASC;

  static const GReleaseSort RELEASED_AT_DESC = _$gReleaseSortRELEASED_AT_DESC;

  static const GReleaseSort RELEASED_AT_ASC = _$gReleaseSortRELEASED_AT_ASC;

  static Serializer<GReleaseSort> get serializer => _$gReleaseSortSerializer;
  static BuiltSet<GReleaseSort> get values => _$gReleaseSortValues;
  static GReleaseSort valueOf(String name) => _$gReleaseSortValueOf(name);
}

class GReleaseTagWildcardId extends EnumClass {
  const GReleaseTagWildcardId._(String name) : super(name);

  static const GReleaseTagWildcardId NONE = _$gReleaseTagWildcardIdNONE;

  static const GReleaseTagWildcardId ANY = _$gReleaseTagWildcardIdANY;

  static Serializer<GReleaseTagWildcardId> get serializer =>
      _$gReleaseTagWildcardIdSerializer;
  static BuiltSet<GReleaseTagWildcardId> get values =>
      _$gReleaseTagWildcardIdValues;
  static GReleaseTagWildcardId valueOf(String name) =>
      _$gReleaseTagWildcardIdValueOf(name);
}

abstract class GReleaseUpdateInput
    implements Built<GReleaseUpdateInput, GReleaseUpdateInputBuilder> {
  GReleaseUpdateInput._();

  factory GReleaseUpdateInput(
      [Function(GReleaseUpdateInputBuilder b) updates]) = _$GReleaseUpdateInput;

  String get projectPath;
  String? get clientMutationId;
  String get tagName;
  String? get name;
  String? get description;
  GTime? get releasedAt;
  BuiltList<String>? get milestones;
  static Serializer<GReleaseUpdateInput> get serializer =>
      _$gReleaseUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReleaseUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReleaseUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReleaseUpdateInput.serializer,
        json,
      );
}

abstract class GRemoveProjectFromSecurityDashboardInput
    implements
        Built<GRemoveProjectFromSecurityDashboardInput,
            GRemoveProjectFromSecurityDashboardInputBuilder> {
  GRemoveProjectFromSecurityDashboardInput._();

  factory GRemoveProjectFromSecurityDashboardInput(
      [Function(GRemoveProjectFromSecurityDashboardInputBuilder b)
          updates]) = _$GRemoveProjectFromSecurityDashboardInput;

  String? get clientMutationId;
  GProjectID get id;
  static Serializer<GRemoveProjectFromSecurityDashboardInput> get serializer =>
      _$gRemoveProjectFromSecurityDashboardInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRemoveProjectFromSecurityDashboardInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRemoveProjectFromSecurityDashboardInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRemoveProjectFromSecurityDashboardInput.serializer,
        json,
      );
}

class GReplicationStateEnum extends EnumClass {
  const GReplicationStateEnum._(String name) : super(name);

  static const GReplicationStateEnum PENDING = _$gReplicationStateEnumPENDING;

  static const GReplicationStateEnum STARTED = _$gReplicationStateEnumSTARTED;

  static const GReplicationStateEnum SYNCED = _$gReplicationStateEnumSYNCED;

  static const GReplicationStateEnum FAILED = _$gReplicationStateEnumFAILED;

  static Serializer<GReplicationStateEnum> get serializer =>
      _$gReplicationStateEnumSerializer;
  static BuiltSet<GReplicationStateEnum> get values =>
      _$gReplicationStateEnumValues;
  static GReplicationStateEnum valueOf(String name) =>
      _$gReplicationStateEnumValueOf(name);
}

abstract class GRepositionImageDiffNoteInput
    implements
        Built<GRepositionImageDiffNoteInput,
            GRepositionImageDiffNoteInputBuilder> {
  GRepositionImageDiffNoteInput._();

  factory GRepositionImageDiffNoteInput(
          [Function(GRepositionImageDiffNoteInputBuilder b) updates]) =
      _$GRepositionImageDiffNoteInput;

  String? get clientMutationId;
  GDiffNoteID get id;
  GUpdateDiffImagePositionInput get position;
  static Serializer<GRepositionImageDiffNoteInput> get serializer =>
      _$gRepositionImageDiffNoteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRepositionImageDiffNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRepositionImageDiffNoteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRepositionImageDiffNoteInput.serializer,
        json,
      );
}

class GRequirementState extends EnumClass {
  const GRequirementState._(String name) : super(name);

  static const GRequirementState OPENED = _$gRequirementStateOPENED;

  static const GRequirementState ARCHIVED = _$gRequirementStateARCHIVED;

  static Serializer<GRequirementState> get serializer =>
      _$gRequirementStateSerializer;
  static BuiltSet<GRequirementState> get values => _$gRequirementStateValues;
  static GRequirementState valueOf(String name) =>
      _$gRequirementStateValueOf(name);
}

class GRequirementStatusFilter extends EnumClass {
  const GRequirementStatusFilter._(String name) : super(name);

  static const GRequirementStatusFilter MISSING =
      _$gRequirementStatusFilterMISSING;

  static const GRequirementStatusFilter PASSED =
      _$gRequirementStatusFilterPASSED;

  static const GRequirementStatusFilter FAILED =
      _$gRequirementStatusFilterFAILED;

  static Serializer<GRequirementStatusFilter> get serializer =>
      _$gRequirementStatusFilterSerializer;
  static BuiltSet<GRequirementStatusFilter> get values =>
      _$gRequirementStatusFilterValues;
  static GRequirementStatusFilter valueOf(String name) =>
      _$gRequirementStatusFilterValueOf(name);
}

abstract class GRunnerDeleteInput
    implements Built<GRunnerDeleteInput, GRunnerDeleteInputBuilder> {
  GRunnerDeleteInput._();

  factory GRunnerDeleteInput([Function(GRunnerDeleteInputBuilder b) updates]) =
      _$GRunnerDeleteInput;

  String? get clientMutationId;
  GCiRunnerID get id;
  static Serializer<GRunnerDeleteInput> get serializer =>
      _$gRunnerDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRunnerDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRunnerDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRunnerDeleteInput.serializer,
        json,
      );
}

abstract class GRunnersRegistrationTokenResetInput
    implements
        Built<GRunnersRegistrationTokenResetInput,
            GRunnersRegistrationTokenResetInputBuilder> {
  GRunnersRegistrationTokenResetInput._();

  factory GRunnersRegistrationTokenResetInput(
          [Function(GRunnersRegistrationTokenResetInputBuilder b) updates]) =
      _$GRunnersRegistrationTokenResetInput;

  String? get clientMutationId;
  GCiRunnerType get type;
  String? get id;
  static Serializer<GRunnersRegistrationTokenResetInput> get serializer =>
      _$gRunnersRegistrationTokenResetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRunnersRegistrationTokenResetInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRunnersRegistrationTokenResetInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRunnersRegistrationTokenResetInput.serializer,
        json,
      );
}

abstract class GRunnerUpdateInput
    implements Built<GRunnerUpdateInput, GRunnerUpdateInputBuilder> {
  GRunnerUpdateInput._();

  factory GRunnerUpdateInput([Function(GRunnerUpdateInputBuilder b) updates]) =
      _$GRunnerUpdateInput;

  String? get clientMutationId;
  GCiRunnerID get id;
  String? get description;
  String? get maintenanceNote;
  int? get maximumTimeout;
  GCiRunnerAccessLevel? get accessLevel;
  bool? get paused;
  bool? get locked;
  bool? get runUntagged;
  BuiltList<String>? get tagList;
  BuiltList<GProjectID>? get associatedProjects;
  double? get publicProjectsMinutesCostFactor;
  double? get privateProjectsMinutesCostFactor;
  static Serializer<GRunnerUpdateInput> get serializer =>
      _$gRunnerUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GRunnerUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRunnerUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GRunnerUpdateInput.serializer,
        json,
      );
}

abstract class GSastCiConfigurationAnalyzersEntityInput
    implements
        Built<GSastCiConfigurationAnalyzersEntityInput,
            GSastCiConfigurationAnalyzersEntityInputBuilder> {
  GSastCiConfigurationAnalyzersEntityInput._();

  factory GSastCiConfigurationAnalyzersEntityInput(
      [Function(GSastCiConfigurationAnalyzersEntityInputBuilder b)
          updates]) = _$GSastCiConfigurationAnalyzersEntityInput;

  String get name;
  bool get enabled;
  BuiltList<GSastCiConfigurationEntityInput>? get variables;
  static Serializer<GSastCiConfigurationAnalyzersEntityInput> get serializer =>
      _$gSastCiConfigurationAnalyzersEntityInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSastCiConfigurationAnalyzersEntityInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSastCiConfigurationAnalyzersEntityInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSastCiConfigurationAnalyzersEntityInput.serializer,
        json,
      );
}

abstract class GSastCiConfigurationEntityInput
    implements
        Built<GSastCiConfigurationEntityInput,
            GSastCiConfigurationEntityInputBuilder> {
  GSastCiConfigurationEntityInput._();

  factory GSastCiConfigurationEntityInput(
          [Function(GSastCiConfigurationEntityInputBuilder b) updates]) =
      _$GSastCiConfigurationEntityInput;

  String get field;
  String get defaultValue;
  String get value;
  static Serializer<GSastCiConfigurationEntityInput> get serializer =>
      _$gSastCiConfigurationEntityInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSastCiConfigurationEntityInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSastCiConfigurationEntityInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSastCiConfigurationEntityInput.serializer,
        json,
      );
}

abstract class GSastCiConfigurationInput
    implements
        Built<GSastCiConfigurationInput, GSastCiConfigurationInputBuilder> {
  GSastCiConfigurationInput._();

  factory GSastCiConfigurationInput(
          [Function(GSastCiConfigurationInputBuilder b) updates]) =
      _$GSastCiConfigurationInput;

  BuiltList<GSastCiConfigurationEntityInput>? get global;
  BuiltList<GSastCiConfigurationEntityInput>? get pipeline;
  BuiltList<GSastCiConfigurationAnalyzersEntityInput>? get analyzers;
  static Serializer<GSastCiConfigurationInput> get serializer =>
      _$gSastCiConfigurationInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSastCiConfigurationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSastCiConfigurationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSastCiConfigurationInput.serializer,
        json,
      );
}

class GSastUiComponentSize extends EnumClass {
  const GSastUiComponentSize._(String name) : super(name);

  static const GSastUiComponentSize SMALL = _$gSastUiComponentSizeSMALL;

  static const GSastUiComponentSize MEDIUM = _$gSastUiComponentSizeMEDIUM;

  static const GSastUiComponentSize LARGE = _$gSastUiComponentSizeLARGE;

  static Serializer<GSastUiComponentSize> get serializer =>
      _$gSastUiComponentSizeSerializer;
  static BuiltSet<GSastUiComponentSize> get values =>
      _$gSastUiComponentSizeValues;
  static GSastUiComponentSize valueOf(String name) =>
      _$gSastUiComponentSizeValueOf(name);
}

abstract class GSavedReplyCreateInput
    implements Built<GSavedReplyCreateInput, GSavedReplyCreateInputBuilder> {
  GSavedReplyCreateInput._();

  factory GSavedReplyCreateInput(
          [Function(GSavedReplyCreateInputBuilder b) updates]) =
      _$GSavedReplyCreateInput;

  String? get clientMutationId;
  String get name;
  String get content;
  static Serializer<GSavedReplyCreateInput> get serializer =>
      _$gSavedReplyCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSavedReplyCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSavedReplyCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSavedReplyCreateInput.serializer,
        json,
      );
}

abstract class GSavedReplyDestroyInput
    implements Built<GSavedReplyDestroyInput, GSavedReplyDestroyInputBuilder> {
  GSavedReplyDestroyInput._();

  factory GSavedReplyDestroyInput(
          [Function(GSavedReplyDestroyInputBuilder b) updates]) =
      _$GSavedReplyDestroyInput;

  String? get clientMutationId;
  GUsersSavedReplyID get id;
  static Serializer<GSavedReplyDestroyInput> get serializer =>
      _$gSavedReplyDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSavedReplyDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSavedReplyDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSavedReplyDestroyInput.serializer,
        json,
      );
}

abstract class GSavedReplyUpdateInput
    implements Built<GSavedReplyUpdateInput, GSavedReplyUpdateInputBuilder> {
  GSavedReplyUpdateInput._();

  factory GSavedReplyUpdateInput(
          [Function(GSavedReplyUpdateInputBuilder b) updates]) =
      _$GSavedReplyUpdateInput;

  String? get clientMutationId;
  GUsersSavedReplyID get id;
  String get name;
  String get content;
  static Serializer<GSavedReplyUpdateInput> get serializer =>
      _$gSavedReplyUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSavedReplyUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSavedReplyUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSavedReplyUpdateInput.serializer,
        json,
      );
}

abstract class GScanExecutionPolicyCommitInput
    implements
        Built<GScanExecutionPolicyCommitInput,
            GScanExecutionPolicyCommitInputBuilder> {
  GScanExecutionPolicyCommitInput._();

  factory GScanExecutionPolicyCommitInput(
          [Function(GScanExecutionPolicyCommitInputBuilder b) updates]) =
      _$GScanExecutionPolicyCommitInput;

  String? get clientMutationId;
  String? get fullPath;
  String get policyYaml;
  GMutationOperationMode get operationMode;
  String? get name;
  static Serializer<GScanExecutionPolicyCommitInput> get serializer =>
      _$gScanExecutionPolicyCommitInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GScanExecutionPolicyCommitInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GScanExecutionPolicyCommitInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GScanExecutionPolicyCommitInput.serializer,
        json,
      );
}

class GScanStatus extends EnumClass {
  const GScanStatus._(String name) : super(name);

  static const GScanStatus CREATED = _$gScanStatusCREATED;

  static const GScanStatus SUCCEEDED = _$gScanStatusSUCCEEDED;

  static const GScanStatus JOB_FAILED = _$gScanStatusJOB_FAILED;

  static const GScanStatus REPORT_ERROR = _$gScanStatusREPORT_ERROR;

  static const GScanStatus PREPARING = _$gScanStatusPREPARING;

  static const GScanStatus PREPARATION_FAILED = _$gScanStatusPREPARATION_FAILED;

  static const GScanStatus PURGED = _$gScanStatusPURGED;

  static Serializer<GScanStatus> get serializer => _$gScanStatusSerializer;
  static BuiltSet<GScanStatus> get values => _$gScanStatusValues;
  static GScanStatus valueOf(String name) => _$gScanStatusValueOf(name);
}

abstract class GSecurityFindingCreateIssueInput
    implements
        Built<GSecurityFindingCreateIssueInput,
            GSecurityFindingCreateIssueInputBuilder> {
  GSecurityFindingCreateIssueInput._();

  factory GSecurityFindingCreateIssueInput(
          [Function(GSecurityFindingCreateIssueInputBuilder b) updates]) =
      _$GSecurityFindingCreateIssueInput;

  String? get clientMutationId;
  String get uuid;
  GProjectID get project;
  static Serializer<GSecurityFindingCreateIssueInput> get serializer =>
      _$gSecurityFindingCreateIssueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSecurityFindingCreateIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSecurityFindingCreateIssueInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSecurityFindingCreateIssueInput.serializer,
        json,
      );
}

abstract class GSecurityFindingDismissInput
    implements
        Built<GSecurityFindingDismissInput,
            GSecurityFindingDismissInputBuilder> {
  GSecurityFindingDismissInput._();

  factory GSecurityFindingDismissInput(
          [Function(GSecurityFindingDismissInputBuilder b) updates]) =
      _$GSecurityFindingDismissInput;

  String? get clientMutationId;
  String get uuid;
  String? get comment;
  GVulnerabilityDismissalReason? get dismissalReason;
  static Serializer<GSecurityFindingDismissInput> get serializer =>
      _$gSecurityFindingDismissInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSecurityFindingDismissInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSecurityFindingDismissInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSecurityFindingDismissInput.serializer,
        json,
      );
}

abstract class GSecurityPolicyProjectAssignInput
    implements
        Built<GSecurityPolicyProjectAssignInput,
            GSecurityPolicyProjectAssignInputBuilder> {
  GSecurityPolicyProjectAssignInput._();

  factory GSecurityPolicyProjectAssignInput(
          [Function(GSecurityPolicyProjectAssignInputBuilder b) updates]) =
      _$GSecurityPolicyProjectAssignInput;

  String? get clientMutationId;
  String? get fullPath;
  GProjectID get securityPolicyProjectId;
  static Serializer<GSecurityPolicyProjectAssignInput> get serializer =>
      _$gSecurityPolicyProjectAssignInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSecurityPolicyProjectAssignInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSecurityPolicyProjectAssignInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSecurityPolicyProjectAssignInput.serializer,
        json,
      );
}

abstract class GSecurityPolicyProjectCreateInput
    implements
        Built<GSecurityPolicyProjectCreateInput,
            GSecurityPolicyProjectCreateInputBuilder> {
  GSecurityPolicyProjectCreateInput._();

  factory GSecurityPolicyProjectCreateInput(
          [Function(GSecurityPolicyProjectCreateInputBuilder b) updates]) =
      _$GSecurityPolicyProjectCreateInput;

  String? get clientMutationId;
  String? get fullPath;
  static Serializer<GSecurityPolicyProjectCreateInput> get serializer =>
      _$gSecurityPolicyProjectCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSecurityPolicyProjectCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSecurityPolicyProjectCreateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSecurityPolicyProjectCreateInput.serializer,
        json,
      );
}

abstract class GSecurityPolicyProjectUnassignInput
    implements
        Built<GSecurityPolicyProjectUnassignInput,
            GSecurityPolicyProjectUnassignInputBuilder> {
  GSecurityPolicyProjectUnassignInput._();

  factory GSecurityPolicyProjectUnassignInput(
          [Function(GSecurityPolicyProjectUnassignInputBuilder b) updates]) =
      _$GSecurityPolicyProjectUnassignInput;

  String? get clientMutationId;
  String? get fullPath;
  static Serializer<GSecurityPolicyProjectUnassignInput> get serializer =>
      _$gSecurityPolicyProjectUnassignInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSecurityPolicyProjectUnassignInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSecurityPolicyProjectUnassignInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSecurityPolicyProjectUnassignInput.serializer,
        json,
      );
}

class GSecurityPolicyRelationType extends EnumClass {
  const GSecurityPolicyRelationType._(String name) : super(name);

  static const GSecurityPolicyRelationType DIRECT =
      _$gSecurityPolicyRelationTypeDIRECT;

  static const GSecurityPolicyRelationType INHERITED =
      _$gSecurityPolicyRelationTypeINHERITED;

  static const GSecurityPolicyRelationType INHERITED_ONLY =
      _$gSecurityPolicyRelationTypeINHERITED_ONLY;

  static Serializer<GSecurityPolicyRelationType> get serializer =>
      _$gSecurityPolicyRelationTypeSerializer;
  static BuiltSet<GSecurityPolicyRelationType> get values =>
      _$gSecurityPolicyRelationTypeValues;
  static GSecurityPolicyRelationType valueOf(String name) =>
      _$gSecurityPolicyRelationTypeValueOf(name);
}

class GSecurityReportTypeEnum extends EnumClass {
  const GSecurityReportTypeEnum._(String name) : super(name);

  static const GSecurityReportTypeEnum SAST = _$gSecurityReportTypeEnumSAST;

  static const GSecurityReportTypeEnum SAST_IAC =
      _$gSecurityReportTypeEnumSAST_IAC;

  static const GSecurityReportTypeEnum DAST = _$gSecurityReportTypeEnumDAST;

  static const GSecurityReportTypeEnum DEPENDENCY_SCANNING =
      _$gSecurityReportTypeEnumDEPENDENCY_SCANNING;

  static const GSecurityReportTypeEnum CONTAINER_SCANNING =
      _$gSecurityReportTypeEnumCONTAINER_SCANNING;

  static const GSecurityReportTypeEnum SECRET_DETECTION =
      _$gSecurityReportTypeEnumSECRET_DETECTION;

  static const GSecurityReportTypeEnum COVERAGE_FUZZING =
      _$gSecurityReportTypeEnumCOVERAGE_FUZZING;

  static const GSecurityReportTypeEnum API_FUZZING =
      _$gSecurityReportTypeEnumAPI_FUZZING;

  static const GSecurityReportTypeEnum CLUSTER_IMAGE_SCANNING =
      _$gSecurityReportTypeEnumCLUSTER_IMAGE_SCANNING;

  static Serializer<GSecurityReportTypeEnum> get serializer =>
      _$gSecurityReportTypeEnumSerializer;
  static BuiltSet<GSecurityReportTypeEnum> get values =>
      _$gSecurityReportTypeEnumValues;
  static GSecurityReportTypeEnum valueOf(String name) =>
      _$gSecurityReportTypeEnumValueOf(name);
}

class GSecurityScannerType extends EnumClass {
  const GSecurityScannerType._(String name) : super(name);

  static const GSecurityScannerType SAST = _$gSecurityScannerTypeSAST;

  static const GSecurityScannerType SAST_IAC = _$gSecurityScannerTypeSAST_IAC;

  static const GSecurityScannerType DAST = _$gSecurityScannerTypeDAST;

  static const GSecurityScannerType DEPENDENCY_SCANNING =
      _$gSecurityScannerTypeDEPENDENCY_SCANNING;

  static const GSecurityScannerType CONTAINER_SCANNING =
      _$gSecurityScannerTypeCONTAINER_SCANNING;

  static const GSecurityScannerType SECRET_DETECTION =
      _$gSecurityScannerTypeSECRET_DETECTION;

  static const GSecurityScannerType COVERAGE_FUZZING =
      _$gSecurityScannerTypeCOVERAGE_FUZZING;

  static const GSecurityScannerType API_FUZZING =
      _$gSecurityScannerTypeAPI_FUZZING;

  static const GSecurityScannerType CLUSTER_IMAGE_SCANNING =
      _$gSecurityScannerTypeCLUSTER_IMAGE_SCANNING;

  static Serializer<GSecurityScannerType> get serializer =>
      _$gSecurityScannerTypeSerializer;
  static BuiltSet<GSecurityScannerType> get values =>
      _$gSecurityScannerTypeValues;
  static GSecurityScannerType valueOf(String name) =>
      _$gSecurityScannerTypeValueOf(name);
}

abstract class GSecurityTrainingProviderID
    implements
        Built<GSecurityTrainingProviderID, GSecurityTrainingProviderIDBuilder> {
  GSecurityTrainingProviderID._();

  factory GSecurityTrainingProviderID([String? value]) =>
      _$GSecurityTrainingProviderID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GSecurityTrainingProviderID> get serializer =>
      _i2.DefaultScalarSerializer<GSecurityTrainingProviderID>(
          (Object serialized) =>
              GSecurityTrainingProviderID((serialized as String?)));
}

abstract class GSecurityTrainingUpdateInput
    implements
        Built<GSecurityTrainingUpdateInput,
            GSecurityTrainingUpdateInputBuilder> {
  GSecurityTrainingUpdateInput._();

  factory GSecurityTrainingUpdateInput(
          [Function(GSecurityTrainingUpdateInputBuilder b) updates]) =
      _$GSecurityTrainingUpdateInput;

  String? get clientMutationId;
  String get projectPath;
  GSecurityTrainingProviderID get providerId;
  bool get isEnabled;
  bool? get isPrimary;
  static Serializer<GSecurityTrainingUpdateInput> get serializer =>
      _$gSecurityTrainingUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSecurityTrainingUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSecurityTrainingUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSecurityTrainingUpdateInput.serializer,
        json,
      );
}

class GSentryErrorStatus extends EnumClass {
  const GSentryErrorStatus._(String name) : super(name);

  static const GSentryErrorStatus RESOLVED = _$gSentryErrorStatusRESOLVED;

  static const GSentryErrorStatus RESOLVED_IN_NEXT_RELEASE =
      _$gSentryErrorStatusRESOLVED_IN_NEXT_RELEASE;

  static const GSentryErrorStatus UNRESOLVED = _$gSentryErrorStatusUNRESOLVED;

  static const GSentryErrorStatus IGNORED = _$gSentryErrorStatusIGNORED;

  static Serializer<GSentryErrorStatus> get serializer =>
      _$gSentryErrorStatusSerializer;
  static BuiltSet<GSentryErrorStatus> get values => _$gSentryErrorStatusValues;
  static GSentryErrorStatus valueOf(String name) =>
      _$gSentryErrorStatusValueOf(name);
}

class GServiceType extends EnumClass {
  const GServiceType._(String name) : super(name);

  static const GServiceType ASANA_SERVICE = _$gServiceTypeASANA_SERVICE;

  static const GServiceType ASSEMBLA_SERVICE = _$gServiceTypeASSEMBLA_SERVICE;

  static const GServiceType BAMBOO_SERVICE = _$gServiceTypeBAMBOO_SERVICE;

  static const GServiceType BUGZILLA_SERVICE = _$gServiceTypeBUGZILLA_SERVICE;

  static const GServiceType BUILDKITE_SERVICE = _$gServiceTypeBUILDKITE_SERVICE;

  static const GServiceType CAMPFIRE_SERVICE = _$gServiceTypeCAMPFIRE_SERVICE;

  static const GServiceType CONFLUENCE_SERVICE =
      _$gServiceTypeCONFLUENCE_SERVICE;

  static const GServiceType CUSTOM_ISSUE_TRACKER_SERVICE =
      _$gServiceTypeCUSTOM_ISSUE_TRACKER_SERVICE;

  static const GServiceType DATADOG_SERVICE = _$gServiceTypeDATADOG_SERVICE;

  static const GServiceType DISCORD_SERVICE = _$gServiceTypeDISCORD_SERVICE;

  static const GServiceType DRONE_CI_SERVICE = _$gServiceTypeDRONE_CI_SERVICE;

  static const GServiceType EMAILS_ON_PUSH_SERVICE =
      _$gServiceTypeEMAILS_ON_PUSH_SERVICE;

  static const GServiceType EWM_SERVICE = _$gServiceTypeEWM_SERVICE;

  static const GServiceType EXTERNAL_WIKI_SERVICE =
      _$gServiceTypeEXTERNAL_WIKI_SERVICE;

  static const GServiceType FLOWDOCK_SERVICE = _$gServiceTypeFLOWDOCK_SERVICE;

  static const GServiceType GITHUB_SERVICE = _$gServiceTypeGITHUB_SERVICE;

  static const GServiceType GITLAB_SLACK_APPLICATION_SERVICE =
      _$gServiceTypeGITLAB_SLACK_APPLICATION_SERVICE;

  static const GServiceType HANGOUTS_CHAT_SERVICE =
      _$gServiceTypeHANGOUTS_CHAT_SERVICE;

  static const GServiceType HARBOR_SERVICE = _$gServiceTypeHARBOR_SERVICE;

  static const GServiceType IRKER_SERVICE = _$gServiceTypeIRKER_SERVICE;

  static const GServiceType JENKINS_SERVICE = _$gServiceTypeJENKINS_SERVICE;

  static const GServiceType JIRA_SERVICE = _$gServiceTypeJIRA_SERVICE;

  static const GServiceType MATTERMOST_SERVICE =
      _$gServiceTypeMATTERMOST_SERVICE;

  static const GServiceType MATTERMOST_SLASH_COMMANDS_SERVICE =
      _$gServiceTypeMATTERMOST_SLASH_COMMANDS_SERVICE;

  static const GServiceType MICROSOFT_TEAMS_SERVICE =
      _$gServiceTypeMICROSOFT_TEAMS_SERVICE;

  static const GServiceType PACKAGIST_SERVICE = _$gServiceTypePACKAGIST_SERVICE;

  static const GServiceType PIPELINES_EMAIL_SERVICE =
      _$gServiceTypePIPELINES_EMAIL_SERVICE;

  static const GServiceType PIVOTALTRACKER_SERVICE =
      _$gServiceTypePIVOTALTRACKER_SERVICE;

  static const GServiceType PROMETHEUS_SERVICE =
      _$gServiceTypePROMETHEUS_SERVICE;

  static const GServiceType PUMBLE_SERVICE = _$gServiceTypePUMBLE_SERVICE;

  static const GServiceType PUSHOVER_SERVICE = _$gServiceTypePUSHOVER_SERVICE;

  static const GServiceType REDMINE_SERVICE = _$gServiceTypeREDMINE_SERVICE;

  static const GServiceType SHIMO_SERVICE = _$gServiceTypeSHIMO_SERVICE;

  static const GServiceType SLACK_SERVICE = _$gServiceTypeSLACK_SERVICE;

  static const GServiceType SLACK_SLASH_COMMANDS_SERVICE =
      _$gServiceTypeSLACK_SLASH_COMMANDS_SERVICE;

  static const GServiceType TEAMCITY_SERVICE = _$gServiceTypeTEAMCITY_SERVICE;

  static const GServiceType UNIFY_CIRCUIT_SERVICE =
      _$gServiceTypeUNIFY_CIRCUIT_SERVICE;

  static const GServiceType WEBEX_TEAMS_SERVICE =
      _$gServiceTypeWEBEX_TEAMS_SERVICE;

  static const GServiceType YOUTRACK_SERVICE = _$gServiceTypeYOUTRACK_SERVICE;

  static const GServiceType ZENTAO_SERVICE = _$gServiceTypeZENTAO_SERVICE;

  static Serializer<GServiceType> get serializer => _$gServiceTypeSerializer;
  static BuiltSet<GServiceType> get values => _$gServiceTypeValues;
  static GServiceType valueOf(String name) => _$gServiceTypeValueOf(name);
}

class GShaFormat extends EnumClass {
  const GShaFormat._(String name) : super(name);

  static const GShaFormat SHORT = _$gShaFormatSHORT;

  static const GShaFormat LONG = _$gShaFormatLONG;

  static Serializer<GShaFormat> get serializer => _$gShaFormatSerializer;
  static BuiltSet<GShaFormat> get values => _$gShaFormatValues;
  static GShaFormat valueOf(String name) => _$gShaFormatValueOf(name);
}

class GSharedRunnersSetting extends EnumClass {
  const GSharedRunnersSetting._(String name) : super(name);

  static const GSharedRunnersSetting DISABLED_AND_UNOVERRIDABLE =
      _$gSharedRunnersSettingDISABLED_AND_UNOVERRIDABLE;

  static const GSharedRunnersSetting DISABLED_WITH_OVERRIDE =
      _$gSharedRunnersSettingDISABLED_WITH_OVERRIDE;

  static const GSharedRunnersSetting ENABLED = _$gSharedRunnersSettingENABLED;

  static Serializer<GSharedRunnersSetting> get serializer =>
      _$gSharedRunnersSettingSerializer;
  static BuiltSet<GSharedRunnersSetting> get values =>
      _$gSharedRunnersSettingValues;
  static GSharedRunnersSetting valueOf(String name) =>
      _$gSharedRunnersSettingValueOf(name);
}

class GSnippetBlobActionEnum extends EnumClass {
  const GSnippetBlobActionEnum._(String name) : super(name);

  static const GSnippetBlobActionEnum create = _$gSnippetBlobActionEnumcreate;

  @BuiltValueEnumConst(wireName: 'update')
  static const GSnippetBlobActionEnum Gupdate = _$gSnippetBlobActionEnumGupdate;

  static const GSnippetBlobActionEnum delete = _$gSnippetBlobActionEnumdelete;

  static const GSnippetBlobActionEnum move = _$gSnippetBlobActionEnummove;

  static Serializer<GSnippetBlobActionEnum> get serializer =>
      _$gSnippetBlobActionEnumSerializer;
  static BuiltSet<GSnippetBlobActionEnum> get values =>
      _$gSnippetBlobActionEnumValues;
  static GSnippetBlobActionEnum valueOf(String name) =>
      _$gSnippetBlobActionEnumValueOf(name);
}

abstract class GSnippetBlobActionInputType
    implements
        Built<GSnippetBlobActionInputType, GSnippetBlobActionInputTypeBuilder> {
  GSnippetBlobActionInputType._();

  factory GSnippetBlobActionInputType(
          [Function(GSnippetBlobActionInputTypeBuilder b) updates]) =
      _$GSnippetBlobActionInputType;

  GSnippetBlobActionEnum get action;
  String? get previousPath;
  String get filePath;
  String? get content;
  static Serializer<GSnippetBlobActionInputType> get serializer =>
      _$gSnippetBlobActionInputTypeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GSnippetBlobActionInputType.serializer,
        this,
      ) as Map<String, dynamic>);
  static GSnippetBlobActionInputType? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSnippetBlobActionInputType.serializer,
        json,
      );
}

abstract class GSnippetID implements Built<GSnippetID, GSnippetIDBuilder> {
  GSnippetID._();

  factory GSnippetID([String? value]) =>
      _$GSnippetID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GSnippetID> get serializer =>
      _i2.DefaultScalarSerializer<GSnippetID>(
          (Object serialized) => GSnippetID((serialized as String?)));
}

class GSort extends EnumClass {
  const GSort._(String name) : super(name);

  static const GSort updated_desc = _$gSortupdated_desc;

  static const GSort updated_asc = _$gSortupdated_asc;

  static const GSort created_desc = _$gSortcreated_desc;

  static const GSort created_asc = _$gSortcreated_asc;

  static const GSort UPDATED_DESC = _$gSortUPDATED_DESC;

  static const GSort UPDATED_ASC = _$gSortUPDATED_ASC;

  static const GSort CREATED_DESC = _$gSortCREATED_DESC;

  static const GSort CREATED_ASC = _$gSortCREATED_ASC;

  static Serializer<GSort> get serializer => _$gSortSerializer;
  static BuiltSet<GSort> get values => _$gSortValues;
  static GSort valueOf(String name) => _$gSortValueOf(name);
}

class GSortDirectionEnum extends EnumClass {
  const GSortDirectionEnum._(String name) : super(name);

  static const GSortDirectionEnum ASC = _$gSortDirectionEnumASC;

  static const GSortDirectionEnum DESC = _$gSortDirectionEnumDESC;

  static Serializer<GSortDirectionEnum> get serializer =>
      _$gSortDirectionEnumSerializer;
  static BuiltSet<GSortDirectionEnum> get values => _$gSortDirectionEnumValues;
  static GSortDirectionEnum valueOf(String name) =>
      _$gSortDirectionEnumValueOf(name);
}

abstract class GTerraformStateDeleteInput
    implements
        Built<GTerraformStateDeleteInput, GTerraformStateDeleteInputBuilder> {
  GTerraformStateDeleteInput._();

  factory GTerraformStateDeleteInput(
          [Function(GTerraformStateDeleteInputBuilder b) updates]) =
      _$GTerraformStateDeleteInput;

  GTerraformStateID get id;
  String? get clientMutationId;
  static Serializer<GTerraformStateDeleteInput> get serializer =>
      _$gTerraformStateDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTerraformStateDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTerraformStateDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTerraformStateDeleteInput.serializer,
        json,
      );
}

abstract class GTerraformStateID
    implements Built<GTerraformStateID, GTerraformStateIDBuilder> {
  GTerraformStateID._();

  factory GTerraformStateID([String? value]) =>
      _$GTerraformStateID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GTerraformStateID> get serializer =>
      _i2.DefaultScalarSerializer<GTerraformStateID>(
          (Object serialized) => GTerraformStateID((serialized as String?)));
}

abstract class GTerraformStateLockInput
    implements
        Built<GTerraformStateLockInput, GTerraformStateLockInputBuilder> {
  GTerraformStateLockInput._();

  factory GTerraformStateLockInput(
          [Function(GTerraformStateLockInputBuilder b) updates]) =
      _$GTerraformStateLockInput;

  GTerraformStateID get id;
  String? get clientMutationId;
  static Serializer<GTerraformStateLockInput> get serializer =>
      _$gTerraformStateLockInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTerraformStateLockInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTerraformStateLockInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTerraformStateLockInput.serializer,
        json,
      );
}

abstract class GTerraformStateUnlockInput
    implements
        Built<GTerraformStateUnlockInput, GTerraformStateUnlockInputBuilder> {
  GTerraformStateUnlockInput._();

  factory GTerraformStateUnlockInput(
          [Function(GTerraformStateUnlockInputBuilder b) updates]) =
      _$GTerraformStateUnlockInput;

  GTerraformStateID get id;
  String? get clientMutationId;
  static Serializer<GTerraformStateUnlockInput> get serializer =>
      _$gTerraformStateUnlockInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTerraformStateUnlockInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTerraformStateUnlockInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTerraformStateUnlockInput.serializer,
        json,
      );
}

class GTestCaseStatus extends EnumClass {
  const GTestCaseStatus._(String name) : super(name);

  static const GTestCaseStatus error = _$gTestCaseStatuserror;

  static const GTestCaseStatus failed = _$gTestCaseStatusfailed;

  static const GTestCaseStatus success = _$gTestCaseStatussuccess;

  static const GTestCaseStatus skipped = _$gTestCaseStatusskipped;

  static Serializer<GTestCaseStatus> get serializer =>
      _$gTestCaseStatusSerializer;
  static BuiltSet<GTestCaseStatus> get values => _$gTestCaseStatusValues;
  static GTestCaseStatus valueOf(String name) => _$gTestCaseStatusValueOf(name);
}

class GTestReportState extends EnumClass {
  const GTestReportState._(String name) : super(name);

  static const GTestReportState PASSED = _$gTestReportStatePASSED;

  static const GTestReportState FAILED = _$gTestReportStateFAILED;

  static Serializer<GTestReportState> get serializer =>
      _$gTestReportStateSerializer;
  static BuiltSet<GTestReportState> get values => _$gTestReportStateValues;
  static GTestReportState valueOf(String name) =>
      _$gTestReportStateValueOf(name);
}

abstract class GTime implements Built<GTime, GTimeBuilder> {
  GTime._();

  factory GTime([String? value]) =>
      _$GTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GTime> get serializer => _i2.DefaultScalarSerializer<GTime>(
      (Object serialized) => GTime((serialized as String?)));
}

class GTimeboxReportErrorReason extends EnumClass {
  const GTimeboxReportErrorReason._(String name) : super(name);

  static const GTimeboxReportErrorReason UNSUPPORTED =
      _$gTimeboxReportErrorReasonUNSUPPORTED;

  static const GTimeboxReportErrorReason MISSING_DATES =
      _$gTimeboxReportErrorReasonMISSING_DATES;

  static const GTimeboxReportErrorReason TOO_MANY_EVENTS =
      _$gTimeboxReportErrorReasonTOO_MANY_EVENTS;

  static const GTimeboxReportErrorReason PRIORITY_ASC =
      _$gTimeboxReportErrorReasonPRIORITY_ASC;

  static const GTimeboxReportErrorReason PRIORITY_DESC =
      _$gTimeboxReportErrorReasonPRIORITY_DESC;

  static const GTimeboxReportErrorReason LABEL_PRIORITY_ASC =
      _$gTimeboxReportErrorReasonLABEL_PRIORITY_ASC;

  static const GTimeboxReportErrorReason LABEL_PRIORITY_DESC =
      _$gTimeboxReportErrorReasonLABEL_PRIORITY_DESC;

  static const GTimeboxReportErrorReason MILESTONE_DUE_ASC =
      _$gTimeboxReportErrorReasonMILESTONE_DUE_ASC;

  static const GTimeboxReportErrorReason MILESTONE_DUE_DESC =
      _$gTimeboxReportErrorReasonMILESTONE_DUE_DESC;

  static const GTimeboxReportErrorReason updated_desc =
      _$gTimeboxReportErrorReasonupdated_desc;

  static const GTimeboxReportErrorReason updated_asc =
      _$gTimeboxReportErrorReasonupdated_asc;

  static const GTimeboxReportErrorReason created_desc =
      _$gTimeboxReportErrorReasoncreated_desc;

  static const GTimeboxReportErrorReason created_asc =
      _$gTimeboxReportErrorReasoncreated_asc;

  static const GTimeboxReportErrorReason UPDATED_DESC =
      _$gTimeboxReportErrorReasonUPDATED_DESC;

  static const GTimeboxReportErrorReason UPDATED_ASC =
      _$gTimeboxReportErrorReasonUPDATED_ASC;

  static const GTimeboxReportErrorReason CREATED_DESC =
      _$gTimeboxReportErrorReasonCREATED_DESC;

  static const GTimeboxReportErrorReason CREATED_ASC =
      _$gTimeboxReportErrorReasonCREATED_ASC;

  static Serializer<GTimeboxReportErrorReason> get serializer =>
      _$gTimeboxReportErrorReasonSerializer;
  static BuiltSet<GTimeboxReportErrorReason> get values =>
      _$gTimeboxReportErrorReasonValues;
  static GTimeboxReportErrorReason valueOf(String name) =>
      _$gTimeboxReportErrorReasonValueOf(name);
}

abstract class GTimeframe implements Built<GTimeframe, GTimeframeBuilder> {
  GTimeframe._();

  factory GTimeframe([Function(GTimeframeBuilder b) updates]) = _$GTimeframe;

  GDate get start;
  GDate get end;
  static Serializer<GTimeframe> get serializer => _$gTimeframeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTimeframe.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTimeframe? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTimeframe.serializer,
        json,
      );
}

abstract class GTimelineEventCreateInput
    implements
        Built<GTimelineEventCreateInput, GTimelineEventCreateInputBuilder> {
  GTimelineEventCreateInput._();

  factory GTimelineEventCreateInput(
          [Function(GTimelineEventCreateInputBuilder b) updates]) =
      _$GTimelineEventCreateInput;

  String? get clientMutationId;
  GIssueID get incidentId;
  String get note;
  GTime get occurredAt;
  static Serializer<GTimelineEventCreateInput> get serializer =>
      _$gTimelineEventCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTimelineEventCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTimelineEventCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTimelineEventCreateInput.serializer,
        json,
      );
}

abstract class GTimelineEventDestroyInput
    implements
        Built<GTimelineEventDestroyInput, GTimelineEventDestroyInputBuilder> {
  GTimelineEventDestroyInput._();

  factory GTimelineEventDestroyInput(
          [Function(GTimelineEventDestroyInputBuilder b) updates]) =
      _$GTimelineEventDestroyInput;

  String? get clientMutationId;
  GIncidentManagementTimelineEventID get id;
  static Serializer<GTimelineEventDestroyInput> get serializer =>
      _$gTimelineEventDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTimelineEventDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTimelineEventDestroyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTimelineEventDestroyInput.serializer,
        json,
      );
}

abstract class GTimelineEventPromoteFromNoteInput
    implements
        Built<GTimelineEventPromoteFromNoteInput,
            GTimelineEventPromoteFromNoteInputBuilder> {
  GTimelineEventPromoteFromNoteInput._();

  factory GTimelineEventPromoteFromNoteInput(
          [Function(GTimelineEventPromoteFromNoteInputBuilder b) updates]) =
      _$GTimelineEventPromoteFromNoteInput;

  String? get clientMutationId;
  GNoteID get noteId;
  static Serializer<GTimelineEventPromoteFromNoteInput> get serializer =>
      _$gTimelineEventPromoteFromNoteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTimelineEventPromoteFromNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTimelineEventPromoteFromNoteInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTimelineEventPromoteFromNoteInput.serializer,
        json,
      );
}

abstract class GTimelineEventUpdateInput
    implements
        Built<GTimelineEventUpdateInput, GTimelineEventUpdateInputBuilder> {
  GTimelineEventUpdateInput._();

  factory GTimelineEventUpdateInput(
          [Function(GTimelineEventUpdateInputBuilder b) updates]) =
      _$GTimelineEventUpdateInput;

  String? get clientMutationId;
  GIncidentManagementTimelineEventID get id;
  String? get note;
  GTime? get occurredAt;
  static Serializer<GTimelineEventUpdateInput> get serializer =>
      _$gTimelineEventUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTimelineEventUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTimelineEventUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTimelineEventUpdateInput.serializer,
        json,
      );
}

abstract class GTimelogCreateInput
    implements Built<GTimelogCreateInput, GTimelogCreateInputBuilder> {
  GTimelogCreateInput._();

  factory GTimelogCreateInput(
      [Function(GTimelogCreateInputBuilder b) updates]) = _$GTimelogCreateInput;

  String? get clientMutationId;
  String get timeSpent;
  GDate get spentAt;
  String get summary;
  GIssuableID get issuableId;
  static Serializer<GTimelogCreateInput> get serializer =>
      _$gTimelogCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTimelogCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTimelogCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTimelogCreateInput.serializer,
        json,
      );
}

abstract class GTimelogDeleteInput
    implements Built<GTimelogDeleteInput, GTimelogDeleteInputBuilder> {
  GTimelogDeleteInput._();

  factory GTimelogDeleteInput(
      [Function(GTimelogDeleteInputBuilder b) updates]) = _$GTimelogDeleteInput;

  String? get clientMutationId;
  GTimelogID get id;
  static Serializer<GTimelogDeleteInput> get serializer =>
      _$gTimelogDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTimelogDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTimelogDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTimelogDeleteInput.serializer,
        json,
      );
}

abstract class GTimelogID implements Built<GTimelogID, GTimelogIDBuilder> {
  GTimelogID._();

  factory GTimelogID([String? value]) =>
      _$GTimelogID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GTimelogID> get serializer =>
      _i2.DefaultScalarSerializer<GTimelogID>(
          (Object serialized) => GTimelogID((serialized as String?)));
}

abstract class GTodoableID implements Built<GTodoableID, GTodoableIDBuilder> {
  GTodoableID._();

  factory GTodoableID([String? value]) =>
      _$GTodoableID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GTodoableID> get serializer =>
      _i2.DefaultScalarSerializer<GTodoableID>(
          (Object serialized) => GTodoableID((serialized as String?)));
}

class GTodoActionEnum extends EnumClass {
  const GTodoActionEnum._(String name) : super(name);

  static const GTodoActionEnum assigned = _$gTodoActionEnumassigned;

  static const GTodoActionEnum mentioned = _$gTodoActionEnummentioned;

  static const GTodoActionEnum build_failed = _$gTodoActionEnumbuild_failed;

  static const GTodoActionEnum marked = _$gTodoActionEnummarked;

  static const GTodoActionEnum approval_required =
      _$gTodoActionEnumapproval_required;

  static const GTodoActionEnum unmergeable = _$gTodoActionEnumunmergeable;

  static const GTodoActionEnum directly_addressed =
      _$gTodoActionEnumdirectly_addressed;

  static const GTodoActionEnum merge_train_removed =
      _$gTodoActionEnummerge_train_removed;

  static const GTodoActionEnum review_requested =
      _$gTodoActionEnumreview_requested;

  static Serializer<GTodoActionEnum> get serializer =>
      _$gTodoActionEnumSerializer;
  static BuiltSet<GTodoActionEnum> get values => _$gTodoActionEnumValues;
  static GTodoActionEnum valueOf(String name) => _$gTodoActionEnumValueOf(name);
}

abstract class GTodoCreateInput
    implements Built<GTodoCreateInput, GTodoCreateInputBuilder> {
  GTodoCreateInput._();

  factory GTodoCreateInput([Function(GTodoCreateInputBuilder b) updates]) =
      _$GTodoCreateInput;

  String? get clientMutationId;
  GTodoableID get targetId;
  static Serializer<GTodoCreateInput> get serializer =>
      _$gTodoCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTodoCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTodoCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTodoCreateInput.serializer,
        json,
      );
}

abstract class GTodoID implements Built<GTodoID, GTodoIDBuilder> {
  GTodoID._();

  factory GTodoID([String? value]) =>
      _$GTodoID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GTodoID> get serializer =>
      _i2.DefaultScalarSerializer<GTodoID>(
          (Object serialized) => GTodoID((serialized as String?)));
}

abstract class GTodoMarkDoneInput
    implements Built<GTodoMarkDoneInput, GTodoMarkDoneInputBuilder> {
  GTodoMarkDoneInput._();

  factory GTodoMarkDoneInput([Function(GTodoMarkDoneInputBuilder b) updates]) =
      _$GTodoMarkDoneInput;

  String? get clientMutationId;
  GTodoID get id;
  static Serializer<GTodoMarkDoneInput> get serializer =>
      _$gTodoMarkDoneInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTodoMarkDoneInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTodoMarkDoneInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTodoMarkDoneInput.serializer,
        json,
      );
}

abstract class GTodoRestoreInput
    implements Built<GTodoRestoreInput, GTodoRestoreInputBuilder> {
  GTodoRestoreInput._();

  factory GTodoRestoreInput([Function(GTodoRestoreInputBuilder b) updates]) =
      _$GTodoRestoreInput;

  String? get clientMutationId;
  GTodoID get id;
  static Serializer<GTodoRestoreInput> get serializer =>
      _$gTodoRestoreInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTodoRestoreInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTodoRestoreInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTodoRestoreInput.serializer,
        json,
      );
}

abstract class GTodoRestoreManyInput
    implements Built<GTodoRestoreManyInput, GTodoRestoreManyInputBuilder> {
  GTodoRestoreManyInput._();

  factory GTodoRestoreManyInput(
          [Function(GTodoRestoreManyInputBuilder b) updates]) =
      _$GTodoRestoreManyInput;

  String? get clientMutationId;
  BuiltList<GTodoID> get ids;
  static Serializer<GTodoRestoreManyInput> get serializer =>
      _$gTodoRestoreManyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTodoRestoreManyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTodoRestoreManyInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTodoRestoreManyInput.serializer,
        json,
      );
}

abstract class GTodosMarkAllDoneInput
    implements Built<GTodosMarkAllDoneInput, GTodosMarkAllDoneInputBuilder> {
  GTodosMarkAllDoneInput._();

  factory GTodosMarkAllDoneInput(
          [Function(GTodosMarkAllDoneInputBuilder b) updates]) =
      _$GTodosMarkAllDoneInput;

  String? get clientMutationId;
  GTodoableID? get targetId;
  static Serializer<GTodosMarkAllDoneInput> get serializer =>
      _$gTodosMarkAllDoneInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTodosMarkAllDoneInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GTodosMarkAllDoneInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTodosMarkAllDoneInput.serializer,
        json,
      );
}

class GTodoStateEnum extends EnumClass {
  const GTodoStateEnum._(String name) : super(name);

  static const GTodoStateEnum pending = _$gTodoStateEnumpending;

  static const GTodoStateEnum done = _$gTodoStateEnumdone;

  static Serializer<GTodoStateEnum> get serializer =>
      _$gTodoStateEnumSerializer;
  static BuiltSet<GTodoStateEnum> get values => _$gTodoStateEnumValues;
  static GTodoStateEnum valueOf(String name) => _$gTodoStateEnumValueOf(name);
}

class GTodoTargetEnum extends EnumClass {
  const GTodoTargetEnum._(String name) : super(name);

  static const GTodoTargetEnum COMMIT = _$gTodoTargetEnumCOMMIT;

  static const GTodoTargetEnum ISSUE = _$gTodoTargetEnumISSUE;

  static const GTodoTargetEnum WORKITEM = _$gTodoTargetEnumWORKITEM;

  static const GTodoTargetEnum MERGEREQUEST = _$gTodoTargetEnumMERGEREQUEST;

  static const GTodoTargetEnum DESIGN = _$gTodoTargetEnumDESIGN;

  static const GTodoTargetEnum ALERT = _$gTodoTargetEnumALERT;

  static const GTodoTargetEnum EPIC = _$gTodoTargetEnumEPIC;

  static Serializer<GTodoTargetEnum> get serializer =>
      _$gTodoTargetEnumSerializer;
  static BuiltSet<GTodoTargetEnum> get values => _$gTodoTargetEnumValues;
  static GTodoTargetEnum valueOf(String name) => _$gTodoTargetEnumValueOf(name);
}

class GTrainingUrlRequestStatus extends EnumClass {
  const GTrainingUrlRequestStatus._(String name) : super(name);

  static const GTrainingUrlRequestStatus PENDING =
      _$gTrainingUrlRequestStatusPENDING;

  static const GTrainingUrlRequestStatus COMPLETED =
      _$gTrainingUrlRequestStatusCOMPLETED;

  static Serializer<GTrainingUrlRequestStatus> get serializer =>
      _$gTrainingUrlRequestStatusSerializer;
  static BuiltSet<GTrainingUrlRequestStatus> get values =>
      _$gTrainingUrlRequestStatusValues;
  static GTrainingUrlRequestStatus valueOf(String name) =>
      _$gTrainingUrlRequestStatusValueOf(name);
}

class GTypeEnum extends EnumClass {
  const GTypeEnum._(String name) : super(name);

  static const GTypeEnum personal = _$gTypeEnumpersonal;

  static const GTypeEnum project = _$gTypeEnumproject;

  static Serializer<GTypeEnum> get serializer => _$gTypeEnumSerializer;
  static BuiltSet<GTypeEnum> get values => _$gTypeEnumValues;
  static GTypeEnum valueOf(String name) => _$gTypeEnumValueOf(name);
}

abstract class GUntrustedRegexp
    implements Built<GUntrustedRegexp, GUntrustedRegexpBuilder> {
  GUntrustedRegexp._();

  factory GUntrustedRegexp([String? value]) =>
      _$GUntrustedRegexp((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GUntrustedRegexp> get serializer =>
      _i2.DefaultScalarSerializer<GUntrustedRegexp>(
          (Object serialized) => GUntrustedRegexp((serialized as String?)));
}

abstract class GUpdateAlertStatusInput
    implements Built<GUpdateAlertStatusInput, GUpdateAlertStatusInputBuilder> {
  GUpdateAlertStatusInput._();

  factory GUpdateAlertStatusInput(
          [Function(GUpdateAlertStatusInputBuilder b) updates]) =
      _$GUpdateAlertStatusInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  GAlertManagementStatus get status;
  static Serializer<GUpdateAlertStatusInput> get serializer =>
      _$gUpdateAlertStatusInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateAlertStatusInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateAlertStatusInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateAlertStatusInput.serializer,
        json,
      );
}

abstract class GUpdateBoardEpicUserPreferencesInput
    implements
        Built<GUpdateBoardEpicUserPreferencesInput,
            GUpdateBoardEpicUserPreferencesInputBuilder> {
  GUpdateBoardEpicUserPreferencesInput._();

  factory GUpdateBoardEpicUserPreferencesInput(
          [Function(GUpdateBoardEpicUserPreferencesInputBuilder b) updates]) =
      _$GUpdateBoardEpicUserPreferencesInput;

  String? get clientMutationId;
  GBoardID get boardId;
  GEpicID get epicId;
  bool get collapsed;
  static Serializer<GUpdateBoardEpicUserPreferencesInput> get serializer =>
      _$gUpdateBoardEpicUserPreferencesInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateBoardEpicUserPreferencesInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateBoardEpicUserPreferencesInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateBoardEpicUserPreferencesInput.serializer,
        json,
      );
}

abstract class GUpdateBoardInput
    implements Built<GUpdateBoardInput, GUpdateBoardInputBuilder> {
  GUpdateBoardInput._();

  factory GUpdateBoardInput([Function(GUpdateBoardInputBuilder b) updates]) =
      _$GUpdateBoardInput;

  String? get clientMutationId;
  String? get name;
  bool? get hideBacklogList;
  bool? get hideClosedList;
  GBoardID get id;
  GUserID? get assigneeId;
  GMilestoneID? get milestoneId;
  GIterationID? get iterationId;
  GIterationsCadenceID? get iterationCadenceId;
  int? get weight;
  BuiltList<String>? get labels;
  BuiltList<GLabelID>? get labelIds;
  static Serializer<GUpdateBoardInput> get serializer =>
      _$gUpdateBoardInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateBoardInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateBoardInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateBoardInput.serializer,
        json,
      );
}

abstract class GUpdateBoardListInput
    implements Built<GUpdateBoardListInput, GUpdateBoardListInputBuilder> {
  GUpdateBoardListInput._();

  factory GUpdateBoardListInput(
          [Function(GUpdateBoardListInputBuilder b) updates]) =
      _$GUpdateBoardListInput;

  int? get position;
  bool? get collapsed;
  String? get clientMutationId;
  GListID get listId;
  static Serializer<GUpdateBoardListInput> get serializer =>
      _$gUpdateBoardListInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateBoardListInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateBoardListInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateBoardListInput.serializer,
        json,
      );
}

abstract class GUpdateComplianceFrameworkInput
    implements
        Built<GUpdateComplianceFrameworkInput,
            GUpdateComplianceFrameworkInputBuilder> {
  GUpdateComplianceFrameworkInput._();

  factory GUpdateComplianceFrameworkInput(
          [Function(GUpdateComplianceFrameworkInputBuilder b) updates]) =
      _$GUpdateComplianceFrameworkInput;

  String? get clientMutationId;
  GComplianceManagementFrameworkID get id;
  GComplianceFrameworkInput get params;
  static Serializer<GUpdateComplianceFrameworkInput> get serializer =>
      _$gUpdateComplianceFrameworkInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateComplianceFrameworkInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateComplianceFrameworkInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateComplianceFrameworkInput.serializer,
        json,
      );
}

abstract class GUpdateContainerExpirationPolicyInput
    implements
        Built<GUpdateContainerExpirationPolicyInput,
            GUpdateContainerExpirationPolicyInputBuilder> {
  GUpdateContainerExpirationPolicyInput._();

  factory GUpdateContainerExpirationPolicyInput(
          [Function(GUpdateContainerExpirationPolicyInputBuilder b) updates]) =
      _$GUpdateContainerExpirationPolicyInput;

  String? get clientMutationId;
  String get projectPath;
  bool? get enabled;
  GContainerExpirationPolicyCadenceEnum? get cadence;
  GContainerExpirationPolicyOlderThanEnum? get olderThan;
  GContainerExpirationPolicyKeepEnum? get keepN;
  GUntrustedRegexp? get nameRegex;
  GUntrustedRegexp? get nameRegexKeep;
  static Serializer<GUpdateContainerExpirationPolicyInput> get serializer =>
      _$gUpdateContainerExpirationPolicyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateContainerExpirationPolicyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateContainerExpirationPolicyInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateContainerExpirationPolicyInput.serializer,
        json,
      );
}

abstract class GUpdateDependencyProxyImageTtlGroupPolicyInput
    implements
        Built<GUpdateDependencyProxyImageTtlGroupPolicyInput,
            GUpdateDependencyProxyImageTtlGroupPolicyInputBuilder> {
  GUpdateDependencyProxyImageTtlGroupPolicyInput._();

  factory GUpdateDependencyProxyImageTtlGroupPolicyInput(
      [Function(GUpdateDependencyProxyImageTtlGroupPolicyInputBuilder b)
          updates]) = _$GUpdateDependencyProxyImageTtlGroupPolicyInput;

  String? get clientMutationId;
  String get groupPath;
  bool? get enabled;
  int? get ttl;
  static Serializer<GUpdateDependencyProxyImageTtlGroupPolicyInput>
      get serializer =>
          _$gUpdateDependencyProxyImageTtlGroupPolicyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateDependencyProxyImageTtlGroupPolicyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateDependencyProxyImageTtlGroupPolicyInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateDependencyProxyImageTtlGroupPolicyInput.serializer,
        json,
      );
}

abstract class GUpdateDependencyProxySettingsInput
    implements
        Built<GUpdateDependencyProxySettingsInput,
            GUpdateDependencyProxySettingsInputBuilder> {
  GUpdateDependencyProxySettingsInput._();

  factory GUpdateDependencyProxySettingsInput(
          [Function(GUpdateDependencyProxySettingsInputBuilder b) updates]) =
      _$GUpdateDependencyProxySettingsInput;

  String? get clientMutationId;
  String get groupPath;
  bool? get enabled;
  static Serializer<GUpdateDependencyProxySettingsInput> get serializer =>
      _$gUpdateDependencyProxySettingsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateDependencyProxySettingsInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateDependencyProxySettingsInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateDependencyProxySettingsInput.serializer,
        json,
      );
}

abstract class GUpdateDiffImagePositionInput
    implements
        Built<GUpdateDiffImagePositionInput,
            GUpdateDiffImagePositionInputBuilder> {
  GUpdateDiffImagePositionInput._();

  factory GUpdateDiffImagePositionInput(
          [Function(GUpdateDiffImagePositionInputBuilder b) updates]) =
      _$GUpdateDiffImagePositionInput;

  int? get x;
  int? get y;
  int? get width;
  int? get height;
  static Serializer<GUpdateDiffImagePositionInput> get serializer =>
      _$gUpdateDiffImagePositionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateDiffImagePositionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateDiffImagePositionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateDiffImagePositionInput.serializer,
        json,
      );
}

abstract class GUpdateEpicBoardListInput
    implements
        Built<GUpdateEpicBoardListInput, GUpdateEpicBoardListInputBuilder> {
  GUpdateEpicBoardListInput._();

  factory GUpdateEpicBoardListInput(
          [Function(GUpdateEpicBoardListInputBuilder b) updates]) =
      _$GUpdateEpicBoardListInput;

  int? get position;
  bool? get collapsed;
  String? get clientMutationId;
  GBoardsEpicListID get listId;
  static Serializer<GUpdateEpicBoardListInput> get serializer =>
      _$gUpdateEpicBoardListInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEpicBoardListInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateEpicBoardListInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEpicBoardListInput.serializer,
        json,
      );
}

abstract class GUpdateEpicInput
    implements Built<GUpdateEpicInput, GUpdateEpicInputBuilder> {
  GUpdateEpicInput._();

  factory GUpdateEpicInput([Function(GUpdateEpicInputBuilder b) updates]) =
      _$GUpdateEpicInput;

  String get iid;
  String? get clientMutationId;
  String get groupPath;
  String? get title;
  String? get description;
  bool? get confidential;
  String? get startDateFixed;
  String? get dueDateFixed;
  bool? get startDateIsFixed;
  bool? get dueDateIsFixed;
  BuiltList<String>? get addLabelIds;
  BuiltList<String>? get removeLabelIds;
  BuiltList<String>? get addLabels;
  GColor? get color;
  GEpicStateEvent? get stateEvent;
  BuiltList<String>? get removeLabels;
  static Serializer<GUpdateEpicInput> get serializer =>
      _$gUpdateEpicInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateEpicInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateEpicInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateEpicInput.serializer,
        json,
      );
}

abstract class GUpdateImageDiffNoteInput
    implements
        Built<GUpdateImageDiffNoteInput, GUpdateImageDiffNoteInputBuilder> {
  GUpdateImageDiffNoteInput._();

  factory GUpdateImageDiffNoteInput(
          [Function(GUpdateImageDiffNoteInputBuilder b) updates]) =
      _$GUpdateImageDiffNoteInput;

  GNoteID get id;
  String? get clientMutationId;
  String? get body;
  GUpdateDiffImagePositionInput? get position;
  static Serializer<GUpdateImageDiffNoteInput> get serializer =>
      _$gUpdateImageDiffNoteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateImageDiffNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateImageDiffNoteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateImageDiffNoteInput.serializer,
        json,
      );
}

abstract class GUpdateIssueInput
    implements Built<GUpdateIssueInput, GUpdateIssueInputBuilder> {
  GUpdateIssueInput._();

  factory GUpdateIssueInput([Function(GUpdateIssueInputBuilder b) updates]) =
      _$GUpdateIssueInput;

  String get projectPath;
  String get iid;
  String? get clientMutationId;
  String? get description;
  GISO8601Date? get dueDate;
  bool? get confidential;
  bool? get locked;
  GIssueType? get type;
  String? get title;
  String? get milestoneId;
  BuiltList<String>? get addLabelIds;
  BuiltList<String>? get removeLabelIds;
  BuiltList<String>? get labelIds;
  GIssueStateEvent? get stateEvent;
  GHealthStatus? get healthStatus;
  int? get weight;
  GEpicID? get epicId;
  static Serializer<GUpdateIssueInput> get serializer =>
      _$gUpdateIssueInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateIssueInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateIssueInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateIssueInput.serializer,
        json,
      );
}

abstract class GUpdateIterationInput
    implements Built<GUpdateIterationInput, GUpdateIterationInputBuilder> {
  GUpdateIterationInput._();

  factory GUpdateIterationInput(
          [Function(GUpdateIterationInputBuilder b) updates]) =
      _$GUpdateIterationInput;

  String? get clientMutationId;
  String get groupPath;
  String get id;
  String? get title;
  String? get description;
  String? get startDate;
  String? get dueDate;
  static Serializer<GUpdateIterationInput> get serializer =>
      _$gUpdateIterationInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateIterationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateIterationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateIterationInput.serializer,
        json,
      );
}

abstract class GUpdateNamespacePackageSettingsInput
    implements
        Built<GUpdateNamespacePackageSettingsInput,
            GUpdateNamespacePackageSettingsInputBuilder> {
  GUpdateNamespacePackageSettingsInput._();

  factory GUpdateNamespacePackageSettingsInput(
          [Function(GUpdateNamespacePackageSettingsInputBuilder b) updates]) =
      _$GUpdateNamespacePackageSettingsInput;

  String? get clientMutationId;
  String get namespacePath;
  bool? get mavenDuplicatesAllowed;
  GUntrustedRegexp? get mavenDuplicateExceptionRegex;
  bool? get genericDuplicatesAllowed;
  GUntrustedRegexp? get genericDuplicateExceptionRegex;
  static Serializer<GUpdateNamespacePackageSettingsInput> get serializer =>
      _$gUpdateNamespacePackageSettingsInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateNamespacePackageSettingsInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateNamespacePackageSettingsInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateNamespacePackageSettingsInput.serializer,
        json,
      );
}

abstract class GUpdateNoteInput
    implements Built<GUpdateNoteInput, GUpdateNoteInputBuilder> {
  GUpdateNoteInput._();

  factory GUpdateNoteInput([Function(GUpdateNoteInputBuilder b) updates]) =
      _$GUpdateNoteInput;

  GNoteID get id;
  String? get clientMutationId;
  String? get body;
  static Serializer<GUpdateNoteInput> get serializer =>
      _$gUpdateNoteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateNoteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateNoteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateNoteInput.serializer,
        json,
      );
}

abstract class GUpdatePackagesCleanupPolicyInput
    implements
        Built<GUpdatePackagesCleanupPolicyInput,
            GUpdatePackagesCleanupPolicyInputBuilder> {
  GUpdatePackagesCleanupPolicyInput._();

  factory GUpdatePackagesCleanupPolicyInput(
          [Function(GUpdatePackagesCleanupPolicyInputBuilder b) updates]) =
      _$GUpdatePackagesCleanupPolicyInput;

  String? get clientMutationId;
  String get projectPath;
  GPackagesCleanupKeepDuplicatedPackageFilesEnum?
      get keepNDuplicatedPackageFiles;
  static Serializer<GUpdatePackagesCleanupPolicyInput> get serializer =>
      _$gUpdatePackagesCleanupPolicyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdatePackagesCleanupPolicyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdatePackagesCleanupPolicyInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdatePackagesCleanupPolicyInput.serializer,
        json,
      );
}

abstract class GUpdateRequirementInput
    implements Built<GUpdateRequirementInput, GUpdateRequirementInputBuilder> {
  GUpdateRequirementInput._();

  factory GUpdateRequirementInput(
          [Function(GUpdateRequirementInputBuilder b) updates]) =
      _$GUpdateRequirementInput;

  String? get title;
  String? get description;
  String get projectPath;
  String? get clientMutationId;
  GRequirementState? get state;
  String get iid;
  GTestReportState? get lastTestReportState;
  static Serializer<GUpdateRequirementInput> get serializer =>
      _$gUpdateRequirementInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateRequirementInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateRequirementInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateRequirementInput.serializer,
        json,
      );
}

abstract class GUpdateSnippetInput
    implements Built<GUpdateSnippetInput, GUpdateSnippetInputBuilder> {
  GUpdateSnippetInput._();

  factory GUpdateSnippetInput(
      [Function(GUpdateSnippetInputBuilder b) updates]) = _$GUpdateSnippetInput;

  String? get clientMutationId;
  GSnippetID get id;
  String? get title;
  String? get description;
  GVisibilityLevelsEnum? get visibilityLevel;
  BuiltList<GSnippetBlobActionInputType>? get blobActions;
  static Serializer<GUpdateSnippetInput> get serializer =>
      _$gUpdateSnippetInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUpdateSnippetInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUpdateSnippetInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUpdateSnippetInput.serializer,
        json,
      );
}

abstract class GUpload implements Built<GUpload, GUploadBuilder> {
  GUpload._();

  factory GUpload([String? value]) =>
      _$GUpload((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GUpload> get serializer =>
      _i2.DefaultScalarSerializer<GUpload>(
          (Object serialized) => GUpload((serialized as String?)));
}

abstract class GUploadDeleteInput
    implements Built<GUploadDeleteInput, GUploadDeleteInputBuilder> {
  GUploadDeleteInput._();

  factory GUploadDeleteInput([Function(GUploadDeleteInputBuilder b) updates]) =
      _$GUploadDeleteInput;

  String? get clientMutationId;
  String? get projectPath;
  String? get groupPath;
  String get secret;
  String get filename;
  static Serializer<GUploadDeleteInput> get serializer =>
      _$gUploadDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUploadDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUploadDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUploadDeleteInput.serializer,
        json,
      );
}

abstract class GUploadID implements Built<GUploadID, GUploadIDBuilder> {
  GUploadID._();

  factory GUploadID([String? value]) =>
      _$GUploadID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GUploadID> get serializer =>
      _i2.DefaultScalarSerializer<GUploadID>(
          (Object serialized) => GUploadID((serialized as String?)));
}

abstract class GUserCalloutCreateInput
    implements Built<GUserCalloutCreateInput, GUserCalloutCreateInputBuilder> {
  GUserCalloutCreateInput._();

  factory GUserCalloutCreateInput(
          [Function(GUserCalloutCreateInputBuilder b) updates]) =
      _$GUserCalloutCreateInput;

  String? get clientMutationId;
  String get featureName;
  static Serializer<GUserCalloutCreateInput> get serializer =>
      _$gUserCalloutCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserCalloutCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserCalloutCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserCalloutCreateInput.serializer,
        json,
      );
}

class GUserCalloutFeatureNameEnum extends EnumClass {
  const GUserCalloutFeatureNameEnum._(String name) : super(name);

  static const GUserCalloutFeatureNameEnum GKE_CLUSTER_INTEGRATION =
      _$gUserCalloutFeatureNameEnumGKE_CLUSTER_INTEGRATION;

  static const GUserCalloutFeatureNameEnum GCP_SIGNUP_OFFER =
      _$gUserCalloutFeatureNameEnumGCP_SIGNUP_OFFER;

  static const GUserCalloutFeatureNameEnum CLUSTER_SECURITY_WARNING =
      _$gUserCalloutFeatureNameEnumCLUSTER_SECURITY_WARNING;

  static const GUserCalloutFeatureNameEnum ULTIMATE_TRIAL =
      _$gUserCalloutFeatureNameEnumULTIMATE_TRIAL;

  static const GUserCalloutFeatureNameEnum GEO_ENABLE_HASHED_STORAGE =
      _$gUserCalloutFeatureNameEnumGEO_ENABLE_HASHED_STORAGE;

  static const GUserCalloutFeatureNameEnum GEO_MIGRATE_HASHED_STORAGE =
      _$gUserCalloutFeatureNameEnumGEO_MIGRATE_HASHED_STORAGE;

  static const GUserCalloutFeatureNameEnum CANARY_DEPLOYMENT =
      _$gUserCalloutFeatureNameEnumCANARY_DEPLOYMENT;

  static const GUserCalloutFeatureNameEnum GOLD_TRIAL_BILLINGS =
      _$gUserCalloutFeatureNameEnumGOLD_TRIAL_BILLINGS;

  static const GUserCalloutFeatureNameEnum SUGGEST_POPOVER_DISMISSED =
      _$gUserCalloutFeatureNameEnumSUGGEST_POPOVER_DISMISSED;

  static const GUserCalloutFeatureNameEnum TABS_POSITION_HIGHLIGHT =
      _$gUserCalloutFeatureNameEnumTABS_POSITION_HIGHLIGHT;

  static const GUserCalloutFeatureNameEnum THREAT_MONITORING_INFO =
      _$gUserCalloutFeatureNameEnumTHREAT_MONITORING_INFO;

  static const GUserCalloutFeatureNameEnum
      TWO_FACTOR_AUTH_RECOVERY_SETTINGS_CHECK =
      _$gUserCalloutFeatureNameEnumTWO_FACTOR_AUTH_RECOVERY_SETTINGS_CHECK;

  static const GUserCalloutFeatureNameEnum WEB_IDE_ALERT_DISMISSED =
      _$gUserCalloutFeatureNameEnumWEB_IDE_ALERT_DISMISSED;

  static const GUserCalloutFeatureNameEnum ACTIVE_USER_COUNT_THRESHOLD =
      _$gUserCalloutFeatureNameEnumACTIVE_USER_COUNT_THRESHOLD;

  static const GUserCalloutFeatureNameEnum
      BUY_PIPELINE_MINUTES_NOTIFICATION_DOT =
      _$gUserCalloutFeatureNameEnumBUY_PIPELINE_MINUTES_NOTIFICATION_DOT;

  static const GUserCalloutFeatureNameEnum PERSONAL_ACCESS_TOKEN_EXPIRY =
      _$gUserCalloutFeatureNameEnumPERSONAL_ACCESS_TOKEN_EXPIRY;

  static const GUserCalloutFeatureNameEnum SUGGEST_PIPELINE =
      _$gUserCalloutFeatureNameEnumSUGGEST_PIPELINE;

  static const GUserCalloutFeatureNameEnum FEATURE_FLAGS_NEW_VERSION =
      _$gUserCalloutFeatureNameEnumFEATURE_FLAGS_NEW_VERSION;

  static const GUserCalloutFeatureNameEnum REGISTRATION_ENABLED_CALLOUT =
      _$gUserCalloutFeatureNameEnumREGISTRATION_ENABLED_CALLOUT;

  static const GUserCalloutFeatureNameEnum NEW_USER_SIGNUPS_CAP_REACHED =
      _$gUserCalloutFeatureNameEnumNEW_USER_SIGNUPS_CAP_REACHED;

  static const GUserCalloutFeatureNameEnum UNFINISHED_TAG_CLEANUP_CALLOUT =
      _$gUserCalloutFeatureNameEnumUNFINISHED_TAG_CLEANUP_CALLOUT;

  static const GUserCalloutFeatureNameEnum EOA_BRONZE_PLAN_BANNER =
      _$gUserCalloutFeatureNameEnumEOA_BRONZE_PLAN_BANNER;

  static const GUserCalloutFeatureNameEnum PIPELINE_NEEDS_BANNER =
      _$gUserCalloutFeatureNameEnumPIPELINE_NEEDS_BANNER;

  static const GUserCalloutFeatureNameEnum PIPELINE_NEEDS_HOVER_TIP =
      _$gUserCalloutFeatureNameEnumPIPELINE_NEEDS_HOVER_TIP;

  static const GUserCalloutFeatureNameEnum WEB_IDE_CI_ENVIRONMENTS_GUIDANCE =
      _$gUserCalloutFeatureNameEnumWEB_IDE_CI_ENVIRONMENTS_GUIDANCE;

  static const GUserCalloutFeatureNameEnum
      SECURITY_CONFIGURATION_UPGRADE_BANNER =
      _$gUserCalloutFeatureNameEnumSECURITY_CONFIGURATION_UPGRADE_BANNER;

  static const GUserCalloutFeatureNameEnum
      CLOUD_LICENSING_SUBSCRIPTION_ACTIVATION_BANNER =
      _$gUserCalloutFeatureNameEnumCLOUD_LICENSING_SUBSCRIPTION_ACTIVATION_BANNER;

  static const GUserCalloutFeatureNameEnum TRIAL_STATUS_REMINDER_D14 =
      _$gUserCalloutFeatureNameEnumTRIAL_STATUS_REMINDER_D14;

  static const GUserCalloutFeatureNameEnum TRIAL_STATUS_REMINDER_D3 =
      _$gUserCalloutFeatureNameEnumTRIAL_STATUS_REMINDER_D3;

  static const GUserCalloutFeatureNameEnum SECURITY_CONFIGURATION_DEVOPS_ALERT =
      _$gUserCalloutFeatureNameEnumSECURITY_CONFIGURATION_DEVOPS_ALERT;

  static const GUserCalloutFeatureNameEnum
      PROFILE_PERSONAL_ACCESS_TOKEN_EXPIRY =
      _$gUserCalloutFeatureNameEnumPROFILE_PERSONAL_ACCESS_TOKEN_EXPIRY;

  static const GUserCalloutFeatureNameEnum TERRAFORM_NOTIFICATION_DISMISSED =
      _$gUserCalloutFeatureNameEnumTERRAFORM_NOTIFICATION_DISMISSED;

  static const GUserCalloutFeatureNameEnum SECURITY_NEWSLETTER_CALLOUT =
      _$gUserCalloutFeatureNameEnumSECURITY_NEWSLETTER_CALLOUT;

  static const GUserCalloutFeatureNameEnum VERIFICATION_REMINDER =
      _$gUserCalloutFeatureNameEnumVERIFICATION_REMINDER;

  static const GUserCalloutFeatureNameEnum
      CI_DEPRECATION_WARNING_FOR_TYPES_KEYWORD =
      _$gUserCalloutFeatureNameEnumCI_DEPRECATION_WARNING_FOR_TYPES_KEYWORD;

  static const GUserCalloutFeatureNameEnum SECURITY_TRAINING_FEATURE_PROMOTION =
      _$gUserCalloutFeatureNameEnumSECURITY_TRAINING_FEATURE_PROMOTION;

  static const GUserCalloutFeatureNameEnum
      STORAGE_ENFORCEMENT_BANNER_FIRST_ENFORCEMENT_THRESHOLD =
      _$gUserCalloutFeatureNameEnumSTORAGE_ENFORCEMENT_BANNER_FIRST_ENFORCEMENT_THRESHOLD;

  static const GUserCalloutFeatureNameEnum
      STORAGE_ENFORCEMENT_BANNER_SECOND_ENFORCEMENT_THRESHOLD =
      _$gUserCalloutFeatureNameEnumSTORAGE_ENFORCEMENT_BANNER_SECOND_ENFORCEMENT_THRESHOLD;

  static const GUserCalloutFeatureNameEnum
      STORAGE_ENFORCEMENT_BANNER_THIRD_ENFORCEMENT_THRESHOLD =
      _$gUserCalloutFeatureNameEnumSTORAGE_ENFORCEMENT_BANNER_THIRD_ENFORCEMENT_THRESHOLD;

  static const GUserCalloutFeatureNameEnum
      STORAGE_ENFORCEMENT_BANNER_FOURTH_ENFORCEMENT_THRESHOLD =
      _$gUserCalloutFeatureNameEnumSTORAGE_ENFORCEMENT_BANNER_FOURTH_ENFORCEMENT_THRESHOLD;

  static const GUserCalloutFeatureNameEnum
      PREVIEW_USER_OVER_LIMIT_FREE_PLAN_ALERT =
      _$gUserCalloutFeatureNameEnumPREVIEW_USER_OVER_LIMIT_FREE_PLAN_ALERT;

  static const GUserCalloutFeatureNameEnum USER_REACHED_LIMIT_FREE_PLAN_ALERT =
      _$gUserCalloutFeatureNameEnumUSER_REACHED_LIMIT_FREE_PLAN_ALERT;

  static const GUserCalloutFeatureNameEnum SUBMIT_LICENSE_USAGE_DATA_BANNER =
      _$gUserCalloutFeatureNameEnumSUBMIT_LICENSE_USAGE_DATA_BANNER;

  static const GUserCalloutFeatureNameEnum PERSONAL_PROJECT_LIMITATIONS_BANNER =
      _$gUserCalloutFeatureNameEnumPERSONAL_PROJECT_LIMITATIONS_BANNER;

  static const GUserCalloutFeatureNameEnum MR_EXPERIENCE_SURVEY =
      _$gUserCalloutFeatureNameEnumMR_EXPERIENCE_SURVEY;

  static const GUserCalloutFeatureNameEnum
      NAMESPACE_STORAGE_LIMIT_BANNER_INFO_THRESHOLD =
      _$gUserCalloutFeatureNameEnumNAMESPACE_STORAGE_LIMIT_BANNER_INFO_THRESHOLD;

  static const GUserCalloutFeatureNameEnum
      NAMESPACE_STORAGE_LIMIT_BANNER_WARNING_THRESHOLD =
      _$gUserCalloutFeatureNameEnumNAMESPACE_STORAGE_LIMIT_BANNER_WARNING_THRESHOLD;

  static const GUserCalloutFeatureNameEnum
      NAMESPACE_STORAGE_LIMIT_BANNER_ALERT_THRESHOLD =
      _$gUserCalloutFeatureNameEnumNAMESPACE_STORAGE_LIMIT_BANNER_ALERT_THRESHOLD;

  static const GUserCalloutFeatureNameEnum
      NAMESPACE_STORAGE_LIMIT_BANNER_ERROR_THRESHOLD =
      _$gUserCalloutFeatureNameEnumNAMESPACE_STORAGE_LIMIT_BANNER_ERROR_THRESHOLD;

  static const GUserCalloutFeatureNameEnum PROJECT_QUALITY_SUMMARY_FEEDBACK =
      _$gUserCalloutFeatureNameEnumPROJECT_QUALITY_SUMMARY_FEEDBACK;

  static const GUserCalloutFeatureNameEnum
      MERGE_REQUEST_SETTINGS_MOVED_CALLOUT =
      _$gUserCalloutFeatureNameEnumMERGE_REQUEST_SETTINGS_MOVED_CALLOUT;

  static const GUserCalloutFeatureNameEnum NEW_TOP_LEVEL_GROUP_ALERT =
      _$gUserCalloutFeatureNameEnumNEW_TOP_LEVEL_GROUP_ALERT;

  static Serializer<GUserCalloutFeatureNameEnum> get serializer =>
      _$gUserCalloutFeatureNameEnumSerializer;
  static BuiltSet<GUserCalloutFeatureNameEnum> get values =>
      _$gUserCalloutFeatureNameEnumValues;
  static GUserCalloutFeatureNameEnum valueOf(String name) =>
      _$gUserCalloutFeatureNameEnumValueOf(name);
}

abstract class GUserID implements Built<GUserID, GUserIDBuilder> {
  GUserID._();

  factory GUserID([String? value]) =>
      _$GUserID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GUserID> get serializer =>
      _i2.DefaultScalarSerializer<GUserID>(
          (Object serialized) => GUserID((serialized as String?)));
}

abstract class GUserPreferencesUpdateInput
    implements
        Built<GUserPreferencesUpdateInput, GUserPreferencesUpdateInputBuilder> {
  GUserPreferencesUpdateInput._();

  factory GUserPreferencesUpdateInput(
          [Function(GUserPreferencesUpdateInputBuilder b) updates]) =
      _$GUserPreferencesUpdateInput;

  String? get clientMutationId;
  GIssueSort? get issuesSort;
  static Serializer<GUserPreferencesUpdateInput> get serializer =>
      _$gUserPreferencesUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserPreferencesUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GUserPreferencesUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserPreferencesUpdateInput.serializer,
        json,
      );
}

abstract class GUsersSavedReplyID
    implements Built<GUsersSavedReplyID, GUsersSavedReplyIDBuilder> {
  GUsersSavedReplyID._();

  factory GUsersSavedReplyID([String? value]) =>
      _$GUsersSavedReplyID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GUsersSavedReplyID> get serializer =>
      _i2.DefaultScalarSerializer<GUsersSavedReplyID>(
          (Object serialized) => GUsersSavedReplyID((serialized as String?)));
}

class GUserState extends EnumClass {
  const GUserState._(String name) : super(name);

  static const GUserState active = _$gUserStateactive;

  static const GUserState blocked = _$gUserStateblocked;

  static const GUserState deactivated = _$gUserStatedeactivated;

  static Serializer<GUserState> get serializer => _$gUserStateSerializer;
  static BuiltSet<GUserState> get values => _$gUserStateValues;
  static GUserState valueOf(String name) => _$gUserStateValueOf(name);
}

class GVerificationStateEnum extends EnumClass {
  const GVerificationStateEnum._(String name) : super(name);

  static const GVerificationStateEnum PENDING = _$gVerificationStateEnumPENDING;

  static const GVerificationStateEnum STARTED = _$gVerificationStateEnumSTARTED;

  static const GVerificationStateEnum SUCCEEDED =
      _$gVerificationStateEnumSUCCEEDED;

  static const GVerificationStateEnum FAILED = _$gVerificationStateEnumFAILED;

  static const GVerificationStateEnum DISABLED =
      _$gVerificationStateEnumDISABLED;

  static Serializer<GVerificationStateEnum> get serializer =>
      _$gVerificationStateEnumSerializer;
  static BuiltSet<GVerificationStateEnum> get values =>
      _$gVerificationStateEnumValues;
  static GVerificationStateEnum valueOf(String name) =>
      _$gVerificationStateEnumValueOf(name);
}

class GVisibilityLevelsEnum extends EnumClass {
  const GVisibilityLevelsEnum._(String name) : super(name);

  static const GVisibilityLevelsEnum private = _$gVisibilityLevelsEnumprivate;

  static const GVisibilityLevelsEnum internal = _$gVisibilityLevelsEnuminternal;

  static const GVisibilityLevelsEnum public = _$gVisibilityLevelsEnumpublic;

  static Serializer<GVisibilityLevelsEnum> get serializer =>
      _$gVisibilityLevelsEnumSerializer;
  static BuiltSet<GVisibilityLevelsEnum> get values =>
      _$gVisibilityLevelsEnumValues;
  static GVisibilityLevelsEnum valueOf(String name) =>
      _$gVisibilityLevelsEnumValueOf(name);
}

class GVisibilityScopesEnum extends EnumClass {
  const GVisibilityScopesEnum._(String name) : super(name);

  static const GVisibilityScopesEnum private = _$gVisibilityScopesEnumprivate;

  static const GVisibilityScopesEnum internal = _$gVisibilityScopesEnuminternal;

  static const GVisibilityScopesEnum public = _$gVisibilityScopesEnumpublic;

  static Serializer<GVisibilityScopesEnum> get serializer =>
      _$gVisibilityScopesEnumSerializer;
  static BuiltSet<GVisibilityScopesEnum> get values =>
      _$gVisibilityScopesEnumValues;
  static GVisibilityScopesEnum valueOf(String name) =>
      _$gVisibilityScopesEnumValueOf(name);
}

abstract class GVulnerabilitiesExternalIssueLinkID
    implements
        Built<GVulnerabilitiesExternalIssueLinkID,
            GVulnerabilitiesExternalIssueLinkIDBuilder> {
  GVulnerabilitiesExternalIssueLinkID._();

  factory GVulnerabilitiesExternalIssueLinkID([String? value]) =>
      _$GVulnerabilitiesExternalIssueLinkID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GVulnerabilitiesExternalIssueLinkID> get serializer =>
      _i2.DefaultScalarSerializer<GVulnerabilitiesExternalIssueLinkID>(
          (Object serialized) =>
              GVulnerabilitiesExternalIssueLinkID((serialized as String?)));
}

abstract class GVulnerabilitiesFindingID
    implements
        Built<GVulnerabilitiesFindingID, GVulnerabilitiesFindingIDBuilder> {
  GVulnerabilitiesFindingID._();

  factory GVulnerabilitiesFindingID([String? value]) =>
      _$GVulnerabilitiesFindingID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GVulnerabilitiesFindingID> get serializer =>
      _i2.DefaultScalarSerializer<GVulnerabilitiesFindingID>(
          (Object serialized) =>
              GVulnerabilitiesFindingID((serialized as String?)));
}

abstract class GVulnerabilitiesScannerID
    implements
        Built<GVulnerabilitiesScannerID, GVulnerabilitiesScannerIDBuilder> {
  GVulnerabilitiesScannerID._();

  factory GVulnerabilitiesScannerID([String? value]) =>
      _$GVulnerabilitiesScannerID(
          (b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GVulnerabilitiesScannerID> get serializer =>
      _i2.DefaultScalarSerializer<GVulnerabilitiesScannerID>(
          (Object serialized) =>
              GVulnerabilitiesScannerID((serialized as String?)));
}

class GVulnerabilityConfidence extends EnumClass {
  const GVulnerabilityConfidence._(String name) : super(name);

  static const GVulnerabilityConfidence IGNORE =
      _$gVulnerabilityConfidenceIGNORE;

  static const GVulnerabilityConfidence UNKNOWN =
      _$gVulnerabilityConfidenceUNKNOWN;

  static const GVulnerabilityConfidence EXPERIMENTAL =
      _$gVulnerabilityConfidenceEXPERIMENTAL;

  static const GVulnerabilityConfidence LOW = _$gVulnerabilityConfidenceLOW;

  static const GVulnerabilityConfidence MEDIUM =
      _$gVulnerabilityConfidenceMEDIUM;

  static const GVulnerabilityConfidence HIGH = _$gVulnerabilityConfidenceHIGH;

  static const GVulnerabilityConfidence CONFIRMED =
      _$gVulnerabilityConfidenceCONFIRMED;

  static Serializer<GVulnerabilityConfidence> get serializer =>
      _$gVulnerabilityConfidenceSerializer;
  static BuiltSet<GVulnerabilityConfidence> get values =>
      _$gVulnerabilityConfidenceValues;
  static GVulnerabilityConfidence valueOf(String name) =>
      _$gVulnerabilityConfidenceValueOf(name);
}

abstract class GVulnerabilityConfirmInput
    implements
        Built<GVulnerabilityConfirmInput, GVulnerabilityConfirmInputBuilder> {
  GVulnerabilityConfirmInput._();

  factory GVulnerabilityConfirmInput(
          [Function(GVulnerabilityConfirmInputBuilder b) updates]) =
      _$GVulnerabilityConfirmInput;

  String? get clientMutationId;
  GVulnerabilityID get id;
  static Serializer<GVulnerabilityConfirmInput> get serializer =>
      _$gVulnerabilityConfirmInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityConfirmInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityConfirmInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityConfirmInput.serializer,
        json,
      );
}

abstract class GVulnerabilityCreateInput
    implements
        Built<GVulnerabilityCreateInput, GVulnerabilityCreateInputBuilder> {
  GVulnerabilityCreateInput._();

  factory GVulnerabilityCreateInput(
          [Function(GVulnerabilityCreateInputBuilder b) updates]) =
      _$GVulnerabilityCreateInput;

  String? get clientMutationId;
  GProjectID get project;
  String get name;
  String get description;
  GVulnerabilityScannerInput get scanner;
  BuiltList<GVulnerabilityIdentifierInput> get identifiers;
  GVulnerabilityState? get state;
  GVulnerabilitySeverity? get severity;
  String? get solution;
  String? get message;
  GTime? get detectedAt;
  GTime? get confirmedAt;
  GTime? get resolvedAt;
  GTime? get dismissedAt;
  static Serializer<GVulnerabilityCreateInput> get serializer =>
      _$gVulnerabilityCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityCreateInput.serializer,
        json,
      );
}

class GVulnerabilityDismissalReason extends EnumClass {
  const GVulnerabilityDismissalReason._(String name) : super(name);

  static const GVulnerabilityDismissalReason ACCEPTABLE_RISK =
      _$gVulnerabilityDismissalReasonACCEPTABLE_RISK;

  static const GVulnerabilityDismissalReason true_POSITIVE =
      _$gVulnerabilityDismissalReasontrue_POSITIVE;

  static const GVulnerabilityDismissalReason MITIGATING_CONTROL =
      _$gVulnerabilityDismissalReasonMITIGATING_CONTROL;

  static const GVulnerabilityDismissalReason USED_IN_TESTS =
      _$gVulnerabilityDismissalReasonUSED_IN_TESTS;

  static const GVulnerabilityDismissalReason NOT_APPLICABLE =
      _$gVulnerabilityDismissalReasonNOT_APPLICABLE;

  static Serializer<GVulnerabilityDismissalReason> get serializer =>
      _$gVulnerabilityDismissalReasonSerializer;
  static BuiltSet<GVulnerabilityDismissalReason> get values =>
      _$gVulnerabilityDismissalReasonValues;
  static GVulnerabilityDismissalReason valueOf(String name) =>
      _$gVulnerabilityDismissalReasonValueOf(name);
}

abstract class GVulnerabilityDismissInput
    implements
        Built<GVulnerabilityDismissInput, GVulnerabilityDismissInputBuilder> {
  GVulnerabilityDismissInput._();

  factory GVulnerabilityDismissInput(
          [Function(GVulnerabilityDismissInputBuilder b) updates]) =
      _$GVulnerabilityDismissInput;

  String? get clientMutationId;
  GVulnerabilityID get id;
  String? get comment;
  GVulnerabilityDismissalReason? get dismissalReason;
  static Serializer<GVulnerabilityDismissInput> get serializer =>
      _$gVulnerabilityDismissInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityDismissInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityDismissInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityDismissInput.serializer,
        json,
      );
}

abstract class GVulnerabilityExternalIssueLinkCreateInput
    implements
        Built<GVulnerabilityExternalIssueLinkCreateInput,
            GVulnerabilityExternalIssueLinkCreateInputBuilder> {
  GVulnerabilityExternalIssueLinkCreateInput._();

  factory GVulnerabilityExternalIssueLinkCreateInput(
      [Function(GVulnerabilityExternalIssueLinkCreateInputBuilder b)
          updates]) = _$GVulnerabilityExternalIssueLinkCreateInput;

  String? get clientMutationId;
  GVulnerabilityID get id;
  GVulnerabilityExternalIssueLinkType get linkType;
  GVulnerabilityExternalIssueLinkExternalTracker get externalTracker;
  static Serializer<GVulnerabilityExternalIssueLinkCreateInput>
      get serializer => _$gVulnerabilityExternalIssueLinkCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityExternalIssueLinkCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityExternalIssueLinkCreateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityExternalIssueLinkCreateInput.serializer,
        json,
      );
}

abstract class GVulnerabilityExternalIssueLinkDestroyInput
    implements
        Built<GVulnerabilityExternalIssueLinkDestroyInput,
            GVulnerabilityExternalIssueLinkDestroyInputBuilder> {
  GVulnerabilityExternalIssueLinkDestroyInput._();

  factory GVulnerabilityExternalIssueLinkDestroyInput(
      [Function(GVulnerabilityExternalIssueLinkDestroyInputBuilder b)
          updates]) = _$GVulnerabilityExternalIssueLinkDestroyInput;

  String? get clientMutationId;
  GVulnerabilitiesExternalIssueLinkID get id;
  static Serializer<GVulnerabilityExternalIssueLinkDestroyInput>
      get serializer => _$gVulnerabilityExternalIssueLinkDestroyInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityExternalIssueLinkDestroyInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityExternalIssueLinkDestroyInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityExternalIssueLinkDestroyInput.serializer,
        json,
      );
}

class GVulnerabilityExternalIssueLinkExternalTracker extends EnumClass {
  const GVulnerabilityExternalIssueLinkExternalTracker._(String name)
      : super(name);

  static const GVulnerabilityExternalIssueLinkExternalTracker JIRA =
      _$gVulnerabilityExternalIssueLinkExternalTrackerJIRA;

  static Serializer<GVulnerabilityExternalIssueLinkExternalTracker>
      get serializer =>
          _$gVulnerabilityExternalIssueLinkExternalTrackerSerializer;
  static BuiltSet<GVulnerabilityExternalIssueLinkExternalTracker> get values =>
      _$gVulnerabilityExternalIssueLinkExternalTrackerValues;
  static GVulnerabilityExternalIssueLinkExternalTracker valueOf(String name) =>
      _$gVulnerabilityExternalIssueLinkExternalTrackerValueOf(name);
}

class GVulnerabilityExternalIssueLinkType extends EnumClass {
  const GVulnerabilityExternalIssueLinkType._(String name) : super(name);

  static const GVulnerabilityExternalIssueLinkType CREATED =
      _$gVulnerabilityExternalIssueLinkTypeCREATED;

  static Serializer<GVulnerabilityExternalIssueLinkType> get serializer =>
      _$gVulnerabilityExternalIssueLinkTypeSerializer;
  static BuiltSet<GVulnerabilityExternalIssueLinkType> get values =>
      _$gVulnerabilityExternalIssueLinkTypeValues;
  static GVulnerabilityExternalIssueLinkType valueOf(String name) =>
      _$gVulnerabilityExternalIssueLinkTypeValueOf(name);
}

abstract class GVulnerabilityFindingDismissInput
    implements
        Built<GVulnerabilityFindingDismissInput,
            GVulnerabilityFindingDismissInputBuilder> {
  GVulnerabilityFindingDismissInput._();

  factory GVulnerabilityFindingDismissInput(
          [Function(GVulnerabilityFindingDismissInputBuilder b) updates]) =
      _$GVulnerabilityFindingDismissInput;

  String? get clientMutationId;
  String? get uuid;
  String? get comment;
  GVulnerabilityDismissalReason? get dismissalReason;
  static Serializer<GVulnerabilityFindingDismissInput> get serializer =>
      _$gVulnerabilityFindingDismissInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityFindingDismissInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityFindingDismissInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityFindingDismissInput.serializer,
        json,
      );
}

class GVulnerabilityGrade extends EnumClass {
  const GVulnerabilityGrade._(String name) : super(name);

  static const GVulnerabilityGrade A = _$gVulnerabilityGradeA;

  static const GVulnerabilityGrade B = _$gVulnerabilityGradeB;

  static const GVulnerabilityGrade C = _$gVulnerabilityGradeC;

  static const GVulnerabilityGrade D = _$gVulnerabilityGradeD;

  static const GVulnerabilityGrade F = _$gVulnerabilityGradeF;

  static Serializer<GVulnerabilityGrade> get serializer =>
      _$gVulnerabilityGradeSerializer;
  static BuiltSet<GVulnerabilityGrade> get values =>
      _$gVulnerabilityGradeValues;
  static GVulnerabilityGrade valueOf(String name) =>
      _$gVulnerabilityGradeValueOf(name);
}

abstract class GVulnerabilityID
    implements Built<GVulnerabilityID, GVulnerabilityIDBuilder> {
  GVulnerabilityID._();

  factory GVulnerabilityID([String? value]) =>
      _$GVulnerabilityID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GVulnerabilityID> get serializer =>
      _i2.DefaultScalarSerializer<GVulnerabilityID>(
          (Object serialized) => GVulnerabilityID((serialized as String?)));
}

abstract class GVulnerabilityIdentifierInput
    implements
        Built<GVulnerabilityIdentifierInput,
            GVulnerabilityIdentifierInputBuilder> {
  GVulnerabilityIdentifierInput._();

  factory GVulnerabilityIdentifierInput(
          [Function(GVulnerabilityIdentifierInputBuilder b) updates]) =
      _$GVulnerabilityIdentifierInput;

  String get name;
  String get url;
  String? get externalType;
  String? get externalId;
  static Serializer<GVulnerabilityIdentifierInput> get serializer =>
      _$gVulnerabilityIdentifierInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityIdentifierInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityIdentifierInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityIdentifierInput.serializer,
        json,
      );
}

class GVulnerabilityIssueLinkType extends EnumClass {
  const GVulnerabilityIssueLinkType._(String name) : super(name);

  static const GVulnerabilityIssueLinkType RELATED =
      _$gVulnerabilityIssueLinkTypeRELATED;

  static const GVulnerabilityIssueLinkType CREATED =
      _$gVulnerabilityIssueLinkTypeCREATED;

  static Serializer<GVulnerabilityIssueLinkType> get serializer =>
      _$gVulnerabilityIssueLinkTypeSerializer;
  static BuiltSet<GVulnerabilityIssueLinkType> get values =>
      _$gVulnerabilityIssueLinkTypeValues;
  static GVulnerabilityIssueLinkType valueOf(String name) =>
      _$gVulnerabilityIssueLinkTypeValueOf(name);
}

class GVulnerabilityReportType extends EnumClass {
  const GVulnerabilityReportType._(String name) : super(name);

  static const GVulnerabilityReportType SAST = _$gVulnerabilityReportTypeSAST;

  static const GVulnerabilityReportType DEPENDENCY_SCANNING =
      _$gVulnerabilityReportTypeDEPENDENCY_SCANNING;

  static const GVulnerabilityReportType CONTAINER_SCANNING =
      _$gVulnerabilityReportTypeCONTAINER_SCANNING;

  static const GVulnerabilityReportType DAST = _$gVulnerabilityReportTypeDAST;

  static const GVulnerabilityReportType SECRET_DETECTION =
      _$gVulnerabilityReportTypeSECRET_DETECTION;

  static const GVulnerabilityReportType COVERAGE_FUZZING =
      _$gVulnerabilityReportTypeCOVERAGE_FUZZING;

  static const GVulnerabilityReportType API_FUZZING =
      _$gVulnerabilityReportTypeAPI_FUZZING;

  static const GVulnerabilityReportType CLUSTER_IMAGE_SCANNING =
      _$gVulnerabilityReportTypeCLUSTER_IMAGE_SCANNING;

  static const GVulnerabilityReportType GENERIC =
      _$gVulnerabilityReportTypeGENERIC;

  static Serializer<GVulnerabilityReportType> get serializer =>
      _$gVulnerabilityReportTypeSerializer;
  static BuiltSet<GVulnerabilityReportType> get values =>
      _$gVulnerabilityReportTypeValues;
  static GVulnerabilityReportType valueOf(String name) =>
      _$gVulnerabilityReportTypeValueOf(name);
}

abstract class GVulnerabilityResolveInput
    implements
        Built<GVulnerabilityResolveInput, GVulnerabilityResolveInputBuilder> {
  GVulnerabilityResolveInput._();

  factory GVulnerabilityResolveInput(
          [Function(GVulnerabilityResolveInputBuilder b) updates]) =
      _$GVulnerabilityResolveInput;

  String? get clientMutationId;
  GVulnerabilityID get id;
  static Serializer<GVulnerabilityResolveInput> get serializer =>
      _$gVulnerabilityResolveInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityResolveInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityResolveInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityResolveInput.serializer,
        json,
      );
}

abstract class GVulnerabilityRevertToDetectedInput
    implements
        Built<GVulnerabilityRevertToDetectedInput,
            GVulnerabilityRevertToDetectedInputBuilder> {
  GVulnerabilityRevertToDetectedInput._();

  factory GVulnerabilityRevertToDetectedInput(
          [Function(GVulnerabilityRevertToDetectedInputBuilder b) updates]) =
      _$GVulnerabilityRevertToDetectedInput;

  String? get clientMutationId;
  GVulnerabilityID get id;
  static Serializer<GVulnerabilityRevertToDetectedInput> get serializer =>
      _$gVulnerabilityRevertToDetectedInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityRevertToDetectedInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityRevertToDetectedInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityRevertToDetectedInput.serializer,
        json,
      );
}

abstract class GVulnerabilityScannerInput
    implements
        Built<GVulnerabilityScannerInput, GVulnerabilityScannerInputBuilder> {
  GVulnerabilityScannerInput._();

  factory GVulnerabilityScannerInput(
          [Function(GVulnerabilityScannerInputBuilder b) updates]) =
      _$GVulnerabilityScannerInput;

  String get id;
  String get name;
  String get url;
  GVulnerabilityScannerVendorInput? get vendor;
  String get version;
  static Serializer<GVulnerabilityScannerInput> get serializer =>
      _$gVulnerabilityScannerInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityScannerInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityScannerInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityScannerInput.serializer,
        json,
      );
}

abstract class GVulnerabilityScannerVendorInput
    implements
        Built<GVulnerabilityScannerVendorInput,
            GVulnerabilityScannerVendorInputBuilder> {
  GVulnerabilityScannerVendorInput._();

  factory GVulnerabilityScannerVendorInput(
          [Function(GVulnerabilityScannerVendorInputBuilder b) updates]) =
      _$GVulnerabilityScannerVendorInput;

  String get name;
  static Serializer<GVulnerabilityScannerVendorInput> get serializer =>
      _$gVulnerabilityScannerVendorInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GVulnerabilityScannerVendorInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GVulnerabilityScannerVendorInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GVulnerabilityScannerVendorInput.serializer,
        json,
      );
}

class GVulnerabilitySeverity extends EnumClass {
  const GVulnerabilitySeverity._(String name) : super(name);

  static const GVulnerabilitySeverity INFO = _$gVulnerabilitySeverityINFO;

  static const GVulnerabilitySeverity UNKNOWN = _$gVulnerabilitySeverityUNKNOWN;

  static const GVulnerabilitySeverity LOW = _$gVulnerabilitySeverityLOW;

  static const GVulnerabilitySeverity MEDIUM = _$gVulnerabilitySeverityMEDIUM;

  static const GVulnerabilitySeverity HIGH = _$gVulnerabilitySeverityHIGH;

  static const GVulnerabilitySeverity CRITICAL =
      _$gVulnerabilitySeverityCRITICAL;

  static Serializer<GVulnerabilitySeverity> get serializer =>
      _$gVulnerabilitySeveritySerializer;
  static BuiltSet<GVulnerabilitySeverity> get values =>
      _$gVulnerabilitySeverityValues;
  static GVulnerabilitySeverity valueOf(String name) =>
      _$gVulnerabilitySeverityValueOf(name);
}

class GVulnerabilitySort extends EnumClass {
  const GVulnerabilitySort._(String name) : super(name);

  static const GVulnerabilitySort severity_desc =
      _$gVulnerabilitySortseverity_desc;

  static const GVulnerabilitySort severity_asc =
      _$gVulnerabilitySortseverity_asc;

  static const GVulnerabilitySort detected_desc =
      _$gVulnerabilitySortdetected_desc;

  static const GVulnerabilitySort detected_asc =
      _$gVulnerabilitySortdetected_asc;

  static Serializer<GVulnerabilitySort> get serializer =>
      _$gVulnerabilitySortSerializer;
  static BuiltSet<GVulnerabilitySort> get values => _$gVulnerabilitySortValues;
  static GVulnerabilitySort valueOf(String name) =>
      _$gVulnerabilitySortValueOf(name);
}

class GVulnerabilityState extends EnumClass {
  const GVulnerabilityState._(String name) : super(name);

  static const GVulnerabilityState CONFIRMED = _$gVulnerabilityStateCONFIRMED;

  static const GVulnerabilityState DETECTED = _$gVulnerabilityStateDETECTED;

  static const GVulnerabilityState DISMISSED = _$gVulnerabilityStateDISMISSED;

  static const GVulnerabilityState RESOLVED = _$gVulnerabilityStateRESOLVED;

  static Serializer<GVulnerabilityState> get serializer =>
      _$gVulnerabilityStateSerializer;
  static BuiltSet<GVulnerabilityState> get values =>
      _$gVulnerabilityStateValues;
  static GVulnerabilityState valueOf(String name) =>
      _$gVulnerabilityStateValueOf(name);
}

class GWeightWildcardId extends EnumClass {
  const GWeightWildcardId._(String name) : super(name);

  static const GWeightWildcardId NONE = _$gWeightWildcardIdNONE;

  static const GWeightWildcardId ANY = _$gWeightWildcardIdANY;

  static Serializer<GWeightWildcardId> get serializer =>
      _$gWeightWildcardIdSerializer;
  static BuiltSet<GWeightWildcardId> get values => _$gWeightWildcardIdValues;
  static GWeightWildcardId valueOf(String name) =>
      _$gWeightWildcardIdValueOf(name);
}

abstract class GWorkItemConvertTaskInput
    implements
        Built<GWorkItemConvertTaskInput, GWorkItemConvertTaskInputBuilder> {
  GWorkItemConvertTaskInput._();

  factory GWorkItemConvertTaskInput(
          [Function(GWorkItemConvertTaskInputBuilder b) updates]) =
      _$GWorkItemConvertTaskInput;

  int get lineNumberEnd;
  int get lineNumberStart;
  int get lockVersion;
  String get title;
  GWorkItemsTypeID get workItemTypeId;
  static Serializer<GWorkItemConvertTaskInput> get serializer =>
      _$gWorkItemConvertTaskInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemConvertTaskInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemConvertTaskInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemConvertTaskInput.serializer,
        json,
      );
}

abstract class GWorkItemCreateFromTaskInput
    implements
        Built<GWorkItemCreateFromTaskInput,
            GWorkItemCreateFromTaskInputBuilder> {
  GWorkItemCreateFromTaskInput._();

  factory GWorkItemCreateFromTaskInput(
          [Function(GWorkItemCreateFromTaskInputBuilder b) updates]) =
      _$GWorkItemCreateFromTaskInput;

  String? get clientMutationId;
  GWorkItemID get id;
  GWorkItemConvertTaskInput get workItemData;
  static Serializer<GWorkItemCreateFromTaskInput> get serializer =>
      _$gWorkItemCreateFromTaskInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemCreateFromTaskInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemCreateFromTaskInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemCreateFromTaskInput.serializer,
        json,
      );
}

abstract class GWorkItemCreateInput
    implements Built<GWorkItemCreateInput, GWorkItemCreateInputBuilder> {
  GWorkItemCreateInput._();

  factory GWorkItemCreateInput(
          [Function(GWorkItemCreateInputBuilder b) updates]) =
      _$GWorkItemCreateInput;

  String? get clientMutationId;
  bool? get confidential;
  String? get description;
  GWorkItemWidgetHierarchyCreateInput? get hierarchyWidget;
  String get projectPath;
  String get title;
  GWorkItemsTypeID get workItemTypeId;
  static Serializer<GWorkItemCreateInput> get serializer =>
      _$gWorkItemCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemCreateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemCreateInput.serializer,
        json,
      );
}

abstract class GWorkItemDeletedTaskInput
    implements
        Built<GWorkItemDeletedTaskInput, GWorkItemDeletedTaskInputBuilder> {
  GWorkItemDeletedTaskInput._();

  factory GWorkItemDeletedTaskInput(
          [Function(GWorkItemDeletedTaskInputBuilder b) updates]) =
      _$GWorkItemDeletedTaskInput;

  GWorkItemID get id;
  int get lineNumberEnd;
  int get lineNumberStart;
  static Serializer<GWorkItemDeletedTaskInput> get serializer =>
      _$gWorkItemDeletedTaskInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemDeletedTaskInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemDeletedTaskInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemDeletedTaskInput.serializer,
        json,
      );
}

abstract class GWorkItemDeleteInput
    implements Built<GWorkItemDeleteInput, GWorkItemDeleteInputBuilder> {
  GWorkItemDeleteInput._();

  factory GWorkItemDeleteInput(
          [Function(GWorkItemDeleteInputBuilder b) updates]) =
      _$GWorkItemDeleteInput;

  String? get clientMutationId;
  GWorkItemID get id;
  static Serializer<GWorkItemDeleteInput> get serializer =>
      _$gWorkItemDeleteInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemDeleteInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemDeleteInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemDeleteInput.serializer,
        json,
      );
}

abstract class GWorkItemDeleteTaskInput
    implements
        Built<GWorkItemDeleteTaskInput, GWorkItemDeleteTaskInputBuilder> {
  GWorkItemDeleteTaskInput._();

  factory GWorkItemDeleteTaskInput(
          [Function(GWorkItemDeleteTaskInputBuilder b) updates]) =
      _$GWorkItemDeleteTaskInput;

  String? get clientMutationId;
  GWorkItemID get id;
  int get lockVersion;
  GWorkItemDeletedTaskInput get taskData;
  static Serializer<GWorkItemDeleteTaskInput> get serializer =>
      _$gWorkItemDeleteTaskInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemDeleteTaskInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemDeleteTaskInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemDeleteTaskInput.serializer,
        json,
      );
}

abstract class GWorkItemID implements Built<GWorkItemID, GWorkItemIDBuilder> {
  GWorkItemID._();

  factory GWorkItemID([String? value]) =>
      _$GWorkItemID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GWorkItemID> get serializer =>
      _i2.DefaultScalarSerializer<GWorkItemID>(
          (Object serialized) => GWorkItemID((serialized as String?)));
}

class GWorkItemSort extends EnumClass {
  const GWorkItemSort._(String name) : super(name);

  static const GWorkItemSort TITLE_ASC = _$gWorkItemSortTITLE_ASC;

  static const GWorkItemSort TITLE_DESC = _$gWorkItemSortTITLE_DESC;

  static const GWorkItemSort updated_desc = _$gWorkItemSortupdated_desc;

  static const GWorkItemSort updated_asc = _$gWorkItemSortupdated_asc;

  static const GWorkItemSort created_desc = _$gWorkItemSortcreated_desc;

  static const GWorkItemSort created_asc = _$gWorkItemSortcreated_asc;

  static const GWorkItemSort UPDATED_DESC = _$gWorkItemSortUPDATED_DESC;

  static const GWorkItemSort UPDATED_ASC = _$gWorkItemSortUPDATED_ASC;

  static const GWorkItemSort CREATED_DESC = _$gWorkItemSortCREATED_DESC;

  static const GWorkItemSort CREATED_ASC = _$gWorkItemSortCREATED_ASC;

  static Serializer<GWorkItemSort> get serializer => _$gWorkItemSortSerializer;
  static BuiltSet<GWorkItemSort> get values => _$gWorkItemSortValues;
  static GWorkItemSort valueOf(String name) => _$gWorkItemSortValueOf(name);
}

class GWorkItemState extends EnumClass {
  const GWorkItemState._(String name) : super(name);

  static const GWorkItemState OPEN = _$gWorkItemStateOPEN;

  static const GWorkItemState CLOSED = _$gWorkItemStateCLOSED;

  static Serializer<GWorkItemState> get serializer =>
      _$gWorkItemStateSerializer;
  static BuiltSet<GWorkItemState> get values => _$gWorkItemStateValues;
  static GWorkItemState valueOf(String name) => _$gWorkItemStateValueOf(name);
}

class GWorkItemStateEvent extends EnumClass {
  const GWorkItemStateEvent._(String name) : super(name);

  static const GWorkItemStateEvent REOPEN = _$gWorkItemStateEventREOPEN;

  static const GWorkItemStateEvent CLOSE = _$gWorkItemStateEventCLOSE;

  static Serializer<GWorkItemStateEvent> get serializer =>
      _$gWorkItemStateEventSerializer;
  static BuiltSet<GWorkItemStateEvent> get values =>
      _$gWorkItemStateEventValues;
  static GWorkItemStateEvent valueOf(String name) =>
      _$gWorkItemStateEventValueOf(name);
}

abstract class GWorkItemsTypeID
    implements Built<GWorkItemsTypeID, GWorkItemsTypeIDBuilder> {
  GWorkItemsTypeID._();

  factory GWorkItemsTypeID([String? value]) =>
      _$GWorkItemsTypeID((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GWorkItemsTypeID> get serializer =>
      _i2.DefaultScalarSerializer<GWorkItemsTypeID>(
          (Object serialized) => GWorkItemsTypeID((serialized as String?)));
}

abstract class GWorkItemUpdatedTaskInput
    implements
        Built<GWorkItemUpdatedTaskInput, GWorkItemUpdatedTaskInputBuilder> {
  GWorkItemUpdatedTaskInput._();

  factory GWorkItemUpdatedTaskInput(
          [Function(GWorkItemUpdatedTaskInputBuilder b) updates]) =
      _$GWorkItemUpdatedTaskInput;

  GWorkItemID get id;
  GWorkItemStateEvent? get stateEvent;
  String? get title;
  bool? get confidential;
  GWorkItemWidgetDescriptionInput? get descriptionWidget;
  GWorkItemWidgetAssigneesInput? get assigneesWidget;
  GWorkItemWidgetHierarchyUpdateInput? get hierarchyWidget;
  GWorkItemWidgetStartAndDueDateUpdateInput? get startAndDueDateWidget;
  static Serializer<GWorkItemUpdatedTaskInput> get serializer =>
      _$gWorkItemUpdatedTaskInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemUpdatedTaskInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemUpdatedTaskInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemUpdatedTaskInput.serializer,
        json,
      );
}

abstract class GWorkItemUpdateInput
    implements Built<GWorkItemUpdateInput, GWorkItemUpdateInputBuilder> {
  GWorkItemUpdateInput._();

  factory GWorkItemUpdateInput(
          [Function(GWorkItemUpdateInputBuilder b) updates]) =
      _$GWorkItemUpdateInput;

  String? get clientMutationId;
  GWorkItemID get id;
  GWorkItemStateEvent? get stateEvent;
  String? get title;
  bool? get confidential;
  GWorkItemWidgetDescriptionInput? get descriptionWidget;
  GWorkItemWidgetAssigneesInput? get assigneesWidget;
  GWorkItemWidgetHierarchyUpdateInput? get hierarchyWidget;
  GWorkItemWidgetStartAndDueDateUpdateInput? get startAndDueDateWidget;
  GWorkItemWidgetIterationInput? get iterationWidget;
  GWorkItemWidgetWeightInput? get weightWidget;
  static Serializer<GWorkItemUpdateInput> get serializer =>
      _$gWorkItemUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemUpdateInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemUpdateInput.serializer,
        json,
      );
}

abstract class GWorkItemUpdateTaskInput
    implements
        Built<GWorkItemUpdateTaskInput, GWorkItemUpdateTaskInputBuilder> {
  GWorkItemUpdateTaskInput._();

  factory GWorkItemUpdateTaskInput(
          [Function(GWorkItemUpdateTaskInputBuilder b) updates]) =
      _$GWorkItemUpdateTaskInput;

  String? get clientMutationId;
  GWorkItemID get id;
  GWorkItemUpdatedTaskInput get taskData;
  static Serializer<GWorkItemUpdateTaskInput> get serializer =>
      _$gWorkItemUpdateTaskInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemUpdateTaskInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemUpdateTaskInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemUpdateTaskInput.serializer,
        json,
      );
}

abstract class GWorkItemWidgetAssigneesInput
    implements
        Built<GWorkItemWidgetAssigneesInput,
            GWorkItemWidgetAssigneesInputBuilder> {
  GWorkItemWidgetAssigneesInput._();

  factory GWorkItemWidgetAssigneesInput(
          [Function(GWorkItemWidgetAssigneesInputBuilder b) updates]) =
      _$GWorkItemWidgetAssigneesInput;

  BuiltList<GUserID> get assigneeIds;
  static Serializer<GWorkItemWidgetAssigneesInput> get serializer =>
      _$gWorkItemWidgetAssigneesInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemWidgetAssigneesInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemWidgetAssigneesInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemWidgetAssigneesInput.serializer,
        json,
      );
}

abstract class GWorkItemWidgetDescriptionInput
    implements
        Built<GWorkItemWidgetDescriptionInput,
            GWorkItemWidgetDescriptionInputBuilder> {
  GWorkItemWidgetDescriptionInput._();

  factory GWorkItemWidgetDescriptionInput(
          [Function(GWorkItemWidgetDescriptionInputBuilder b) updates]) =
      _$GWorkItemWidgetDescriptionInput;

  String get description;
  static Serializer<GWorkItemWidgetDescriptionInput> get serializer =>
      _$gWorkItemWidgetDescriptionInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemWidgetDescriptionInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemWidgetDescriptionInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemWidgetDescriptionInput.serializer,
        json,
      );
}

abstract class GWorkItemWidgetHierarchyCreateInput
    implements
        Built<GWorkItemWidgetHierarchyCreateInput,
            GWorkItemWidgetHierarchyCreateInputBuilder> {
  GWorkItemWidgetHierarchyCreateInput._();

  factory GWorkItemWidgetHierarchyCreateInput(
          [Function(GWorkItemWidgetHierarchyCreateInputBuilder b) updates]) =
      _$GWorkItemWidgetHierarchyCreateInput;

  GWorkItemID? get parentId;
  static Serializer<GWorkItemWidgetHierarchyCreateInput> get serializer =>
      _$gWorkItemWidgetHierarchyCreateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemWidgetHierarchyCreateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemWidgetHierarchyCreateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemWidgetHierarchyCreateInput.serializer,
        json,
      );
}

abstract class GWorkItemWidgetHierarchyUpdateInput
    implements
        Built<GWorkItemWidgetHierarchyUpdateInput,
            GWorkItemWidgetHierarchyUpdateInputBuilder> {
  GWorkItemWidgetHierarchyUpdateInput._();

  factory GWorkItemWidgetHierarchyUpdateInput(
          [Function(GWorkItemWidgetHierarchyUpdateInputBuilder b) updates]) =
      _$GWorkItemWidgetHierarchyUpdateInput;

  GWorkItemID? get parentId;
  BuiltList<GWorkItemID>? get childrenIds;
  static Serializer<GWorkItemWidgetHierarchyUpdateInput> get serializer =>
      _$gWorkItemWidgetHierarchyUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemWidgetHierarchyUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemWidgetHierarchyUpdateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemWidgetHierarchyUpdateInput.serializer,
        json,
      );
}

abstract class GWorkItemWidgetIterationInput
    implements
        Built<GWorkItemWidgetIterationInput,
            GWorkItemWidgetIterationInputBuilder> {
  GWorkItemWidgetIterationInput._();

  factory GWorkItemWidgetIterationInput(
          [Function(GWorkItemWidgetIterationInputBuilder b) updates]) =
      _$GWorkItemWidgetIterationInput;

  GIterationID? get iterationId;
  static Serializer<GWorkItemWidgetIterationInput> get serializer =>
      _$gWorkItemWidgetIterationInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemWidgetIterationInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemWidgetIterationInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemWidgetIterationInput.serializer,
        json,
      );
}

abstract class GWorkItemWidgetStartAndDueDateUpdateInput
    implements
        Built<GWorkItemWidgetStartAndDueDateUpdateInput,
            GWorkItemWidgetStartAndDueDateUpdateInputBuilder> {
  GWorkItemWidgetStartAndDueDateUpdateInput._();

  factory GWorkItemWidgetStartAndDueDateUpdateInput(
      [Function(GWorkItemWidgetStartAndDueDateUpdateInputBuilder b)
          updates]) = _$GWorkItemWidgetStartAndDueDateUpdateInput;

  GDate? get dueDate;
  GDate? get startDate;
  static Serializer<GWorkItemWidgetStartAndDueDateUpdateInput> get serializer =>
      _$gWorkItemWidgetStartAndDueDateUpdateInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemWidgetStartAndDueDateUpdateInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemWidgetStartAndDueDateUpdateInput? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemWidgetStartAndDueDateUpdateInput.serializer,
        json,
      );
}

class GWorkItemWidgetType extends EnumClass {
  const GWorkItemWidgetType._(String name) : super(name);

  static const GWorkItemWidgetType ITERATION = _$gWorkItemWidgetTypeITERATION;

  static const GWorkItemWidgetType WEIGHT = _$gWorkItemWidgetTypeWEIGHT;

  static const GWorkItemWidgetType STATUS = _$gWorkItemWidgetTypeSTATUS;

  static const GWorkItemWidgetType ASSIGNEES = _$gWorkItemWidgetTypeASSIGNEES;

  static const GWorkItemWidgetType LABELS = _$gWorkItemWidgetTypeLABELS;

  static const GWorkItemWidgetType DESCRIPTION =
      _$gWorkItemWidgetTypeDESCRIPTION;

  static const GWorkItemWidgetType HIERARCHY = _$gWorkItemWidgetTypeHIERARCHY;

  static const GWorkItemWidgetType START_AND_DUE_DATE =
      _$gWorkItemWidgetTypeSTART_AND_DUE_DATE;

  static Serializer<GWorkItemWidgetType> get serializer =>
      _$gWorkItemWidgetTypeSerializer;
  static BuiltSet<GWorkItemWidgetType> get values =>
      _$gWorkItemWidgetTypeValues;
  static GWorkItemWidgetType valueOf(String name) =>
      _$gWorkItemWidgetTypeValueOf(name);
}

abstract class GWorkItemWidgetWeightInput
    implements
        Built<GWorkItemWidgetWeightInput, GWorkItemWidgetWeightInputBuilder> {
  GWorkItemWidgetWeightInput._();

  factory GWorkItemWidgetWeightInput(
          [Function(GWorkItemWidgetWeightInputBuilder b) updates]) =
      _$GWorkItemWidgetWeightInput;

  int? get weight;
  static Serializer<GWorkItemWidgetWeightInput> get serializer =>
      _$gWorkItemWidgetWeightInputSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GWorkItemWidgetWeightInput.serializer,
        this,
      ) as Map<String, dynamic>);
  static GWorkItemWidgetWeightInput? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GWorkItemWidgetWeightInput.serializer,
        json,
      );
}

const possibleTypesMap = {
  'NoteableInterface': {
    'AlertManagementAlert',
    'BoardEpic',
    'Design',
    'Epic',
    'EpicIssue',
    'Issue',
    'MergeRequest',
    'Snippet',
    'Vulnerability',
  },
  'Todoable': {
    'AlertManagementAlert',
    'BoardEpic',
    'Commit',
    'Design',
    'Epic',
    'EpicIssue',
    'Issue',
    'MergeRequest',
    'WorkItem',
  },
  'AlertManagementIntegration': {
    'AlertManagementHttpIntegration',
    'AlertManagementPrometheusIntegration',
  },
  'Service': {
    'BaseService',
    'JiraService',
  },
  'Entry': {
    'Blob',
    'Submodule',
    'TreeEntry',
  },
  'CurrentUserTodos': {
    'BoardEpic',
    'Design',
    'Epic',
    'EpicIssue',
    'Issue',
    'MergeRequest',
  },
  'Eventable': {
    'BoardEpic',
    'Epic',
  },
  'CiVariable': {
    'CiGroupVariable',
    'CiInstanceVariable',
    'CiManualVariable',
    'CiProjectVariable',
  },
  'PackageFileMetadata': {
    'ConanFileMetadata',
    'HelmFileMetadata',
  },
  'DependencyLinkMetadata': {'NugetDependencyLinkMetadata'},
  'DesignFields': {
    'Design',
    'DesignAtVersion',
  },
  'ResolvableInterface': {
    'Discussion',
    'Note',
  },
  'MemberInterface': {
    'GroupMember',
    'ProjectMember',
  },
  'Issuable': {
    'Epic',
    'Issue',
    'MergeRequest',
    'WorkItem',
  },
  'TimeboxReportInterface': {
    'Iteration',
    'Milestone',
  },
  'JobNeedUnion': {
    'CiBuildNeed',
    'CiJob',
  },
  'User': {
    'MergeRequestAssignee',
    'MergeRequestAuthor',
    'MergeRequestParticipant',
    'MergeRequestReviewer',
    'UserCore',
  },
  'NoteableType': {
    'Design',
    'Issue',
    'MergeRequest',
  },
  'PackageMetadata': {
    'ComposerMetadata',
    'ConanMetadata',
    'MavenMetadata',
    'NugetMetadata',
    'PypiMetadata',
  },
  'OrchestrationPolicy': {
    'ScanExecutionPolicy',
    'ScanResultPolicy',
  },
  'SecurityPolicySource': {
    'GroupSecurityPolicySource',
    'ProjectSecurityPolicySource',
  },
  'VulnerabilityDetail': {
    'VulnerabilityDetailBase',
    'VulnerabilityDetailBoolean',
    'VulnerabilityDetailCode',
    'VulnerabilityDetailCommit',
    'VulnerabilityDetailDiff',
    'VulnerabilityDetailFileLocation',
    'VulnerabilityDetailInt',
    'VulnerabilityDetailList',
    'VulnerabilityDetailMarkdown',
    'VulnerabilityDetailModuleLocation',
    'VulnerabilityDetailTable',
    'VulnerabilityDetailText',
    'VulnerabilityDetailUrl',
  },
  'VulnerabilityLocation': {
    'VulnerabilityLocationClusterImageScanning',
    'VulnerabilityLocationContainerScanning',
    'VulnerabilityLocationCoverageFuzzing',
    'VulnerabilityLocationDast',
    'VulnerabilityLocationDependencyScanning',
    'VulnerabilityLocationGeneric',
    'VulnerabilityLocationSast',
    'VulnerabilityLocationSecretDetection',
  },
  'WorkItemWidget': {
    'WorkItemWidgetAssignees',
    'WorkItemWidgetDescription',
    'WorkItemWidgetHierarchy',
    'WorkItemWidgetIteration',
    'WorkItemWidgetLabels',
    'WorkItemWidgetStartAndDueDate',
    'WorkItemWidgetStatus',
    'WorkItemWidgetWeight',
  },
};
