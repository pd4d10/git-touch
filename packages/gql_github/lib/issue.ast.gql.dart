// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const CommentParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'CommentParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'Comment'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'id'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'body'),
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
  ]),
);
const ReactionConnectionParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'ReactionConnectionParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'ReactionConnection'),
    isNonNull: true,
  )),
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
      name: _i1.NameNode(value: 'viewerHasReacted'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const ReactableParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'ReactableParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'Reactable'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'reactions'),
      alias: _i1.NameNode(value: 'THUMBS_UP'),
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'content'),
          value: _i1.EnumValueNode(name: _i1.NameNode(value: 'THUMBS_UP')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'ReactionConnectionParts'),
          directives: [],
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'reactions'),
      alias: _i1.NameNode(value: 'THUMBS_DOWN'),
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'content'),
          value: _i1.EnumValueNode(name: _i1.NameNode(value: 'THUMBS_DOWN')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'ReactionConnectionParts'),
          directives: [],
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'reactions'),
      alias: _i1.NameNode(value: 'LAUGH'),
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'content'),
          value: _i1.EnumValueNode(name: _i1.NameNode(value: 'LAUGH')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'ReactionConnectionParts'),
          directives: [],
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'reactions'),
      alias: _i1.NameNode(value: 'HOORAY'),
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'content'),
          value: _i1.EnumValueNode(name: _i1.NameNode(value: 'HOORAY')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'ReactionConnectionParts'),
          directives: [],
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'reactions'),
      alias: _i1.NameNode(value: 'CONFUSED'),
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'content'),
          value: _i1.EnumValueNode(name: _i1.NameNode(value: 'CONFUSED')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'ReactionConnectionParts'),
          directives: [],
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'reactions'),
      alias: _i1.NameNode(value: 'HEART'),
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'content'),
          value: _i1.EnumValueNode(name: _i1.NameNode(value: 'HEART')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'ReactionConnectionParts'),
          directives: [],
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'reactions'),
      alias: _i1.NameNode(value: 'ROCKET'),
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'content'),
          value: _i1.EnumValueNode(name: _i1.NameNode(value: 'ROCKET')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'ReactionConnectionParts'),
          directives: [],
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'reactions'),
      alias: _i1.NameNode(value: 'EYES'),
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'content'),
          value: _i1.EnumValueNode(name: _i1.NameNode(value: 'EYES')),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'ReactionConnectionParts'),
          directives: [],
        )
      ]),
    ),
  ]),
);
const ReferencedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'ReferencedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'ReferencedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'isCrossRepository'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'commit'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'oid'),
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
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'commitRepository'),
      alias: null,
      arguments: [],
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
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'name'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
  ]),
);
const RenamedTitleEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'RenamedTitleEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'RenamedTitleEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'previousTitle'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'currentTitle'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
  ]),
);
const ClosedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'ClosedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'ClosedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
  ]),
);
const ReopenedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'ReopenedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'ReopenedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
  ]),
);
const CrossReferencedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'CrossReferencedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'CrossReferencedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'source'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Issue'),
            isNonNull: true,
          )),
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
              name: _i1.NameNode(value: 'repository'),
              alias: null,
              arguments: [],
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
                    )
                  ]),
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ]),
            ),
          ]),
        ),
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'PullRequest'),
            isNonNull: true,
          )),
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
              name: _i1.NameNode(value: 'repository'),
              alias: null,
              arguments: [],
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
                    )
                  ]),
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'name'),
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
  ]),
);
const LabeledEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'LabeledEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'LabeledEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'label'),
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
);
const UnlabeledEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'UnlabeledEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'UnlabeledEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'label'),
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
);
const MilestonedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'MilestonedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'MilestonedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'milestoneTitle'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const DemilestonedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'DemilestonedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'DemilestonedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'milestoneTitle'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const LockedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'LockedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'LockedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'lockReason'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const UnlockedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'UnlockedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'UnlockedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
  ]),
);
const AssignedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'AssignedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'AssignedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'assignee'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'User'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Bot'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Organization'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Mannequin'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
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
);
const UnassignedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'UnassignedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'UnassignedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'assignee'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'User'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Bot'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Organization'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Mannequin'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
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
);
const SubscribedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'SubscribedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'SubscribedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
  ]),
);
const UnsubscribedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'UnsubscribedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'UnsubscribedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
  ]),
);
const MentionedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'MentionedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'MentionedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
  ]),
);
const PinnedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'PinnedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'PinnedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
  ]),
);
const TransferredEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'TransferredEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'TransferredEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'fromRepository'),
      alias: null,
      arguments: [],
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
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'name'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
  ]),
);
const PullRequestCommitParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'PullRequestCommitParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'PullRequestCommit'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'commit'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'committedDate'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'oid'),
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
              name: _i1.NameNode(value: 'user'),
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
                )
              ]),
            )
          ]),
        ),
      ]),
    )
  ]),
);
const DeployedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'DeployedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'DeployedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'pullRequest'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'headRef'),
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
        )
      ]),
    ),
  ]),
);
const DeploymentEnvironmentChangedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'DeploymentEnvironmentChangedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'DeploymentEnvironmentChangedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'deploymentStatus'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'deployment'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'environment'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'description'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
      ]),
    ),
  ]),
);
const HeadRefRestoredEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'HeadRefRestoredEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'HeadRefRestoredEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'pullRequest'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'headRefName'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        )
      ]),
    ),
  ]),
);
const BaseRefForcePushedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'BaseRefForcePushedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'BaseRefForcePushedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'pullRequest'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'baseRef'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'beforeCommit'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'oid'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'afterCommit'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'oid'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        )
      ]),
    ),
  ]),
);
const HeadRefForcePushedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'HeadRefForcePushedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'HeadRefForcePushedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'pullRequest'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'headRefName'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'beforeCommit'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'oid'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'afterCommit'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'oid'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        )
      ]),
    ),
  ]),
);
const ReviewRequestedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'ReviewRequestedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'ReviewRequestedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'requestedReviewer'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'User'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        )
      ]),
    ),
  ]),
);
const ReviewRequestRemovedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'ReviewRequestRemovedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'ReviewRequestRemovedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'requestedReviewer'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.InlineFragmentNode(
          typeCondition: _i1.TypeConditionNode(
              on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'User'),
            isNonNull: true,
          )),
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'login'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        )
      ]),
    ),
  ]),
);
const ReviewDismissedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'ReviewDismissedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'ReviewDismissedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'dismissalMessage'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'pullRequest'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
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
            )
          ]),
        )
      ]),
    ),
  ]),
);
const PullRequestReviewParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'PullRequestReviewParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'PullRequestReview'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'state'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'comments'),
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
            _i1.FragmentSpreadNode(
              name: _i1.NameNode(value: 'CommentParts'),
              directives: [],
            ),
            _i1.FragmentSpreadNode(
              name: _i1.NameNode(value: 'ReactableParts'),
              directives: [],
            ),
          ]),
        )
      ]),
    ),
  ]),
);
const MergedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'MergedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'MergedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'mergeRefName'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'commit'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'oid'),
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
      ]),
    ),
  ]),
);
const HeadRefDeletedEventParts = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'HeadRefDeletedEventParts'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'HeadRefDeletedEvent'),
    isNonNull: true,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'createdAt'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'headRefName'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'actor'),
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
        )
      ]),
    ),
  ]),
);
const Issue = _i1.OperationDefinitionNode(
  type: _i1.OperationType.query,
  name: _i1.NameNode(value: 'Issue'),
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
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'number')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
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
          name: _i1.NameNode(value: 'owner'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'avatarUrl'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            )
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'issueOrPullRequest'),
          alias: null,
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'number'),
              value: _i1.VariableNode(name: _i1.NameNode(value: 'number')),
            )
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.InlineFragmentNode(
              typeCondition: _i1.TypeConditionNode(
                  on: _i1.NamedTypeNode(
                name: _i1.NameNode(value: 'Issue'),
                isNonNull: true,
              )),
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FragmentSpreadNode(
                  name: _i1.NameNode(value: 'CommentParts'),
                  directives: [],
                ),
                _i1.FragmentSpreadNode(
                  name: _i1.NameNode(value: 'ReactableParts'),
                  directives: [],
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'closed'),
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
                  name: _i1.NameNode(value: 'viewerCanReact'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'viewerCanUpdate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'timelineItems'),
                  alias: null,
                  arguments: [
                    _i1.ArgumentNode(
                      name: _i1.NameNode(value: 'first'),
                      value: _i1.IntValueNode(value: '30'),
                    ),
                    _i1.ArgumentNode(
                      name: _i1.NameNode(value: 'after'),
                      value:
                          _i1.VariableNode(name: _i1.NameNode(value: 'cursor')),
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
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'IssueComment'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'CommentParts'),
                              directives: [],
                            ),
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'ReactableParts'),
                              directives: [],
                            ),
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'ReferencedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'ReferencedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'RenamedTitleEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name:
                                  _i1.NameNode(value: 'RenamedTitleEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'ClosedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'ClosedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'ReopenedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'ReopenedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'CrossReferencedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(
                                  value: 'CrossReferencedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'LabeledEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'LabeledEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'UnlabeledEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'UnlabeledEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'MilestonedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'MilestonedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'DemilestonedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name:
                                  _i1.NameNode(value: 'DemilestonedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'LockedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'LockedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'UnlockedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'UnlockedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'AssignedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'AssignedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'UnassignedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'UnassignedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'SubscribedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'SubscribedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'UnsubscribedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name:
                                  _i1.NameNode(value: 'UnsubscribedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'MentionedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'MentionedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'PinnedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'PinnedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'TransferredEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name:
                                  _i1.NameNode(value: 'TransferredEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                      ]),
                    ),
                  ]),
                ),
              ]),
            ),
            _i1.InlineFragmentNode(
              typeCondition: _i1.TypeConditionNode(
                  on: _i1.NamedTypeNode(
                name: _i1.NameNode(value: 'PullRequest'),
                isNonNull: true,
              )),
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FragmentSpreadNode(
                  name: _i1.NameNode(value: 'CommentParts'),
                  directives: [],
                ),
                _i1.FragmentSpreadNode(
                  name: _i1.NameNode(value: 'ReactableParts'),
                  directives: [],
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'closed'),
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
                  name: _i1.NameNode(value: 'viewerCanReact'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'viewerCanUpdate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'merged'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'additions'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'deletions'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'changedFiles'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'commits'),
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
                  name: _i1.NameNode(value: 'timelineItems'),
                  alias: null,
                  arguments: [
                    _i1.ArgumentNode(
                      name: _i1.NameNode(value: 'first'),
                      value: _i1.IntValueNode(value: '30'),
                    ),
                    _i1.ArgumentNode(
                      name: _i1.NameNode(value: 'after'),
                      value:
                          _i1.VariableNode(name: _i1.NameNode(value: 'cursor')),
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
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'IssueComment'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'CommentParts'),
                              directives: [],
                            ),
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'ReactableParts'),
                              directives: [],
                            ),
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'ReferencedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'ReferencedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'RenamedTitleEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name:
                                  _i1.NameNode(value: 'RenamedTitleEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'ClosedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'ClosedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'ReopenedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'ReopenedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'CrossReferencedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(
                                  value: 'CrossReferencedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'LabeledEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'LabeledEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'UnlabeledEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'UnlabeledEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'MilestonedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'MilestonedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'DemilestonedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name:
                                  _i1.NameNode(value: 'DemilestonedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'LockedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'LockedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'UnlockedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'UnlockedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'AssignedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'AssignedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'UnassignedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'UnassignedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'SubscribedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'SubscribedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'UnsubscribedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name:
                                  _i1.NameNode(value: 'UnsubscribedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'MentionedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'MentionedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'PinnedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'PinnedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'TransferredEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name:
                                  _i1.NameNode(value: 'TransferredEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'PullRequestCommit'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name:
                                  _i1.NameNode(value: 'PullRequestCommitParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'DeployedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'DeployedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(
                                value: 'DeploymentEnvironmentChangedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(
                                  value:
                                      'DeploymentEnvironmentChangedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'HeadRefRestoredEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(
                                  value: 'HeadRefRestoredEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name:
                                _i1.NameNode(value: 'BaseRefForcePushedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(
                                  value: 'BaseRefForcePushedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name:
                                _i1.NameNode(value: 'HeadRefForcePushedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(
                                  value: 'HeadRefForcePushedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'ReviewRequestedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(
                                  value: 'ReviewRequestedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(
                                value: 'ReviewRequestRemovedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(
                                  value: 'ReviewRequestRemovedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'ReviewDismissedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(
                                  value: 'ReviewDismissedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'PullRequestReview'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name:
                                  _i1.NameNode(value: 'PullRequestReviewParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'MergedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(value: 'MergedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                        _i1.InlineFragmentNode(
                          typeCondition: _i1.TypeConditionNode(
                              on: _i1.NamedTypeNode(
                            name: _i1.NameNode(value: 'HeadRefDeletedEvent'),
                            isNonNull: true,
                          )),
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FragmentSpreadNode(
                              name: _i1.NameNode(
                                  value: 'HeadRefDeletedEventParts'),
                              directives: [],
                            )
                          ]),
                        ),
                      ]),
                    ),
                  ]),
                ),
              ]),
            ),
          ]),
        ),
      ]),
    )
  ]),
);
const document = _i1.DocumentNode(definitions: [
  CommentParts,
  ReactionConnectionParts,
  ReactableParts,
  ReferencedEventParts,
  RenamedTitleEventParts,
  ClosedEventParts,
  ReopenedEventParts,
  CrossReferencedEventParts,
  LabeledEventParts,
  UnlabeledEventParts,
  MilestonedEventParts,
  DemilestonedEventParts,
  LockedEventParts,
  UnlockedEventParts,
  AssignedEventParts,
  UnassignedEventParts,
  SubscribedEventParts,
  UnsubscribedEventParts,
  MentionedEventParts,
  PinnedEventParts,
  TransferredEventParts,
  PullRequestCommitParts,
  DeployedEventParts,
  DeploymentEnvironmentChangedEventParts,
  HeadRefRestoredEventParts,
  BaseRefForcePushedEventParts,
  HeadRefForcePushedEventParts,
  ReviewRequestedEventParts,
  ReviewRequestRemovedEventParts,
  ReviewDismissedEventParts,
  PullRequestReviewParts,
  MergedEventParts,
  HeadRefDeletedEventParts,
  Issue,
]);
