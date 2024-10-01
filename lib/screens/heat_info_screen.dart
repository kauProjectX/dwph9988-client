import 'package:flutter/material.dart';

class HeatInfoScreen extends StatelessWidget {
  const HeatInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Heat Info Screen'),
        ),
      ),
    );
  }
}
