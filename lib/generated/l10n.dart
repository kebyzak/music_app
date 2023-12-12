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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Поехали!`
  String get letsGo {
    return Intl.message(
      'Поехали!',
      name: 'letsGo',
      desc: '',
      args: [],
    );
  }

  /// `Эл.почта`
  String get email {
    return Intl.message(
      'Эл.почта',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get signIn {
    return Intl.message(
      'Войти',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Нет аккаунта? Зарегистрируйтесь!`
  String get dontHaveAccountCreateOne {
    return Intl.message(
      'Нет аккаунта? Зарегистрируйтесь!',
      name: 'dontHaveAccountCreateOne',
      desc: '',
      args: [],
    );
  }

  /// `Музыка - это состояние души.`
  String get splashText {
    return Intl.message(
      'Музыка - это состояние души.',
      name: 'splashText',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get name {
    return Intl.message(
      'Имя',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Уже есть аккаунт? Войти`
  String get alreadyAMemberSignIn {
    return Intl.message(
      'Уже есть аккаунт? Войти',
      name: 'alreadyAMemberSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get signUp {
    return Intl.message(
      'Зарегистрироваться',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Неправильный пароль или электронная почта.`
  String get loginOrPasswordIsIncorrect {
    return Intl.message(
      'Неправильный пароль или электронная почта.',
      name: 'loginOrPasswordIsIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Нет доступа`
  String get noPermission {
    return Intl.message(
      'Нет доступа',
      name: 'noPermission',
      desc: '',
      args: [],
    );
  }

  /// `QR`
  String get qr {
    return Intl.message(
      'QR',
      name: 'qr',
      desc: '',
      args: [],
    );
  }

  /// `Скопировать ссылку`
  String get copyLink {
    return Intl.message(
      'Скопировать ссылку',
      name: 'copyLink',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error {
    return Intl.message(
      'Ошибка',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get signOut {
    return Intl.message(
      'Выйти',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Истории`
  String get clickToSeeStories {
    return Intl.message(
      'Истории',
      name: 'clickToSeeStories',
      desc: '',
      args: [],
    );
  }

  /// `Unknown state`
  String get unknownState {
    return Intl.message(
      'Unknown state',
      name: 'unknownState',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
