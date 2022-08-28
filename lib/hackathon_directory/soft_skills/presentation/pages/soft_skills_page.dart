import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/bloc/soft_skills_bloc.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/bloc/soft_skills_event.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/bloc/soft_skills_state.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/widgets/main_page_content.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/widgets/profile_page_content.dart';

class SoftSkillsPage extends StatelessWidget {
  const SoftSkillsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SoftSkillsBloc>(
      create: (context) =>
          CherryPick.openScope(scopeName: 'appScope').resolve<SoftSkillsBloc>()
            ..add(const SoftSkillsEvent.getData()),
      child: BlocConsumer<SoftSkillsBloc, SoftSkillsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                state.model.index == 0 ? 'Choose recruiter' : 'Profile',
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xFF000616),
                ),
              ),
            ),
            body: state is LoadingState
                ? const Center(child: CircularProgressIndicator())
                : state.model.index == 0
                    ? MainPageContent(recruiters: state.model.recruiters)
                    : ProfilePageContent(candidate: state.model.user),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Main',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: state.model.index,
              onTap: (value) {
                BlocProvider.of<SoftSkillsBloc>(context)
                    .add(SoftSkillsEvent.changeTab(value));
              },
            ),
          );
        },
      ),
    );
  }
}
