// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const Issues = _i1.OperationDefinitionNode(
  type: _i1.OperationType.query,
  name: _i1.NameNode(value: 'Issues'),
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
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'cursor')),
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
          name: _i1.NameNode(value: 'issues'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'states'),
              value: _i1.EnumValueNode(name: _i1.NameNode(value: 'OPEN')),
            ),
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'orderBy'),
              value: _i1.ObjectValueNode(fields: [
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'field'),
                  value: _i1.EnumValueNode(
                      name: _i1.NameNode(value: 'CREATED_AT')),
                ),
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'direction'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'DESC')),
                ),
              ]),
            ),
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'first'),
              value: _i1.IntValueNode(value: '30'),
            ),
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'after'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'cursor')),
            ),
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'pageInfo'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'hasNextPage'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'endCursor'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ]),
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'nodes'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'number'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'updatedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'author'),
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
                  name: _i1.NameNode(value: 'labels'),
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
                    )
                  ]),
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'comments'),
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
            ),
          ]),
        )
      ]),
    )
  ]),
);
const Pulls = _i1.OperationDefinitionNode(
  type: _i1.OperationType.query,
  name: _i1.NameNode(value: 'Pulls'),
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
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'cursor')),
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
          name: _i1.NameNode(value: 'pullRequests'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'states'),
              value: _i1.EnumValueNode(name: _i1.NameNode(value: 'OPEN')),
            ),
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'orderBy'),
              value: _i1.ObjectValueNode(fields: [
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'field'),
                  value: _i1.EnumValueNode(
                      name: _i1.NameNode(value: 'CREATED_AT')),
                ),
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'direction'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'DESC')),
                ),
              ]),
            ),
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'first'),
              value: _i1.IntValueNode(value: '30'),
            ),
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'after'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'cursor')),
            ),
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'pageInfo'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'hasNextPage'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'endCursor'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ]),
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'nodes'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'number'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'updatedAt'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'author'),
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
                  name: _i1.NameNode(value: 'labels'),
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
                    )
                  ]),
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'comments'),
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
            ),
          ]),
        )
      ]),
    )
  ]),
);
const document = _i1.DocumentNode(definitions: [
  Issues,
  Pulls,
]);
