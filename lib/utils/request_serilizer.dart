import "package:gql_exec/gql_exec.dart";
import "package:gql/language.dart";
import 'package:gql_link/gql_link.dart';

class GithubRequestSerializer extends RequestSerializer {
  const GithubRequestSerializer();

  @override
  Map<String, dynamic> serializeRequest(Request request) {
    final RequestExtensionsThunk thunk = request.context.entry();

    return <String, dynamic>{
      // Remove operationName here for GitHub API compatibility
      // "operationName": request.operation.operationName,
      "variables": request.variables,
      "query": printNode(request.operation.document),
      if (thunk != null) "extensions": thunk.getRequestExtensions(request),
    };
  }
}
