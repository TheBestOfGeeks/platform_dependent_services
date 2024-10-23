import 'dart:io';

import 'package:platform_dependent_services/models/message_model.dart';

abstract interface class PlatformDependencies {
  final Core core;
  final Messaging messaging;
  final Analytics analytics;
  final Storage storage;

  PlatformDependencies({
    required this.core,
    required this.messaging,
    required this.analytics,
    required this.storage,
  });
}

abstract interface class Service {
  Future<void> init();

  void dispose();
}

abstract interface class Core implements Service {}

abstract interface class Messaging implements Service {
  Future<void> getToken();

  Future<void> requestPermission();

  Stream<String> get onTokenRefresh;

  String? get token;

  Stream<MessageModel> get onForegroundMessage;

  Stream<MessageModel> get onBackroundMessage;
}

abstract interface class Analytics extends Service {}

abstract interface class Storage implements Service {
  Future<void> initReference({required String id});
  Future<void> exportPersonalLogs({required File file});
}
