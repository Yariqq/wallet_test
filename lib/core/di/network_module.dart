import 'package:cherrypick/cherrypick.dart';
import 'package:dio_http/dio_http.dart';
import 'package:wallet_app/core/network/content_type_interceptors.dart';

class NetworkModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<BaseOptions>()
        .toProvide(() => BaseOptions(
              baseUrl: currentScope.resolve<String>(named: 'baseUrl'),
              connectTimeout:
                  currentScope.resolve<int>(named: 'connectionTimeout'),
              receiveTimeout:
                  currentScope.resolve<int>(named: 'receiveTimeout'),
              sendTimeout: currentScope.resolve<int>(named: 'sendTimeout'),
            ))
        .singleton();

    bind<Dio>().toProvide(() {
      final dio = Dio(currentScope.resolve<BaseOptions>())
        ..interceptors.addAll([ContentTypeInterceptors()]);
      return dio;
    }).singleton();
  }
}
