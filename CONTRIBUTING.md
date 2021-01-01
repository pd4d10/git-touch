# Contributing

## Repository structure

```sh
lib
├── main.dart # App entry
├── graphql
│   ├── # GraphQL queries
├── models
│   ├── # Provider models and other JSON models
├── router.dart # Routers here
├── scaffolds
│   ├── # Several scaffolds for reducing boilerplate code
├── screens
│   ├── gh_xxx.dart # GitHub screens
│   ├── bb_xxx.dart # Bitbucket screens
│   ├── gl_xxx.dart # GitLab screens
│   ├── gt_xxx.dart # Gitea screens
│   └── # File with no prefix: common screens
├── utils
│   ├── # Utilities
├── widgets
│   ├── # Reusable widgets
└── l10n
    └── # Arb Files (translation mappings)
```

## Adding Translations

- Use the [Flutter Intl](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl) extension. See this [demo](https://twitter.com/localizely/status/1255175275454881793) to get a better idea.

- You can find the keywords to be translated in any of the existing `.arb` files. To add a new language, all you have to do is copy the `json` from one of the files and replace the `value` of the `key` with the correct translation. Create the new `.arb` file for the new language using the extension.

- To add a new sentence/phrase to be translated, use the extension and proceed as indicated by the demo. Use of extension is recommended as it adds the sentence/phrase to all the `.arb` files instead of having to add them to every file manually.

Feel free to open an issue to discuss it if you get stuck.
