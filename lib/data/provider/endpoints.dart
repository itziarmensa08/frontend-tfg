class Endpoints {
  static const String ipApi = String.fromEnvironment('ipApi',
      defaultValue: 'http://localhost:3000');
}

// flutter run --dart-define=ipApi=http://localhost:40000 