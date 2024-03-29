
import 'package:frontend_tfg/translations/ca.translations.dart';
import 'package:frontend_tfg/translations/en.translations.dart';
import 'package:frontend_tfg/translations/es.translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>>
  translations =
  {
    'en_US' : en,
    'es' : es,
    'ca': ca
  };
}