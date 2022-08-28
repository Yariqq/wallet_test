import 'package:cherrypick/cherrypick.dart';
import 'package:dio_http/dio_http.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/mappers/soft_skills_mapper.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/mappers/candidate_mapper.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/remote/api/soft_skills_api.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/gateway/soft_skills_gateway.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/usecases/get_soft_skills_usecase.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/usecases/get_user_usecase.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/bloc/soft_skills_bloc.dart';

import '../../data/gateway/soft_skills_gateway_impl.dart';

class SoftSkillsModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<SoftSkillsMapper>().toInstance(SoftSkillsMapper());
    bind<CandidateMapper>().toInstance(CandidateMapper());

    bind<SoftSkillsGateway>().toProvide(
      () {
        final baseUrl = currentScope.resolve<String>(named: 'baseUrl');

        return SoftSkillsGatewayImpl(
          softSkillsApi: SoftSkillsApi(
            currentScope.resolve<Dio>(),
            baseUrl: baseUrl,
          ),
          softSkillsMapper: currentScope.resolve<SoftSkillsMapper>(),
          userMapper: currentScope.resolve<CandidateMapper>(),
        );
      },
    );

    bind<GetSoftSkillsUseCase>().toProvide(
      () => GetSoftSkillsUseCase(
        softSkillsGateway: currentScope.resolve<SoftSkillsGateway>(),
      ),
    );

    bind<GetUserUseCase>().toProvide(
          () => GetUserUseCase(
        softSkillsGateway: currentScope.resolve<SoftSkillsGateway>(),
      ),
    );

    bind<SoftSkillsBloc>().toProvide(
      () => SoftSkillsBloc(
        currentScope.resolve<GetSoftSkillsUseCase>(),
        currentScope.resolve<GetUserUseCase>(),
      ),
    );
  }
}
