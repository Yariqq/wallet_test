import 'package:cherrypick/cherrypick.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/mappers/soft_skills_mapper.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/data/source/soft_skills_data_source.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/gateway/soft_skills_gateway.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/domain/usecases/get_soft_skills_usecase.dart';

import '../../data/gateway/soft_skills_gateway_impl.dart';
import '../../data/source/local/local_soft_skills_data_source.dart';

class SoftSkillsModule extends Module {
  @override
  void builder(Scope currentScope) {
    bind<SoftSkillsMapper>().toInstance(SoftSkillsMapper());

    bind<SoftSkillsDataSource>().toProvide(() {
      if (currentScope.resolve<bool>(named: 'isMockMode')) {
        return LocalSoftSkillsDataSource();
      } else {
        //final baseUrl = currentScope.resolve<String>(named: 'baseUrl');
        //TODO:- implement remote data source
        return LocalSoftSkillsDataSource();
      }
    }).singleton();

    bind<SoftSkillsGateway>().toProvide(
      () => SoftSkillsGatewayImpl(
        softSkillsDataSource: currentScope.resolve<SoftSkillsDataSource>(),
        softSkillsMapper: currentScope.resolve<SoftSkillsMapper>(),
      ),
    );

    bind<GetSoftSkillsUseCase>().toProvide(
      () => GetSoftSkillsUseCase(
        softSkillsGateway: currentScope.resolve<SoftSkillsGateway>(),
      ),
    );
  }
}
