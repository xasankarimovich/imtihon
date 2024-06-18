import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imtihon/screen/messages/views/widgets/search_view_delegate.dart';

class Announcments extends StatefulWidget {
  const Announcments({super.key});

  @override
  State<Announcments> createState() => _AnnouncmentsState();
}

class _AnnouncmentsState extends State<Announcments> {
  List<String> data = [
    "BMW",
    "MERCEDES",
    "MAZDA",
    "PAGANI",
    "LAMBORGINI",
    "LAMBORGINI",
    "PORCHE",
    "BUGATTI",
    "ASTON MARTIN",
    "SKYLINE",
    "TOYOTA",
    "SUBARU",
  ];
  List filteredData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(44, 160, 187, 244),
                borderRadius: BorderRadius.circular(30)),
            child: ListTile(
              title: const Text("Search User"),
              trailing: SvgPicture.asset("assets/svg_icons/search.svg"),
            ),
          ),
          onTap: () async {
            String? result = await showSearch(
              context: context,
              delegate: SearchViewDelegate(data),
            );
            if (result != null) filteredData.add(result);
            setState(() {});
          },
        ),
      ),
    );
  }
}
