


import 'package:frontend_tfg/translations/ca_translations.dart';
import 'package:frontend_tfg/translations/en_translations.dart';
import 'package:frontend_tfg/translations/es_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> 
  translations = 
  {
    'en_US' : en,
    'es' : es,
    'ca': ca
  };
}