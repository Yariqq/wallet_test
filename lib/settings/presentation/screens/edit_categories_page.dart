import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/calendar/domain/model/category.dart';
import 'package:wallet_app/calendar/domain/usecase/get_available_categories_usecase.dart';
import 'package:wallet_app/core/utils/loading_indicator.dart';
import 'package:wallet_app/settings/domain/usecase/add_category_usecase.dart';
import 'package:wallet_app/settings/domain/usecase/delete_category_usecase.dart';
import 'package:wallet_app/settings/domain/usecase/edit_category_usecase.dart';
import 'package:wallet_app/settings/presentation/bloc/settings_bloc.dart';

class EditCategoriesPage extends StatelessWidget {
  final appContainer = CherryPick.openRootScope().openSubScope('appScope');

  EditCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsBloc(
        appContainer.resolve<GetAvailableCategoriesUseCase>(),
        appContainer.resolve<AddCategoryUseCase>(),
        appContainer.resolve<DeleteCategoryUseCase>(),
        appContainer.resolve<EditCategoryUseCase>(),
      )..add(FetchCategoriesEvent()),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Edit categories'),
            ),
            body: state.eventState is LoadingEventState
                ? const LoadingIndicator()
                : _buildBody(state.data),
          );
        },
      ),
    );
  }

  Widget _buildBody(List<Category> data) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: data.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return _editCategoryCell(context, data[index]);
          },
        ),
      ),
    );
  }

  Widget _editCategoryCell(BuildContext context, Category category) {
    return Row(
      children: [
        Expanded(
          child: Text(category.name),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {
            context
                .read<SettingsBloc>()
                .add(DeleteCategoryEvent(categoryId: category.id));
          },
          icon: const Icon(Icons.delete_forever_outlined),
        ),
      ],
    );
  }
}
