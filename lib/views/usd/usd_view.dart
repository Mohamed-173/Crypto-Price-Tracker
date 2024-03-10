import 'package:flutter/material.dart';

class UsdView extends StatelessWidget {
  const UsdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Details of USD'),
      ),
      body: const Center(child: Text("USD Page")),
    );
  }
}
