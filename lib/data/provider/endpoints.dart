class Endpoints {
  static const String ipApiDevelopment = 'http://localhost:3001';
  static const String ipApiProduction = 'https://apieosidcalculator.ftlbcn.com';

  static const String environment = String.fromEnvironment('env', defaultValue: 'development');

  static String get ipApi {
    switch (environment) {
      case 'production':
        return ipApiProduction;
      case 'development':
      default:
        return ipApiDevelopment;
    }
  }
}


// flutter run --dart-define=ipApi=http://localhost:40000