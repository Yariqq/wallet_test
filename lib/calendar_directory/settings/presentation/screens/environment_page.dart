import 'package:flutter/material.dart';

import '../widgets/create_category_content.dart';
import 'edit_categories_page.dart';

class EnvironmentPage extends StatelessWidget {
  const EnvironmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Environment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditCategoriesPage()));
                  },
                  child: const Center(
                    child: Text(
                      'Edit categories',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    _showCreateCategoryBottomSheet(context);
                  },
                  child: const Center(
                    child: Text(
                      'Create category',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (builderContext) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).viewPadding.top,
          ),
          child: const SingleChildScrollView(
            child: SafeArea(
              child: CreateCategoryContent(),
            ),
          ),
        );
      },
    );
  }
}
