import 'package:flutter/material.dart';
import 'package:wallet_app/settings/presentation/widgets/create_category_content.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
  late final TextEditingController _sumController;

  @override
  void initState() {
    _sumController = TextEditingController(text: '0,00');
    super.initState();
  }

  @override
  void dispose() {
    _sumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
          child: SingleChildScrollView(
            child: SafeArea(
              child: CreateCategoryContent(

              ),
            ),
          ),
        );
      },
    );
  }
}
