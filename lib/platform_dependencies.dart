import 'package:platform_dependent_services/models/message_model.dart';

abstract interface class PlatformDependencies {
  final Core core;
  final Messaging messaging;
  final Analytics analytics;
  final Storages storages;

  PlatformDependencies({
    required this.core,
    required this.messaging,
    required this.analytics,
    required this.storages,
  });
}

abstract interface class Service {
  Future<void> init();

  void dispose();
}

abstract interface class Core {}

abstract interface class Messaging implements Service {
  Future<void> getToken();

  Future<void> requestPermission();

  Stream<String> get onTokenRefresh;

  String? get token;

  Stream<MessageModel> get onForegroundMessage;

  Stream<MessageModel> get onBackroundMessage;
}

abstract interface class Analytics extends Service {}

abstract interface class Storages {}