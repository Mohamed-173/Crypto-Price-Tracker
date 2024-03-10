import 'package:flutter/material.dart';

class WrongPathView extends StatelessWidget {
  const WrongPathView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrong Page'),
      ),
      body: const Center(child: Text("Ops Wrong Path")),
    );
  }
}
