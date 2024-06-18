import 'package:flutter/material.dart';
import 'package:imtihon/screen/widgets/classic_car_card.dart';
import 'package:imtihon/screen/widgets/custom_card_with_row.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View All Screen'),
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
