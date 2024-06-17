import 'package:flutter/material.dart';
import 'package:imtihon/screen/widgets/classic_car_card.dart';

class ClassicCarScreen extends StatefulWidget {
  const ClassicCarScreen({super.key});

  @override
  State<ClassicCarScreen> createState() => _ClassicCarScreenState();
}

class _ClassicCarScreenState extends State<ClassicCarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Classic Car')),
      body: const Column(
        children: [ClassCarCard()],
      ),
    );
  }
}
