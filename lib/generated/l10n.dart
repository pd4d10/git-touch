// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: 'The News tab',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: 'The Notification tab',
      args: [],
    );
  }

  /// `Trending`
  String get trending {
    return Intl.message(
      'Trending',
      name: 'trending',
      desc: 'Trending',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: 'The Search tab',
      args: [],
    );
  }

  /// `Me`
  String get me {
    return Intl.message(
      'Me',
      name: 'me',
      desc: 'The Me tab',
      args: [],
    );
  }

  /// `Participating`
  String get participating {
    return Intl.message(
      'Participating',
      name: 'participating',
      desc: 'The participating Tab',
      args: [],
    );
  }

  /// `Repositories`
  String get repositories {
    return Intl.message(
      'Repositories',
      name: 'repositories',
      desc: 'repository text',
      args: [],
    );
  }

  /// `Unfollow`
  String get unfollow {
    return Intl.message(
      'Unfollow',
      name: 'unfollow',
      desc: 'unfollow someone',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: 'follow someone',
      args: [],
    );
  }

  /// `Stars`
  String get stars {
    return Intl.message(
      'Stars',
      name: 'stars',
      desc: 'stars on a repo',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: 'followers for a person',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: 'people followed by a person',
      args: [],
    );
  }

  /// `Events`
  String get events {
    return Intl.message(
      'Events',
      name: 'events',
      desc: 'events for a user',
      args: [],
    );
  }

  /// `Gists`
  String get gists {
    return Intl.message(
      'Gists',
      name: 'gists',
      desc: 'gists for a user',
      args: [],
    );
  }

  /// `Organizations`
  String get organizations {
    return Intl.message(
      'Organizations',
      name: 'organizations',
      desc: 'organizations for a user',
      args: [],
    );
  }

  /// `Members`
  String get members {
    return Intl.message(
      'Members',
      name: 'members',
      desc: 'members of an organization',
      args: [],
    );
  }

  /// `popular repositories`
  String get popularRepositories {
    return Intl.message(
      'popular repositories',
      name: 'popularRepositories',
      desc: 'popular repositories',
      args: [],
    );
  }

  /// `pinned repositories`
  String get pinnedRepositories {
    return Intl.message(
      'pinned repositories',
      name: 'pinnedRepositories',
      desc: 'pinned repositories',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'settings',
      args: [],
    );
  }

  /// `system`
  String get system {
    return Intl.message(
      'system',
      name: 'system',
      desc: 'system',
      args: [],
    );
  }

  /// `GitHub status`
  String get githubStatus {
    return Intl.message(
      'GitHub status',
      name: 'githubStatus',
      desc: 'github status',
      args: [],
    );
  }

  /// `Review Permissions`
  String get reviewPermissions {
    return Intl.message(
      'Review Permissions',
      name: 'reviewPermissions',
      desc: 'review Permissions',
      args: [],
    );
  }

  /// `GitLab status`
  String get gitlabStatus {
    return Intl.message(
      'GitLab status',
      name: 'gitlabStatus',
      desc: 'GitLab status',
      args: [],
    );
  }

  /// `Gitea status`
  String get giteaStatus {
    return Intl.message(
      'Gitea status',
      name: 'giteaStatus',
      desc: 'Gitea status',
      args: [],
    );
  }

  /// `Switch accounts`
  String get switchAccounts {
    return Intl.message(
      'Switch accounts',
      name: 'switchAccounts',
      desc: 'Switch accounts',
      args: [],
    );
  }

  /// `Brightness`
  String get brightness {
    return Intl.message(
      'Brightness',
      name: 'brightness',
      desc: 'brightness',
      args: [],
    );
  }

  /// `Follow System`
  String get followSystem {
    return Intl.message(
      'Follow System',
      name: 'followSystem',
      desc: 'follow systems setting',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: 'light mode',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: 'dark mode',
      args: [],
    );
  }

  /// `Scaffold Theme`
  String get scaffoldTheme {
    return Intl.message(
      'Scaffold Theme',
      name: 'scaffoldTheme',
      desc: 'Kind of theme - cupertino or material',
      args: [],
    );
  }

  /// `Cupertino`
  String get cupertino {
    return Intl.message(
      'Cupertino',
      name: 'cupertino',
      desc: 'Cupertino scaffold theme',
      args: [],
    );
  }

  /// `Material`
  String get material {
    return Intl.message(
      'Material',
      name: 'material',
      desc: 'Material scaffold theme',
      args: [],
    );
  }

  /// `Code Theme`
  String get codeTheme {
    return Intl.message(
      'Code Theme',
      name: 'codeTheme',
      desc: 'code theme',
      args: [],
    );
  }

  /// `Markdown Render Engine`
  String get markdownRenderEngine {
    return Intl.message(
      'Markdown Render Engine',
      name: 'markdownRenderEngine',
      desc: 'flutter or webview rendering for markdown',
      args: [],
    );
  }

  /// `Flutter`
  String get flutter {
    return Intl.message(
      'Flutter',
      name: 'flutter',
      desc: 'render flutter for markdown',
      args: [],
    );
  }

  /// `WebView`
  String get webview {
    return Intl.message(
      'WebView',
      name: 'webview',
      desc: 'render webview for markdown',
      args: [],
    );
  }

  /// `feedback`
  String get feedback {
    return Intl.message(
      'feedback',
      name: 'feedback',
      desc: 'provide feedback',
      args: [],
    );
  }

  /// `Submit an issue`
  String get submitAnIssue {
    return Intl.message(
      'Submit an issue',
      name: 'submitAnIssue',
      desc: 'submit issue for app',
      args: [],
    );
  }

  /// `Rate This App`
  String get rateThisApp {
    return Intl.message(
      'Rate This App',
      name: 'rateThisApp',
      desc: 'rate the app',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: 'Email to report issues',
      args: [],
    );
  }

  /// `about`
  String get about {
    return Intl.message(
      'about',
      name: 'about',
      desc: 'about section',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: 'app version',
      args: [],
    );
  }

  /// `Source Code`
  String get sourceCode {
    return Intl.message(
      'Source Code',
      name: 'sourceCode',
      desc: 'source code for app',
      args: [],
    );
  }

  /// `Repository`
  String get repository {
    return Intl.message(
      'Repository',
      name: 'repository',
      desc: 'Repository screen title',
      args: [],
    );
  }

  /// `Repository Actions`
  String get repositoryActions {
    return Intl.message(
      'Repository Actions',
      name: 'repositoryActions',
      desc: 'Repository Actions',
      args: [],
    );
  }

  /// `Projects`
  String get projects {
    return Intl.message(
      'Projects',
      name: 'projects',
      desc: 'projects',
      args: [],
    );
  }

  /// `Releases`
  String get releases {
    return Intl.message(
      'Releases',
      name: 'releases',
      desc: 'releases',
      args: [],
    );
  }

  /// `Watchers`
  String get watchers {
    return Intl.message(
      'Watchers',
      name: 'watchers',
      desc: 'watchers',
      args: [],
    );
  }

  /// `Forks`
  String get forks {
    return Intl.message(
      'Forks',
      name: 'forks',
      desc: 'forks',
      args: [],
    );
  }

  /// `Issues`
  String get issues {
    return Intl.message(
      'Issues',
      name: 'issues',
      desc: 'issues',
      args: [],
    );
  }

  /// `Pull requests`
  String get pullRequests {
    return Intl.message(
      'Pull requests',
      name: 'pullRequests',
      desc: 'Pull Requests',
      args: [],
    );
  }

  /// `Commits`
  String get commits {
    return Intl.message(
      'Commits',
      name: 'commits',
      desc: 'Commits',
      args: [],
    );
  }

  /// `Branches`
  String get branches {
    return Intl.message(
      'Branches',
      name: 'branches',
      desc: 'branches',
      args: [],
    );
  }

  /// `Contributors`
  String get contributors {
    return Intl.message(
      'Contributors',
      name: 'contributors',
      desc: 'contributors',
      args: [],
    );
  }

  /// `Unread`
  String get unread {
    return Intl.message(
      'Unread',
      name: 'unread',
      desc: 'unread',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: 'all',
      args: [],
    );
  }

  /// `Developers`
  String get developers {
    return Intl.message(
      'Developers',
      name: 'developers',
      desc: 'developers',
      args: [],
    );
  }

  /// `Explore`
  String get explore {
    return Intl.message(
      'Explore',
      name: 'explore',
      desc: 'explore',
      args: [],
    );
  }

  /// `Teams`
  String get teams {
    return Intl.message(
      'Teams',
      name: 'teams',
      desc: 'teams',
      args: [],
    );
  }

  /// `File`
  String get file {
    return Intl.message(
      'File',
      name: 'file',
      desc: 'file',
      args: [],
    );
  }

  /// `Files`
  String get files {
    return Intl.message(
      'Files',
      name: 'files',
      desc: 'file plural',
      args: [],
    );
  }

  /// `Actions`
  String get actions {
    return Intl.message(
      'Actions',
      name: 'actions',
      desc: 'actions',
      args: [],
    );
  }

  /// `Groups`
  String get groups {
    return Intl.message(
      'Groups',
      name: 'groups',
      desc: 'groups',
      args: [],
    );
  }

  /// `Merge Requests`
  String get mergeRequests {
    return Intl.message(
      'Merge Requests',
      name: 'mergeRequests',
      desc: 'Merge request',
      args: [],
    );
  }

  /// `Activity`
  String get activity {
    return Intl.message(
      'Activity',
      name: 'activity',
      desc: 'activity',
      args: [],
    );
  }

  /// `Project`
  String get project {
    return Intl.message(
      'Project',
      name: 'project',
      desc: 'project',
      args: [],
    );
  }

  /// `Select account`
  String get selectAccount {
    return Intl.message(
      'Select account',
      name: 'selectAccount',
      desc: 'select account message',
      args: [],
    );
  }

  /// `Remove account`
  String get removeAccount {
    return Intl.message(
      'Remove account',
      name: 'removeAccount',
      desc: 'remove account',
      args: [],
    );
  }

  /// `Something bad happens:`
  String get somethingBadHappens {
    return Intl.message(
      'Something bad happens:',
      name: 'somethingBadHappens',
      desc: 'error message',
      args: [],
    );
  }

  /// `GitHub Account`
  String get githubAccount {
    return Intl.message(
      'GitHub Account',
      name: 'githubAccount',
      desc: 'Gitea Account',
      args: [],
    );
  }

  /// `GitTouch needs these permissions`
  String get permissionRequiredMessage {
    return Intl.message(
      'GitTouch needs these permissions',
      name: 'permissionRequiredMessage',
      desc: 'Permission Required Message',
      args: [],
    );
  }

  /// `Not Found`
  String get notFoundMessage {
    return Intl.message(
      'Not Found',
      name: 'notFoundMessage',
      desc: 'Not found page header',
      args: [],
    );
  }

  /// `Woops, This page is not implemented yet`
  String get notFoundTextDisplay {
    return Intl.message(
      'Woops, This page is not implemented yet',
      name: 'notFoundTextDisplay',
      desc: 'Not found error message',
      args: [],
    );
  }

  /// `GitLab Account`
  String get gitlabAccount {
    return Intl.message(
      'GitLab Account',
      name: 'gitlabAccount',
      desc: 'Gitlab Account',
      args: [],
    );
  }

  /// `Bitbucket Account`
  String get bitbucketAccount {
    return Intl.message(
      'Bitbucket Account',
      name: 'bitbucketAccount',
      desc: 'Bitbucket Account',
      args: [],
    );
  }

  /// `Long Press to remove account`
  String get longPressToRemoveAccount {
    return Intl.message(
      'Long Press to remove account',
      name: 'longPressToRemoveAccount',
      desc: 'Long Press to remove account',
      args: [],
    );
  }

  /// `Gitee Account`
  String get giteaAccount {
    return Intl.message(
      'Gitee Account',
      name: 'giteaAccount',
      desc: 'Gitea Account',
      args: [],
    );
  }

  /// `Gitee Account`
  String get giteeAccount {
    return Intl.message(
      'Gitee Account',
      name: 'giteeAccount',
      desc: 'Gitee Account',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: 'user',
      args: [],
    );
  }

  /// `Group`
  String get group {
    return Intl.message(
      'Group',
      name: 'group',
      desc: 'group',
      args: [],
    );
  }

  /// `Issue`
  String get issue {
    return Intl.message(
      'Issue',
      name: 'issue',
      desc: 'issue',
      args: [],
    );
  }

  /// `Code`
  String get code {
    return Intl.message(
      'Code',
      name: 'code',
      desc: 'Code',
      args: [],
    );
  }

  /// `Project Actions`
  String get projectActions {
    return Intl.message(
      'Project Actions',
      name: 'projectActions',
      desc: 'Project Actions',
      args: [],
    );
  }

  /// `SYNTAX HIGHLIGHTING`
  String get syntaxHighlighting {
    return Intl.message(
      'SYNTAX HIGHLIGHTING',
      name: 'syntaxHighlighting',
      desc: 'Syntax Highlighting',
      args: [],
    );
  }

  /// `Font Family`
  String get fontFamily {
    return Intl.message(
      'Font Family',
      name: 'fontFamily',
      desc: 'Font Family',
      args: [],
    );
  }

  /// `Font Size`
  String get fontSize {
    return Intl.message(
      'Font Size',
      name: 'fontSize',
      desc: 'font size',
      args: [],
    );
  }

  /// `FONT STYLE`
  String get fontStyle {
    return Intl.message(
      'FONT STYLE',
      name: 'fontStyle',
      desc: 'font style',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
