
import 'package:flutter/material.dart';

class EmptyContainer extends StatelessWidget {
  final String message;

  const EmptyContainer({required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }

}