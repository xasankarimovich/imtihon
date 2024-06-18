
import 'package:flutter/material.dart';
import 'package:imtihon/screen/widgets/f1_card.dart';

class F1Screen extends StatefulWidget {
  const F1Screen({super.key});

  @override
  State<F1Screen> createState() => _F1ScreenState();
}

class _F1ScreenState extends State<F1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formula 1 Car')),
      body: const F1Card(),
    );
  }
}
