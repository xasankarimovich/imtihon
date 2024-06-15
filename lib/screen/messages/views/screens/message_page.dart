import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:imtihon/screen/messages/views/screens/page_details.dart';
import 'package:imtihon/screen/messages/views/widgets/search_view_delegate.dart';
import 'package:imtihon/utils/extension/extension.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
        title: const Text('Chats'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(44, 160, 187, 244),
                    borderRadius: BorderRadius.circular(30)),
                child: ListTile(
                  title: const Text("Search Message"),
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
         20.boxH(),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const PageDetails(),
                            ),
                          );
                        },
                      );
                    },
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
                      ),
                      radius: 51,
                    ),
                    title: const Text("Guguseradeal"),
                    subtitle: const Text("You Sent a Sticker"),
                  );
                }),
          )
        ],
      ),
    );
  }
}
