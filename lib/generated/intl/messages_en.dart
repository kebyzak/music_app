// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyAMemberSignIn":
            MessageLookupByLibrary.simpleMessage("Уже есть аккаунт? Войти"),
        "clickToSeeStories": MessageLookupByLibrary.simpleMessage("Истории"),
        "copyLink": MessageLookupByLibrary.simpleMessage("Скопировать ссылку"),
        "dontHaveAccountCreateOne": MessageLookupByLibrary.simpleMessage(
            "Нет аккаунта? Зарегистрируйтесь!"),
        "email": MessageLookupByLibrary.simpleMessage("Эл.почта"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка"),
        "letsGo": MessageLookupByLibrary.simpleMessage("Поехали!"),
        "loginOrPasswordIsIncorrect": MessageLookupByLibrary.simpleMessage(
            "Неправильный пароль или электронная почта."),
        "name": MessageLookupByLibrary.simpleMessage("Имя"),
        "noPermission": MessageLookupByLibrary.simpleMessage("Нет доступа"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "qr": MessageLookupByLibrary.simpleMessage("QR"),
        "signIn": MessageLookupByLibrary.simpleMessage("Войти"),
        "signOut": MessageLookupByLibrary.simpleMessage("Выйти"),
        "signUp": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "splashText": MessageLookupByLibrary.simpleMessage(
            "Музыка - это состояние души."),
        "unknownState": MessageLookupByLibrary.simpleMessage("Unknown state")
      };
}
