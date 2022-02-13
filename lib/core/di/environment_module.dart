import 'package:cherrypick/cherrypick.dart';

class EnvironmentModule extends Module {
  final bool isMock;
  final String baseUrl;
  final int connectionTimeout;
  final int receiveTimeout;
  final int sendTimeout;

  EnvironmentModule({
    required this.isMock,
    required this.baseUrl,
    required this.connectionTimeout,
    required this.receiveTimeout,
    required this.sendTimeout,
  });

  @override
  void builder(Scope currentScope) {
    bind<bool>().withName('isMockMode').toInstance(isMock);

    bind<String>().withName('baseUrl').toInstance(baseUrl);

    bind<int>().withName('connectionTimeout').toInstance(connectionTimeout);

    bind<int>().withName('receiveTimeout').toInstance(receiveTimeout);

    bind<int>().withName('sendTimeout').toInstance(sendTimeout);
  }
}
