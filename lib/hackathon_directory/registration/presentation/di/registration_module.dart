import 'package:cherrypick/cherrypick.dart';
import 'package:dio_http/dio_http.dart';
import 'package:wallet_app/hackathon_directory/registration/data/gateway/registration_gateway_impl.dart';
import 'package:wallet_app/hackathon_directory/registration/data/source/remote/api/registration_api.dart';
import 'package:wallet_app/hackathon_directory/registration/domain/gateway/registration_gateway.dart';
import 'package:wallet_app/hackathon_directory/registration/domain/usecase/register_usecase.dart';
import 'package:wallet_app/hackathon_directory/registration/presentation/bloc/registration_bloc.dart';

class RegistrationModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<RegistrationGateway>().toProvide(() {
      final baseUrl = currentScope.resolve<String>(named: 'baseUrl');

      return RegistrationGatewayImpl(
        registrationApi: RegistrationApi(
          currentScope.resolve<Dio>(),
          baseUrl: baseUrl,
        ),
      );
    });

    bind<RegisterUseCase>().toProvide(
      () => RegisterUseCase(
        registrationGateway: currentScope.resolve<RegistrationGateway>(),
      ),
    );

    bind<RegistrationBloc>().toProvide(() => RegistrationBloc(
      currentScope.resolve<RegisterUseCase>(),
    ));
  }
}
