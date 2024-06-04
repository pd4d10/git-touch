// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const CommitParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'CommitParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'Commit'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'history'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'totalCount'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        )
      ]),
    )
  ]),
);
const RefParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'RefParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'Ref'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'target'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Commit'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FragmentSpreadNode(
              name: _i1.NameNode(value: 'CommitParts'),
              directives: [],
            )
          ]),
        )
      ]),
    ),
  ]),
);
const Repo = _i1.OperationDefinitionNode(
  type: _i1.OperationType.query,
  name: _i1.NameNode(value: 'Repo'),
  variableDefinitions: [
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'owner')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'name')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'branchSpecified')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'branch')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
  ],
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'repository'),
      alias: null,
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'owner'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'owner')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'name'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'name')),
        ),
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'owner'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'avatarUrl'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'name'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'description'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'homepageUrl'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'isPrivate'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'isFork'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'url'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'viewerHasStarred'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'viewerSubscription'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'repositoryTopics'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'first'),
              value: _i1.IntValueNode(value: '10'),
            )
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'nodes'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'url'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'topic'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: _i1.SelectionSetNode(selections: [
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'name'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    )
                  ]),
                ),
              ]),
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'watchers'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'stargazers'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'forks'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'languages'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'first'),
              value: _i1.IntValueNode(value: '10'),
            ),
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'orderBy'),
              value: _i1.ObjectValueNode(fields: [
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'field'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'SIZE')),
                ),
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'direction'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'DESC')),
                ),
              ]),
            ),
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalSize'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'edges'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'size'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'node'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: _i1.SelectionSetNode(selections: [
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'name'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'color'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                  ]),
                ),
              ]),
            ),
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'primaryLanguage'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'licenseInfo'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'spdxId'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'diskUsage'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'hasIssuesEnabled'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'issues'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'issues'),
          alias: _i1.NameNode(value: 'issuesOpen'),
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'states'),
              value: _i1.EnumValueNode(name: _i1.NameNode(value: 'OPEN')),
            )
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'pullRequests'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'pullRequests'),
          alias: _i1.NameNode(value: 'pullRequestsOpen'),
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'states'),
              value: _i1.EnumValueNode(name: _i1.NameNode(value: 'OPEN')),
            )
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'discussions'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'hasProjectsEnabled'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'projectsUrl'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'projects'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'defaultBranchRef'),
          alias: null,
          arguments: [],
          directives: [
            _i1.DirectiveNode(
              name: _i1.NameNode(value: 'skip'),
              arguments: [
                _i1.ArgumentNode(
                  name: _i1.NameNode(value: 'if'),
                  value: _i1.VariableNode(
                      name: _i1.NameNode(value: 'branchSpecified')),
                )
              ],
            )
          ],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FragmentSpreadNode(
              name: _i1.NameNode(value: 'RefParts'),
              directives: [],
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'ref'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'qualifiedName'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'branch')),
            )
          ],
          directives: [
            _i1.DirectiveNode(
              name: _i1.NameNode(value: 'include'),
              arguments: [
                _i1.ArgumentNode(
                  name: _i1.NameNode(value: 'if'),
                  value: _i1.VariableNode(
                      name: _i1.NameNode(value: 'branchSpecified')),
                )
              ],
            )
          ],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FragmentSpreadNode(
              name: _i1.NameNode(value: 'RefParts'),
              directives: [],
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'refs'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'first'),
              value: _i1.IntValueNode(value: '100'),
            ),
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'refPrefix'),
              value: _i1.StringValueNode(
                value: 'refs/heads/',
                isBlock: true,
              ),
            ),
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'nodes'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                )
              ]),
            ),
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'releases'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'totalCount'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
      ]),
    )
  ]),
);
const document = _i1.DocumentNode(definitions: [
  CommitParts,
  RefParts,
  Repo,
]);
