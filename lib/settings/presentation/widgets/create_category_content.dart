import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/calendar/domain/model/category.dart';
import 'package:wallet_app/calendar/domain/usecase/get_available_categories_usecase.dart';
import 'package:wallet_app/core/utils/loading_indicator.dart';
import 'package:wallet_app/settings/domain/usecase/add_category_usecase.dart';
import 'package:wallet_app/settings/presentation/bloc/settings_bloc.dart';

class CreateCategoryContent extends StatefulWidget {
  const CreateCategoryContent({Key? key}) : super(key: key);

  @override
  _CreateCategoryContentState createState() => _CreateCategoryContentState();
}

class _CreateCategoryContentState extends State<CreateCategoryContent> {
  final appContainer = CherryPick.openRootScope().openSubScope('appScope');
  final TextEditingController _newCategoryController = TextEditingController();

  @override
  void dispose() {
    _newCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc(
        appContainer.resolve<GetAvailableCategoriesUseCase>(),
        appContainer.resolve<AddCategoryUseCase>(),
      )..add(FetchCategoriesEvent()),
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state.eventState is AddingCategorySuccessEventState) {
            Navigator.pop(context);
            _buildSuccessDialog(context);
          }
        },
        builder: (context, state) {
          if (state.eventState is! LoadingEventState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Create category',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      IconButton(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  const SizedBox(height: 10),
                  _buildAvailableCategoriesText(state.data),
                  const SizedBox(height: 10),
                  _buildNewCategoryTextField(),
                  const SizedBox(height: 20),
                  _buildCreateButton(context),
                ],
              ),
            );
          }

          return const SizedBox(
            height: 150,
            child: LoadingIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildAvailableCategoriesText(List<Category> availableCategories) {
    return availableCategories.isEmpty
        ? const Text(
            'Available categories: no categories yet',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          )
        : Text(
            'Available categories: '
                '${availableCategories.map((category) => category.name)
                .toList().join(', ')}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          );
  }

  Widget _buildNewCategoryTextField() {
    return TextFormField(
      controller: _newCategoryController,
      decoration: const InputDecoration(
        labelText: 'Category name',
        labelStyle: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildCreateButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          context
              .read<SettingsBloc>()
              .add(AddCategoryEvent(name: _newCategoryController.text));
        },
        child: const Center(
          child: Text(
            'Create',
          ),
        ),
      ),
    );
  }

  Future _buildSuccessDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (builderContext) {
          return CupertinoAlertDialog(
            title: const Text('Success'),
            content: const Text('Category added successfully!'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(builderContext);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
    );
  }
}
