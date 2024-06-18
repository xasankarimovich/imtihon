import 'package:flutter/material.dart';
import 'package:imtihon/screen/widgets/classic_car_card.dart';
import 'package:imtihon/screen/widgets/custom_card_with_row.dart';

class HatchbackScreen extends StatefulWidget {
  const HatchbackScreen({super.key});

  @override
  State<HatchbackScreen> createState() => _HatchbackScreenState();
}

class _HatchbackScreenState extends State<HatchbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hatchback Screen'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ClassCarCard(),
            CustomCardWithRow(),
            CustomCardWithRow(),
            CustomCardWithRow()
          ],
        ),
      ),
    );
  }
}
