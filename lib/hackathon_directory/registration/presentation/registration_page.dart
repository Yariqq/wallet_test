import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallet_app/hackathon_directory/registration/presentation/bloc/registration_bloc.dart';
import 'package:wallet_app/hackathon_directory/registration/presentation/bloc/registration_event.dart';
import 'package:wallet_app/hackathon_directory/registration/presentation/bloc/registration_state.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/soft_skills_page.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: BlocProvider<RegistrationBloc>(
          create: (context) => CherryPick.openScope(scopeName: 'appScope')
              .resolve<RegistrationBloc>(),
          child: BlocConsumer<RegistrationBloc, RegistrationState>(
            listener: (context, state) {
              if (state is SuccessRegistrationState) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SoftSkillsPage()));
              }
            },
            builder: (context, state) {
              if (state is LoadingState || state is SuccessRegistrationState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 48),
                      SvgPicture.asset(
                        'assets/icons/sign_in_logo.svg',
                      ),
                      const SizedBox(height: 42),
                      TextField(
                        controller: loginController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Login',
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Checkbox(
                            value: state.model.isHr,
                            visualDensity: const VisualDensity(horizontal: -4),
                            onChanged: (value) {
                              BlocProvider.of<RegistrationBloc>(context).add(
                                  RegistrationEvent.changeCheckboxValue(
                                      value!));
                            },
                          ),
                          const SizedBox(width: 4),
                          const Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Text(
                              'Register as HR',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF000616),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          BlocProvider.of<RegistrationBloc>(context).add(
                            RegistrationEvent.register(
                              login: loginController.text,
                              password: passwordController.text,
                              role: state.model.isHr,
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
